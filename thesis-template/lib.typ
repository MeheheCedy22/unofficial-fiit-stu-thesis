#let university = (
  en: "Slovak University of Technology in Bratislava",
  sk: "Slovenská technická univerzita v Bratislave"
)
#let faculty = (
  en: "Faculty of Informatics and Information Technologies",
  sk: "Fakulta informatiky a informačných technológií"
)
#let thesis-type-name = (
  bp1: (
    en: "Progress report on solution BP1",
    sk: "Priebežná správa o riešení BP1"
  ),
  bp2: (en: "Bachelor's Thesis", sk: "Bakalárska práca"),
  dp1: (
    en: "Progress report on solution DP1",
    sk: "Priebežná správa o riešení DP1"
  ),
  dp2: (
    en: "Progress report on solution DP2",
    sk: "Priebežná správa o riešení DP2"
  ),
  dp3: (en: "Master's Thesis", sk: "Diplomová práca")
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

  bib-style: "ieee",
  bib-name: [Literatúra],
  figure-supplement: [Obrázok],
  table-supplement: [Tabuľka],
  section-supplement: [Sekcia],

  appendices: [],
  list-of-abbrev: [],

  body
) = {
    let lang(v) = {
      return v.at(thesis_lang)
    }

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
  set page(paper: "a4")
  set text(font: "STIX Two Text", size: 12pt, spacing: 0.35em)
  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [–], [∗]))
  set std.bibliography(title: text(23pt)[#bib-name], style: bib-style)
  // line spacing (default 0.65em) src: https://github.com/typst/typst/issues/106#issuecomment-1497030336
  set par(leading: 1.5em)
  set heading(numbering: "1.1.1.", supplement: section-supplement)

  // underline all links based on user choice
  show link: it => {
    if underline-links {
      underline[#it]
    } else {
      it
    }
  }

  // tables & figures setup
  show figure: set block(spacing: 15.5pt)
  show figure: set place(clearance: 15.5pt)

  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set text(size: 10pt)

  show figure.where(kind: table): set figure(supplement: table-supplement, numbering: "1")
  show figure.where(kind: image): set figure(supplement: figure-supplement, numbering: "1")

  show figure.caption: set text(size: 10pt)
  show figure.caption: set align(start)

  show figure.caption.where(kind: table): set align(center)
  show figure.caption.where(kind: image): set align(center)
  
  // supplement for references and for captions are the same !
  show figure: fig => {
    let prefix = (
      if fig.kind == table [#table-supplement]
      else if fig.kind == image [#figure-supplement]
      else [#fig.supplement]
    )
    let numbers = numbering(fig.numbering, ..fig.counter.at(fig.location()))
    show figure.caption: it => [#prefix~#numbers: #it.body]
    fig
  }

  // references setup
  // Configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // Override equation references.
      link(it.element.location(), numbering(
        it.element.numbering,
        ..counter(math.equation).at(it.element.location())
      ))
    } else {
      // Other references as usual.
      it
    }
  }

  // heading setup
  show heading: it => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).get()
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    if it.level == 1 {
      pagebreak()
      set text(size: 23pt)
      show: block.with(above: 15pt, below: 2em, sticky: true)
      if it.numbering != none {
        numbering("1", deepest)
        h(7pt, weak: true)
      }
      it.body
    } else if it.level == 2 {
      set text(size: 16pt)
      show: block.with(above: 30pt, below: 1.75em, sticky: true)
      it
    } else if it.level == 3 {
      set text(size: 14pt)
      show: block.with(above: 30pt, below: 1.5em, sticky: true)
      it
    } else {
      it
    }
  }
// =========================

  // cover page
  [
    #set align(center)
    #set text(15pt)
    #lang(university)
    #lang(faculty)
    #set text(10pt)
    #evidence-number \
    #v(30%)
    #set text(15pt)
    *#author* \
    #set text(20pt)
    *#title* \
    #set text(12pt)
    #lang(thesis-type-name.at(thesis-type))
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
    #lang(university) \
    #lang(faculty) \
    #set text(10pt)
    #evidence-number \
    #v(30%)
    #set text(15pt)
    *#author* \
    #set text(20pt)
    *#title* \
    #set text(12pt)
    #lang(thesis-type-name.at(thesis-type))
    #v(15%)
    #set align(left)
    Study program: Informatics \
    Study field: 9.2.1 Computer Science \
    Training workplace: Institute of Computer Engineering and Applied Informatics, FIIT STU, Bratislava \
    Thesis Supervisor: #thesis-supervisor-name \
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
    #v(2em)
    ...........................
    #v(1em)
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
    #university.at("sk") \
    #upper[#faculty.at("sk")] \

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
        #thesis-type-name.at("bp2").at("sk"):
      ] else if thesis-type.find("dp") == "dp" [
        #thesis-type-name.at("dp3").at("sk"):
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
    #university.at("en") \
    #upper[#faculty.at("sk")] \
  
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
        #thesis-type-name.at("bp2").at("en"):
      ] else if thesis-type.find("dp") == "dp" [
        #thesis-type-name.at("dp3").at("en"):
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

  // table of contents
  set page(numbering: "I")

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  outline(indent: auto)

  pagebreak(weak: true)


  // list of abbreviations
  [
    #set heading(numbering: none, outlined: false)
    #list-of-abbrev
  ]
  pagebreak()

  // list of figures
  outline(title: [List of Figures], target: figure.where(kind: image),)
  pagebreak()

  // list of tables
  outline(title: [List of Tables], target: figure.where(kind: table),)
  // pagebreak not needed because i already break before level 1 heading
  pagebreak()
  
  // paragraph setting for the body of the thesis
  set par(spacing: 3em, justify: true, leading: 1em)
  set page(numbering: "1")
  body

  // TODO: fix bibliography to show in Table of Contents without numbering
  // display bibliography
  set heading(numbering: none, outlined: false)
  bibliography

  // appendices
  [
    #set heading(numbering: none, outlined: true)
    #set figure(outlined: false)
    #appendices
  ]
}
