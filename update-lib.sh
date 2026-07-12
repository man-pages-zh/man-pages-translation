# update-lib.sh -- shared helpers for the po4a-based update-* scripts.
#
# Sourced (not executed) by update-all / update-po / update-pot / update-release.
#
# Copyright (c) 2015-2026 Boyuan Yang <073plan@gmail.com>
# This file is released into the Public Domain.
#
# Modernization notes
# -------------------
# The deprecated standalone commands po4a-updatepo(1) and po4a-translate(1) have
# been replaced by the unified po4a(1) program, driven by a small configuration.
# A single po4a process handles POT update, PO update and the translated output
# in one pass.
#
# We deliberately generate ONE config per man page and process the pages
# independently, instead of one big project config. A single project config puts
# po4a into "split" mode, where it builds a shared *compendium* across all PO
# files: for the many near-identical pages in this tree (e.g. coreutils
# ls/dir/vdir, the *sum family) that cross-pollinates slightly different
# translations and marks huge numbers of strings fuzzy. Per-file configs keep
# each page isolated and byte-for-byte close to the old per-file workflow.
#
# Because the pages are independent, they are processed in parallel.

_MAN_LANG="zh_CN"

# Number of parallel po4a jobs. Override with e.g. `PO4A_JOBS=4 ./update-all`.
_PO4A_JOBS="${PO4A_JOBS:-$(nproc 2>/dev/null || echo 4)}"

# Absolute path to the internal single-file worker, which lives next to us.
_PO4A_WORKER="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)/_po4a-worker"

# run_po4a MODE
#   Run po4a over every upstream man page (raw/<pkg>/man<N>/<file>), in parallel.
#   MODE is passed verbatim to po4a and selects the phase(s):
#     ""                  -> POT + PO update and translated output (all phases)
#     "--no-translations" -> POT + PO update only (nothing written under src/)
#     "--no-update"       -> translated output only (POT/PO left untouched)
run_po4a() {
    _mode="$1"

    if ! command -v po4a > /dev/null 2>&1; then
        printf 'E: You must install po4a before proceeding!\n' >&2
        exit 1
    fi

    # Discover master man pages and hand them to the worker, $_PO4A_JOBS at a
    # time. Symlinked pages (e.g. raw/coreutils/man1/[.1 -> test.1) are skipped,
    # matching the behavior of the original scripts.
    find raw -mindepth 3 -maxdepth 3 -type f ! -type l -print0 \
        | sort -z \
        | xargs -0 -P "$_PO4A_JOBS" -I '{}' \
              "$_PO4A_WORKER" "$_MAN_LANG" "$_mode" '{}'
}
