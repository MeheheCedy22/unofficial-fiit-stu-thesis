#import "@preview/wordometer:0.1.4": word-count, total-words
// for counting words
#show: word-count


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
  bp2: (
    en: "Bachelor's Thesis", 
    sk: "Bakalárska práca"
    ),
  dp1: (
    en: "Progress report on solution DP1",
    sk: "Priebežná správa o riešení DP1"
  ),
  dp2: (
    en: "Progress report on solution DP2",
    sk: "Priebežná správa o riešení DP2"
  ),
  dp3: (
    en: "Master's Thesis", 
    sk: "Diplomová práca"
    )
)
// supplemets are for references in text but also in for the captions
#let supplemets = (
  bib-name: (
    en: "References",
    sk: "Literatúra"
  ),
  figure-supplement: (
    en: "Figure",
    sk: "Obrázok"
  ),
  table-supplement: (
    en: "Table",
    sk: "Tabuľka"
  ),
  section-supplement: (
    en: "Section",
    sk: "Sekcia"
  )
)

// TODO: add parameter for 2nd consultant or supervisor (Departmental advisor / Consultant)
// SK: Pedagogický vedúci - Konzultant
// 
// TODO: fix pagebreaks to be like in a book, where every chapter starts on odd page
// TODO: fix numbering to be like in a book (on specific side when page is even/odd)
// TODO: fix numbering of appendices (first fix appendices in general)

