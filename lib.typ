#import "@preview/muchpdf:0.1.0": muchpdf
#import "thesis-template/translations.typ": *

#let page-break(to: "odd", weak: true) = {
  set page(numbering: none)
  pagebreak(to: to, weak: weak)
  set page(numbering: "1")
}

#let thesis(
  thesis-lang: "en", // For Slovak use "sk"
  thesis-type: "bp1", // bp1, bp2, dp1, dp2, dp3, etc.
  paper-size: "a4",
  page-numbering-position: "center", // "book" or "center" (default: "center")
  evidence-number: "FIIT-XXXXX-XXXXXX",
  title: (en: "The title of the thesis", sk: "Názov práce"),
  author: "Placeholder for name", // "name surname" with titles in double quotes
  thesis-supervisor-name: "Placeholder for name", // "name surname" with titles in double quotes
  departmental-advisor: "Placeholder for name",
  study-program: (en: "Informatics", sk: "Informatika"),
  study-field: "9.2.1 Computer Science / 9.2.1 Informatika",
  workplace: "Institute of Computer ... / Ústav počítačového ...",
  date: (en: "20xx, May", sk: "Máj 20xx"),
  assignment: none,
  bibliography: none,
  bib-style: "ieee",
  underline-links: true,
  annotations: (
    sk: [
      Text anotácie. #underline("Dĺžka by mala byť 150-200 slov.")
      #lorem(200)
    ],
    en: [
      Annotation text. #underline("Size should be 150-200 words.")
      #lorem(200)
    ],
  ),
  acknowledgement: [
    Write your acknowledgement. #underline("Do not forget") to mention your
    thesis supervisor.

    Napíšte svoje poďakovanie. #underline("Nezabudnite") spomenúť svojho vedúceho práce.
  ],
  list-of-abbrev: none,
  list-of-figures: true,
  list-of-tables: true,
  appendices: [],
  body,
) = {
  // setting text to selected language for typst paragraph justification (build-in function)
  set text(lang: thesis-lang)

  // for translating from dictionaries
  let lang(v) = {
    return v.at(thesis-lang)
  }

  // document global settings
  set document(title: lang(title), author: author)
  set page(paper: paper-size)
  set text(font: "STIX Two Text", size: 12pt, spacing: 0.35em)
  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [--], [∗]))
  set enum(indent: 10pt, body-indent: 9pt, numbering: "1)a)i)")

  set std.bibliography(title: text(1em)[#lang(supplemets.at("bib-name"))], style: bib-style)
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
      if fig.kind == table [#lang(supplemets.at("table-supplement"))] else if fig.kind == image [#lang(supplemets.at(
          "figure-supplement",
        ))] else [#fig.supplement]
    )
    let numbers = numbering(fig.numbering, ..fig.counter.at(fig.location()))
    show figure.caption: it => [#prefix~#numbers: #it.body]
    fig
  }

  // references setup
  // configure equation numbering and spacing
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 2em)

  // configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // override equation references
      link(it.element.location(), numbering(it.element.numbering, ..counter(math.equation).at(it.element.location())))
    } else {
      // other references as usual
      it
    }
  }

  // heading setup
  show heading: it => {
    // find out the final number of the heading counter
    let levels = counter(heading).get()
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    if it.level == 1 {
      // start each new chapter (1st level heading) on odd page like in a book
      page-break()
      set text(size: 23pt)
      show: block.with(above: 15pt, below: 2em, sticky: true)
      if it.numbering != none {
        numbering("1", deepest)
        h(0.75em, weak: true)
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
  // ========== END OF GENERAL SETUP ===============

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
    #if departmental-advisor != none [
      #lang((en: "Departmental advisor", sk: "Pedagogický vedúci")): #departmental-advisor \
    ]
    #lang(date) \
  ]
  pagebreak(to: "odd")

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
    #if departmental-advisor != none [
      #lang((en: "Departmental advisor", sk: "Pedagogický vedúci")): #departmental-advisor \
    ]
    #lang(date) \
  ]
  pagebreak(to: "odd")

  // assignment
  if assignment == none [
    Input your assignment as `.pdf`. The `.pdf` can be generated by AIS in the `Final Theses` section. Use the `assignment` parameter of `thesis` to set the path to the file, e.g.\ `assignment: "../assets/assignment.pdf"` \
  ] else [
    #muchpdf(
      read(assignment, encoding: none),
      // width: 100%,
    )
  ]
  pagebreak(to: "odd")

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
      ],
    ))
    #v(3em)
    #lang((en: "In Bratislava", sk: "V Bratislave")), #lang(date)
    #set align(right)
    #v(2em)
    #for letter in author {
      [..]
    }\.\.\.\.
    #v(1em)
    #author
  ]
  pagebreak(to: "odd")

  // acknowledgement
  [
    #set text(size: 17pt)
    *#lang((en: "Acknowledgement", sk: "Poďakovanie"))* \
    #v(10pt)
    #set text(size: 12pt)
    #set par(leading: 1.5em, justify: true)
    #acknowledgement
  ]
  pagebreak(to: "odd")

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
        en: "Degree course:",
        sk: "Študijný program:",
      ).at(lang),
      study-program.at(lang),
      (en: "Author:", sk: "Autor:").at(lang), author,
      if thesis-type.find("bp") == "bp" [
        #thesis-type-name.at("bp2").at(lang):
      ] else if thesis-type.find("dp") == "dp" [
        #thesis-type-name.at("dp3").at(lang):
      ],
      title.at(lang),
      (
        en: "Supervisor:",
        sk: [
          Vedúci #if thesis-type.find("bp") == "bp" [
            bakalárskej
          ] else if thesis-type.find("dp") == "dp" [
            diplomovej
          ] práce:
        ],
      ).at(lang),
      [#thesis-supervisor-name],
      ..if departmental-advisor != none {
        (
          (en: "Departmental advisor:", sk: "Pedagogický vedúci:").at(lang),
          departmental-advisor,
        )
      },
    )

    #set text(size: 12pt)
    #set par(leading: 1.4em, justify: true)
    #date.at(lang)
    #v(1em)
    #annotations.at(lang)
  ]

  annotate("sk")
  pagebreak(to: "odd")

  annotate("en")
  pagebreak(to: "odd")

  // table of contents (1)
  set page(numbering: "I")
  // make 1st level headings bold in the outline
  show outline.entry: it => {
    if it.element != none and it.element.func() == heading and it.level == 1 {
      strong(it)
    } else {
      it
    }
  }

  // table of contents (2)
  outline(title: lang((en: "Contents", sk: "Obsah")), indent: auto)

  // list of abbreviations
  if list-of-abbrev != none [
    #set heading(numbering: none, outlined: false)
    = #lang((en: "List of abbreviations", sk: "Zoznam použitých skratiek"))
    #list-of-abbrev
  ]

  // list of figures
  if list-of-figures [
    #outline(title: lang((en: "List of Figures", sk: "Zoznam použitých obrázkov")), target: figure.where(kind: image))
  ]

  // list of tables
  if list-of-tables [
    #outline(title: lang((en: "List of Tables", sk: "Zoznam použitých tabuliek")), target: figure.where(kind: table))
  ]

  // paragraph setting for the body of the thesis
  set par(spacing: 3em, justify: true, leading: 1em)
  set page(numbering: "1")
  body

  // display bibliography
  set heading(numbering: none, outlined: true)
  bibliography

  // appendices
  set page(numbering: (..nums) => {
    let h = counter(heading).get()
    if h.len() > 0 {
      let letter = numbering("A", h.at(0))
      return letter + "-" + str(nums.at(0))
    }
    return "A-" + str(nums.at(0))
  })

  set heading(numbering: "A.1.1", outlined: true)
  counter(heading).update(0)

  show heading.where(level: 1): it => {
    page-break()
    set text(size: 23pt)
    show: block.with(above: 15pt, below: 2em, sticky: true)
    if it.numbering != none {
      numbering("A", counter(heading).get().at(0, default: 0))
      h(0.75em, weak: true)
    }
    it.body
  }

  show heading.where(level: 2): it => {
    set text(size: 16pt)
    show: block.with(above: 30pt, below: 1.75em, sticky: true)
    it
  }
  show heading.where(level: 3): it => {
    set text(size: 14pt)
    show: block.with(above: 30pt, below: 1.5em, sticky: true)
    it
  }

  counter(page).update(0)
  appendices
}
