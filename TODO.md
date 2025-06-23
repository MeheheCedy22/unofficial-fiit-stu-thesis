# Issues and TODOs:

## Fixed issues / Completed tasks (sorted by completion date)
- [x] add `none`/`false` option for list of figures (not show if none)
- [x] add `none`/`false` option for list of tables (not show if none)
- [x] add `none`/`false` option for list of abbreviations (not show if none)
- [x] add parameter for 2nd consultant or supervisor (Departmental advisor / Consultant) SK: Pedagogický vedúci - Konzultant
- [x] fix pagebreaks to be like in a book, where every chapter starts on odd page
- [x] appendices should also start on odd page
- [x] assignment image, dont know if it must be .png .jpg or that typst can input .pdf (test the .pdf input method as it was added in new compiler version 0.13.x i think)
- [x] maybe make honest declaration as user input because of `vypracoval(a)` is gender dependent (NOTE: the slovak version with `vypracoval(a)` is okay and this was not needed to be changed)
- [x] make 1st level headings to be bold/strong in Table of Contents but not in List of figures, and list of tables
- [x] fix bibliography to show in Table of Contents without numbering (it should actually be there as the guidelines say)
- [x] fix 2nd and deeper level headings to not show or show properly in Table of Contents for appendices
- [x] turn off resume heading numbering
- [x] create better organizational strucutre for the `.typ` content files (chapters, appendices, preliminaries, etc.)
- [x] fix page numbering to now show on blank pages before ToC (Table of Contents) and Introduction (on blank pages in general)
- [x] rework how the appendices are handled and imported to the document
- [x] fix heading numbering of appendices (just 1st lvl heading) (ToC is OKAY)
- [x] fix page numbering of appendices
- [x] fix page numbering of appendices in ToC
- [x] add every hand written text as blue or some visible colour to distinguish it from the Lorem Ipsum text
- [x] make all heading further away from its numbering using ~ (NOTE: made only the 1st level headings further away, the rest is not needed, used h())

## TODOs (sorted by priority)
- [ ] replace concrete values for text sizes, margins, etc. with variables and make them as parameters for user to change
- [ ] add word appendix before the appendix title in ToC and also in the document heading
- [ ] make the numbering for figures (images and tables) to start with the chapter number (e.g. 1.1, 1.2, 2.1, etc.)
    - [ ] add colon after the numbering (e.g. Figure 1.1: Figure title)
- [ ] make page numbering position parameter to choose the numbering to be like in a book (on specific side when page is even/odd) or in the middle for just digital version
    - [x] just added the param however not implemented yet
- [ ] add some guidelines / explanation to README.md for each param and also for other important stuff
- [ ] add list of features to README.md