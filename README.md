latex-m4letter
============

Custom LaTeX letter class based on *scrlttr2* from the [KOMA
script](https://komascript.de/) package.

## Requirements

In order to use this class you need a working LaTeX distribution, e.g. texlive,
including `xelatex`, which is available on most distributions package manager.

## Usage

Just copy the class file `m4letter.cls` and `fonts` folder next to your letter
document and use the following command to create the letter:

    xelatex <your-document.tex>

Alternatively, adjust the `PROJECT` variable to match your documents name in
the included `Makefile` and simply run

    make

The repository includes a demo file `example.tex` featuring extended commentary
for reference.
