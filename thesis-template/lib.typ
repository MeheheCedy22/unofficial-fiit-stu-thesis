#let universityEN = "Slovak University of Technology in Bratislava"
#let facultyEN = "Faculty of Informatics and Information Technologies"
#let thesis-type-nameEN = (
  bp1: "Progress report on solution BP1",
  bp2: "Bachelor's Thesis",
  dp1: "Progress report on solution DP1",
  dp2: "Progress report on solution DP2",
  dp3: "Master's Thesis",
)

#let universitySK = "Slovenská technická univerzita v Bratislave"
#let facultySK = "Fakulta informatiky a informačných technológií"
#let thesis-type-nameSK = (
  bp1: "Priebežná správa o riešení BP1",
  bp2: "Bakalárska práca",
  dp1: "Priebežná správa o riešení DP1",
  dp2: "Priebežná správa o riešení DP2",
  dp3: "Diplomová práca",
)

#import "@preview/wordometer:0.1.4": word-count, total-words
#import "@preview/linguify:0.4.1": *

// TODO: fix this
// #let lang_data = toml("../lang.toml")
// #set-database(lang_data);

// TODO: have it pass as argument from thesis object
// For Slovak use "sk"
// #set text(lang: "en")

// TODO: linguify all based on lang passed as argument from thesis object
// #linguify("annotation")  // Shows "Anotácia" in the document.

// for counting words
#show: word-count


// TODO: add parameter for 2nd consultant or supervisor (Departmental advisor / Consultant)
// SK: Pedagogický vedúci - Konzultant

