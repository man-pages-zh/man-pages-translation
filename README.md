# man-pages-translation: working repo for Chinese man page translation

This is the working repository for Chinese man pages translation.
After any modification, run `./update-all` script to sync
status of all files.

After reaching a milestone, the outcome is expected to be exported
to the [manpages-zh](https://github.com/man-pages-zh/manpages-zh)
project.

# Guide for translators

Go to `po/` directory and pick up the `po` file you like.
Translate it properly, then come and send your work back.

## Special handling: coreutils

The coreutils translation mainly takes place at [TP Website](https://translationproject.org/team/zh_CN.html).
When making translation on the individual man pages, please make
sure that the corresponding translation is already available
in upstream TP translation. Those translations should be kept
the same.

# Guide for admins

You need to install the following software first:

* po4a

This repository uses `po4a` to automate the translation/generation
process. All you need to call is the `./update-all` script to keep
everything up-to-date.

If anyone wants to add a new man page for translation, please
put it under `raw/` directory as others. Then automatic scripts
will take care of them.

Note: consider running `find . -type f -exec sed -i '/^#$/d' {} \;`
for generated POT and PO files.

# Current active translations

* coreutils
* procps
* util-linux (planned)
* man-pages (wishlist)

# Other projects

* [manpages-zh](https://github.com/man-pages-zh/manpages-zh): Storage and main release repo for Chinese man pages.
* [manpages-l10n](https://salsa.debian.org/manpages-l10n-team): A cross-language man page translation project using similar tools (po4a).

# Copyright and License

```
Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.2
or any later version published by the Free Software Foundation;
with no Invariant Sections, no Front-Cover Texts, and no Back-Cover
Texts.
```

To contributors: By submitting patches and Pull Requests to this project,
you agree that your contribution is licensed under the license described
above.
