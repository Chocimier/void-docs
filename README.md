# Void Docs

Welcome to the Void documentation. This repository contains the source data
behind <https://docs.voidlinux.org/>. Contributing to this repository follows
the same protocol as the packages tree. For details, please read
[CONTRIBUTING](./CONTRIBUTING.md).

## Translations

This fork contains translations of documentation.

To contribute:

1. Coordinate within this repo issue dedicated for language, create one if needed.
2. Add language to `languages` in `res/po4a.sh` if not yet there.
3. Build as described above, this updates original text to be translated.
4. Edit `src/LANG/*.po` with your favourite toll, like linguist or poedit.
5. Build again, this will update translated html output. Preview changes in `languages/LANG`.
6. Commit and send po and pot files.

## Building

The [res/build.sh](./res/build.sh) script builds HTML, roff and PDF versions of
the Void documentation and the `void-docs.1` man page. It requires the following
Void packages:

- `mdBook`
- `fd`
- `pandoc`
- `texlive`
- `perl`
- `perl-JSON`
- `librsvg-utils`

In order to build and install these files, set the `PREFIX` and `DESTDIR`
environment variables to appropriate values and run `res/build.sh` followed by
`res/install.sh`.