#let thesis(
  title: [The title of the thesis],
  author: "Placeholder for name", // "name surname" with titles in double quotes
  thesis-supervisor-name: "Placeholder for name",
  thesis-type: "bp1", // bp1, bp2, dp1, dp2, dp3, etc.
  dateEN: [],
  dateSK: [],
  annotationEN: [],
  annotationSK: [],
  acknowledgement: [Write your acknowledgement. #underline("Do not forget") to mention your thesis supervisor. #lorem(30)],
  index-terms: (),
  paper-size: "a4",
  bibliography: none,
  thesis_lang: "en", // For Slovak use "sk"
  evidence-number: "FIIT-XXXX-XXXXX",
  underline-links: true,
  // TODO: fix assignmetn image, dont know if it must be .png .jpg or that typst can input .pdf
  assignment: none,

  // TODO: fix these

  bib-name: [Literatúra],
  figure-reference-supplement: [Obr.],
  table-reference-supplement: [Tabuľka],
  section-reference-supplement: [Sekcia],

  body
) = {

// =========================
  // TODO: move this to be on correct spot
  // reset numbering and start counting
  // counter(page).update(0)
  // set page(numbering: "1")
  // 
  // TODO: use this code somewhere
  // if thesis-type.find("bp") == "bp" [
  //   #thesis-type-nameEN.at("bp2")
  // ] else if thesis-type.find("dp") == "dp" [
  //   #thesis-type-nameEN.at("dp3")
  // ]

// =========================
  // document global settings
  set document(title: title, author: author)
  set page(paper: "a4") // TODO: fix numbering for different parts
  set text(font: "STIX Two Text", size: 12pt, spacing: 0.35em)
  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [–], [∗]))
  set std.bibliography(title: text(10pt)[#bib-name], style: "iso-690-author-date")
  // line spacing (default 0.65em) src: https://github.com/typst/typst/issues/106#issuecomment-1497030336
  set par(leading: 1.5em)
  set heading(numbering: "1.1.1.", supplement: section-reference-supplement)

  // underline all links based on user choice
  show link: it => {
    if underline-links {
      underline[#it]
    } else {
      it
    }
  }
// =========================

  // cover page
  [
    #set align(center)
    #set text(15pt)
    #universityEN \
    #facultyEN \
    #set text(10pt)
    #evidence-number \
    #v(30%)
    #set text(15pt)
    *#author* \
    #set text(20pt)
    *#title* \
    #set text(12pt)
    #thesis-type-nameEN.at(thesis-type)
    #v(30%)
    #set align(left)
    Thesis supervisor: #thesis-supervisor-name \
    #dateEN \
  ]
  pagebreak()
  pagebreak()

  // TODO: add study program and field based on user params or something
  // and also add user param for training workplace
  // and also fix margings of the page because it wil fail brutaly when other data inputed

  // title page
  [
    #set align(center)
    #set text(15pt)
    #universityEN \
    #facultyEN \
    #set text(10pt)
    #evidence-number \
    #v(30%)
    #set text(15pt)
    *#author* \
    #set text(20pt)
    *#title* \
    #set text(12pt)
    #thesis-type-nameEN.at(thesis-type)
    #v(15%)
    #set align(left)
    Study program: Informatics \
    Study field: 9.2.1 Computer Science \
    Training workplace: Institute of Computer Engineering and Applied Informatics, FIIT STU, Bratislava \
    Thesis supervisor: #thesis-supervisor-name \
    #dateEN \
  ]
  pagebreak()
  pagebreak()

  // assignment
  if assignment == none [Input your assignment using parameter "assignment" #pagebreak()] else [
    #image(assignment)
    #pagebreak()
  ]
  pagebreak()

  // honest declaration
  block[
    #v(75%)
    I honestly declare that I prepared this thesis independently, on the basis of consultations and using the cited literature.
    #v(3em)
    In Bratislava, #dateEN
    #set align(right)
    #v(3em)
    #author
  ]
  pagebreak()
  pagebreak()

  // acknowledgement
  block[
    #set text(size: 17pt)
    *Acknowledgement* \
    #v(10pt)
    #set text(size: 12pt)
    #set par(leading: 1.5em)
    #acknowledgement
  ]
  pagebreak()
  pagebreak()

  // TODO: temporary solution without using the lang.toml file and linguify package
  // annotation SLOVAK

  block[
    #set text(size: 17pt)
    *Anotácia* \
    #v(10pt)
    #set text(size: 12pt)
    #set par(leading: 1.4em)
    #universitySK \
    #upper[#facultySK] \
  
    #table(
      // setup
      inset: (left: 0pt, right: 3em),
      align: left,
      stroke: none,
      columns: 2,
      // content
      [Študijný program:],[Informatika], 
      [Autor:], [#author],
      [#if thesis-type.find("bp") == "bp" [
        #thesis-type-nameSK.at("bp2"):
      ] else if thesis-type.find("dp") == "dp" [
        #thesis-type-nameSK.at("dp3"):
      ]], [#title #lorem(10)],
      [Vedúci #if thesis-type.find("bp") == "bp" [
        bakalárskej
      ] else if thesis-type.find("dp") == "dp" [
        diplomovej] práce:], [#thesis-supervisor-name],
    )
  
    #set text(size: 12pt)
    #set par(leading: 1.4em)
    #dateSK
    #v(1em)
    #annotationSK
  ]
  pagebreak()
  pagebreak()
  
  // annotation ENGLISH
  block[
    #set text(size: 17pt)
    *Annotation* \
    #v(10pt)
    #set text(size: 12pt)
    #set par(leading: 1.4em)
    #universityEN \
    #upper[#facultyEN] \
  
    #table(
      // setup
      inset: (left: 0pt, right: 3em),
      align: left,
      stroke: none,
      columns: 2,
      // content
      [Degree course:],[Informatics], 
      [Author:], [#author],
      [#if thesis-type.find("bp") == "bp" [
        #thesis-type-nameEN.at("bp2"):
      ] else if thesis-type.find("dp") == "dp" [
        #thesis-type-nameEN.at("dp3"):
      ]], [#title #lorem(10)],
      [Supervisor:], [#thesis-supervisor-name],
    )
  
    #set text(size: 12pt)
    #set par(leading: 1.4em)
    #dateEN
    #v(1em)
    #annotationEN
  ]
  pagebreak()
  pagebreak()

  // TODO: setup some things as text size heading etc.
  // table of contents
  set page(numbering: "I")

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  outline(indent: auto)

  pagebreak()


  // list of abbreviations
  [
    #set heading(numbering: none, outlined: false)
    = List of abbreviations
    // TODO: add table for abbrev
  ]
  pagebreak()

  // list of figures
  outline(title: [List of Figures], target: figure.where(kind: image),)
  pagebreak()

  // list of tables
  outline(title: [List of Tables], target: figure.where(kind: table),)
  pagebreak()
  
  // paragraph setting for the body of the thesis
  set par(spacing: 0.45em, justify: true, first-line-indent: 1em, leading: 0.5em)
  set page(numbering: "1")
  body

  // TODO: fix Bibliography heading
  // display bibliography.
  set heading(numbering: none, outlined: false)
  bibliography

  // appendices
  set heading(numbering: "1", outlined: true)






}