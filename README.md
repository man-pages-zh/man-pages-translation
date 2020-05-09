# man-pages-translation: working repo for translation

This is the working repository for man pages translation.
After any modification, run `./update-all` script to sync
status of all files.

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
