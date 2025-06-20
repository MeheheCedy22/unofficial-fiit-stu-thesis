# Issues and TODOs:

## Fixed issues / Completed tasks
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

## TODOs
- [ ] make page numbering position parameter to choose the numbering to be like in a book (on specific side when page is even/odd) or in the middle for just digital version
    - [x] just added the param however not implemented yet
- [ ] rework how the appendices are handled and imported to the document
- [ ] fix page numbering of appendices
- [ ] fix heading numbering of appendices (just 1st lvl heading) (ToC is OKAY)
- [ ] fix page numbering to now show on blank pages before ToC (Table of Contents) and Introduction (on blank pages in general)