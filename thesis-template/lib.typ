#import "@preview/wordometer:0.1.4": word-count, total-words
#import "@preview/linguify:0.4.1": *

// TODO: fix this
// #let lang_data = toml("../lang.toml")
// #set-database(lang_data);

// TODO: have it pass as argument from thesis object
// For Slovak use "sk"
// #set text(lang: "en")

// TODO: linguify all based on lang passed as argument from thesis object
// #linguify("abstract")  // Shows "Abstrakt" in the document.

// for counting words
#show: word-count

#let thesis(
  title: [The title of the thesis],
  author: "Placeholder for name", // "name surname" with titles in double quotes
  thesis-supervisor-name: "Placeholder for name",
  thesis-type: "bp", // Bachelor -> bp, Master -> dp
  date: [],
  abstract: [],
  paper-size: "a4",
  bibliography: none,
  thesis_lang: "en", // For Slovak use "sk"
  evidence-number: "FIIT-XXXX-XXXXX",
  underline-links: true,

  // TODO: fix these
  abstract-name-slovak: true,

  index-terms: (),
  index-terms-name-slovak: true,
  bib-name: [Literatúra],
  figure-reference-supplement: [Obr.],
  table-reference-supplement: [Tabuľka],
  section-reference-supplement: [Sekcia],

  body
) = {
  // TODO: fix this code position because i will move things around
  show link: it => {
    if underline-links {
      underline[#it]
    } else {
      it
    }
  }


  title

  // Set document metadata.
  set document(title: title, author: author)

  // Set the body font.
  // TODO: check and correct this
  set text(font: "TeX Gyre Termes", size: 10pt, spacing: .35em)

  // Enums numbering
  set enum(numbering: "1)a)i)")

  // Tables & figures
  show figure: set block(spacing: 15.5pt)
  show figure: set place(clearance: 15.5pt)

  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set text(size: 8pt)
  // ORIGINALLY:
  // show figure.where(kind: table): set figure(numbering: "I")
  // show figure.where(kind: image): set figure(supplement: figure-supplement, numbering: "1")
  // CHANGE:
  show figure.where(kind: table): set figure(supplement: table-reference-supplement, numbering: "I")
  show figure.where(kind: image): set figure(supplement: figure-reference-supplement, numbering: "1")

  show figure.caption: set text(size: 8pt)
  show figure.caption: set align(start)
  show figure.caption.where(kind: table): set align(center)
  // CHANGE:
  show figure.caption.where(kind: image): set align(center)
  
  // Adapt supplement in caption independently from supplement used for
  // references.
  show figure: fig => {
    let prefix = (
      if fig.kind == table [Tabuľka]
      else if fig.kind == image [Obr.]
      else [#fig.supplement]
    )
    let numbers = numbering(fig.numbering, ..fig.counter.at(fig.location()))
    show figure.caption: it => [#prefix~#numbers: #it.body]
    show figure.caption.where(kind: table): smallcaps
    fig
  }

  // Code blocks
  show raw: set text(
    font: "TeX Gyre Cursor",
    ligatures: false,
    size: 1em / 0.8,
    spacing: 100%,
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

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

  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [–], [∗]))

  set heading(numbering: "1.1.1.", supplement: section-reference-supplement)
  


  // Style bibliography.
  show std.bibliography: set text(8pt)
  show std.bibliography: set block(spacing: 0.5em)
  // ORIGINALLY:
  // set std.bibliography(title: text(10pt)[References], style: "ieee")
  // CHANGE:
  // other ISO 690 style could be: "iso-690-numeric"
  set std.bibliography(title: text(10pt)[#bib-name], style: "iso-690-author-date")



  // Configure paragraph properties.
  set par(spacing: 0.45em, justify: true, first-line-indent: 1em, leading: 0.45em)

  // Outline / Table of contents setup

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  outline(indent: auto)

  // List of abbreviations
  [
    #set heading(numbering: none)
    = List of abbreviations
  ]

  // List of figures
  outline(title: [List of Figures], target: figure.where(kind: image),)

  // List of tables
  outline(title: [List of Tables], target: figure.where(kind: table),)
  
  
  // Display the paper's contents.
  set par(leading: 0.5em)
  body

  // Display bibliography.
  bibliography
}