#let thesis(
  title: (en: "The title of the thesis", sk: "Názov práce"),
  author: "Placeholder for name", // "name surname" with titles in double quotes
  study-program: (en: "Informatics", sk: "Informatika"),
  study-field: "9.2.1 Computer Science",
  workplace: "Institute of Computer Engineering and Applied Informatics, FIIT STU, Bratislava",
  thesis-supervisor-name: "Placeholder for name",
  thesis-type: "bp1", // bp1, bp2, dp1, dp2, dp3, etc.
  date: (en: "", sk: ""),
  annotations: (en: "", sk: ""),
  acknowledgement: [
    Write your acknowledgement. #underline("Do not forget") to mention your
    thesis supervisor. #lorem(30)
  ],
  paper-size: "a4",
  bibliography: none,
  thesis-lang: "en", // For Slovak use "sk"
  evidence-number: "FIIT-XXXX-XXXXX",
  underline-links: true,
  // TODO: fix assignment image, dont know if it must be .png .jpg or that typst can input .pdf
  assignment: none,

  bib-style: "ieee",

  appendices: "",
  list-of-abbrev: "",

  body
) = {
  // setting text to selected language for typst paragraph justyfication (build-in function)
  set text(lang: thesis-lang)

  let lang(v) = {
    return v.at(thesis-lang)
  }

  // document global settings
  set document(title: lang(title), author: author)
  set page(paper: "a4")
  set text(font: "STIX Two Text", size: 12pt, spacing: 0.35em)
  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [–], [∗]))
  
  set std.bibliography(title: text(23pt)[#lang(supplemets.at("bib-name"))], style: bib-style)
  // line spacing (default 0.65em) src: https://github.com/typst/typst/issues/106#issuecomment-1497030336
  set par(leading: 1.5em)
  set heading(numbering: "1.1.1.", supplement: lang(supplemets.at("section-supplement")))
  
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

  

  show figure.where(kind: table): set figure(supplement: lang(supplemets.at("table-supplement")), numbering: "1")
  show figure.where(kind: image): set figure(supplement: lang(supplemets.at("figure-supplement")), numbering: "1")

  show figure.caption: set text(size: 10pt)
  show figure.caption: set align(start)

  show figure.caption.where(kind: table): set align(center)
  show figure.caption.where(kind: image): set align(center)

  // supplement for references and for captions are the same !
  show figure: fig => {
    let prefix = (
      if fig.kind == table [#lang(supplemets.at("table-supplement"))]
      else if fig.kind == image [#lang(supplemets.at("figure-supplement"))]
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
    #set align(center + top)
    #set text(15pt)
    #lang(university) \
    #lang(faculty) \
    #set text(10pt)
    #evidence-number \
    #set align(center + horizon)
    #set text(15pt)
    *#author* \
    #set text(20pt)
    *#lang(title)* \
    #set text(12pt)
    #lang(thesis-type-name.at(thesis-type))
    #set align(left + bottom)
    #lang((en: "Supervisor", sk: "Vedúci práce")): #thesis-supervisor-name \
    #lang(date) \
  ]
  pagebreak()
  pagebreak()

  // title page
  [
    #set align(center + top)
    #set text(15pt)
    #lang(university) \
    #lang(faculty) \
    #set text(10pt)
    #evidence-number \
    #set align(center + horizon)
    #set text(15pt)
    *#author* \
    #set text(20pt)
    *#lang(title)* \
    #set text(12pt)
    #lang(thesis-type-name.at(thesis-type))
    #set align(left + bottom)
    #lang((en: "Study program", sk: "Študijný program")): #lang(study-program) \
    #lang((en: "Study field", sk: "Študijný odbor")): #study-field \
    #lang((en: "Training workplace", sk: "Miesto vypracovania")): #workplace \
    #lang((en: "Supervisor", sk: "Vedúci práce")): #thesis-supervisor-name \
    #lang(date) \
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
  [
    #set align(bottom)
    #lang((
        en: [
            I honestly declare that I prepared this thesis independently, on
            the basis of consultations and using the cited literature.
        ],
        sk: [
            Čestne vyhlasujem, že som túto prácu vypracoval(a) samostatne, na
            základe konzultácií a s použitím uvedenej literatúry.
        ]
    ))
    #v(3em)
    #lang((en: "In Bratislava", sk: "V Bratislave")), #lang(date)
    #set align(right)
    #v(2em)
    .............................
    #v(1em)
    #author
  ]
  pagebreak()
  pagebreak()

  // acknowledgement
  block[
    #set text(size: 17pt)
    *#lang((en: "Acknowledgement", sk: "Poďakovanie"))* \
    #v(10pt)
    #set text(size: 12pt)
    #set par(leading: 1.5em)
    #acknowledgement
  ]
  pagebreak()
  pagebreak()

  let annotate(lang) = block[
    #set text(size: 17pt)
    *#(en: "Annotation", sk: "Anotácia").at(lang)* \
    #v(10pt)
    #set text(size: 12pt)
    #set par(leading: 1.4em)
    #university.at(lang) \
    #upper[#faculty.at(lang)] \

    #table(
      // setup
      inset: (left: 0pt, right: 3em),
      align: left,
      stroke: none,
      columns: 2,
      // content
      (
        en: "Degree course:", sk: "Studijný program:"
      ).at(lang), study-program.at(lang),
      (en: "Author:", sk: "Autor:").at(lang), author,
      if thesis-type.find("bp") == "bp" [
        #thesis-type-name.at("bp2").at(lang):
      ] else if thesis-type.find("dp") == "dp" [
        #thesis-type-name.at("dp3").at(lang):
      ], title.at(lang),
     (
        en: "Supervisor:",
        sk: [
          Vedúci #if thesis-type.find("bp") == "bp" [
            bakalárskej
          ] else if thesis-type.find("dp") == "dp" [
            diplomovej
          ] práce:
        ]
      ).at(lang), [#thesis-supervisor-name],
    )

    #set text(size: 12pt)
    #set par(leading: 1.4em, justify: true)
    #date.at(lang)
    #v(1em)
    #annotations.at(lang)
  ]

  annotate("sk")
  pagebreak()
  pagebreak()

  annotate("en")
  pagebreak()

  // table of contents
  set page(numbering: "I")

  // TODO: make 1st level headings to be bold/strong in Table of Contents but not in List of figures etc.
  outline(title: lang((en: "Contents", sk: "Obsah")), indent: auto)

  pagebreak(weak: true)


  // list of abbreviations
  [
    #set heading(numbering: none, outlined: false)
    = #lang((en: "List of abbreviations", sk: "Zoznam použitých skratiek"))
    #list-of-abbrev
  ]
  pagebreak()

  // list of figures
  outline(title: lang((en: "List of Figures", sk: "Zoznam použitých obrázkov")), target: figure.where(kind: image),)
  pagebreak()

  // list of tables
  outline(title: lang((en: "List of Tables", sk: "Zoznam použitých tabuliek")), target: figure.where(kind: table),)
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
