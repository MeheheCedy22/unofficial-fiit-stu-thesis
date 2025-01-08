#let university = "Slovak University of Technology in Bratislava"
#let faculty = "Faculty of Informatics and Information Technologies"

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
  author: (),
  thesis-supervisor-name: "",
  thesis-type: "", // Bachelor -> bp, Master -> dp
  date: [],
  abstract: none,
  paper-size: "a4",
  bibliography: none,
  thesis_lang: "en", // For Slovak use "sk"
  evidence-number: "FIIT-XXXX-XXXXX",
  underline-links: 2, // 0-3 TODO: maybe change this

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
    if underline-links == 3 {
      underline[#it]
    } else {
      it
    }
  }

  // Set document metadata.
  set document(title: title, author: author.map(author => author.name))

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
      // ORIGINALLY:
      // if fig.kind == table [TABLE]
      // else if fig.kind == image [Fig.]
      // else [#fig.supplement]
      // CHANGE:
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

  // Configure the page and multi-column properties.
  // set columns(gutter: 12pt)
  // set page(
  //   paper: paper-size,
  //   // The margins depend on the paper size.
  //   margin: if paper-size == "a4" {
  //     (x: 41.5pt, top: 80.51pt, bottom: 89.51pt)
  //   } else {
  //     (
  //       x: (50pt / 216mm) * 100%,
  //       top: (55pt / 279mm) * 100%,
  //       bottom: (64pt / 279mm) * 100%,
  //     )
  //   }
  // )

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

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  // ORIGINALLY:
  // set list(indent: 10pt, body-indent: 9pt)
  // CHANGE:
  // set marker for lists from LaTeX IEEE template
  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [–], [∗]))

  // Configure headings.
  // ORIGINALLY:
  // set heading(numbering: "I.A.a)")
  // CHANGE:
  // set heading numbering from LaTeX IEEE template
  // ORIGINALLY:
  // set heading(numbering: "I.A.1)")
  // CHANGE:
  set heading(numbering: "1.1.1.", supplement: section-reference-supplement)

  // show heading: it => {
  //   let levels = counter(heading).get()
  //   let deepest = if levels != () {
  //     levels.last()
  //   } else {
  //     1
  //   }

  //   if it.level == 1 {
  //     numbering("1")
  //     it
  //   }
  // }
  
  // TODO: fix heading
  // show heading: it => {
  //   // Find out the final number of the heading counter.
  //   let levels = counter(heading).get()
  //   let deepest = if levels != () {
  //     levels.last()
  //   } else {
  //     1
  //   }

  //   set text(10pt, weight: 400)
  //   if it.level == 1 {

  //     // TODO: fix acknowledgment

  //     // First-level headings are centered smallcaps.
  //     // We don't want to number the acknowledgment section.
  //     // ORIGINALLY:
  //     // let is-ack = it.body in ([Acknowledgment], [Acknowledgement], [Acknowledgments], [Acknowledgements])
  //     // CHANGE:
  //     // also without diacritics
  //     let is-ack = it.body in ([Poďakovanie], [Poďakovania], [Podakovanie], [Podakovania], [List of abbreviations], [Zoznam skratiek], [Zoznam použitých skratiek])

  //     set align(left)
  //     set text(if is-ack { 10pt } else { 11pt })
  //     show: block.with(above: 15pt, below: 13.75pt, sticky: true)
  //     // show: smallcaps
  //     if it.numbering != none and not is-ack {
  //       numbering("1", deepest)
  //       h(7pt, weak: true)
  //     }
  //     it.body
  //   } else if it.level == 2 {
  //     // Second-level headings are run-ins.
  //     set par(first-line-indent: 0pt)
  //     // set text(style: "italic")
  //     show: block.with(spacing: 10pt, sticky: true)
  //     if it.numbering != none {
  //       numbering("1.", deepest)
  //       h(7pt, weak: true)
  //     }
  //     it.body
  //   } else [
  //     #if it.level == 3 {
  //       numbering("1.", deepest)

  //       [ ]
  //     }
  //     _#(it.body):_
  //   ]
  // }

  // Style bibliography.
  show std.bibliography: set text(8pt)
  show std.bibliography: set block(spacing: 0.5em)
  // ORIGINALLY:
  // set std.bibliography(title: text(10pt)[References], style: "ieee")
  // CHANGE:
  // other ISO 690 style could be: "iso-690-numeric"
  set std.bibliography(title: text(10pt)[#bib-name], style: "iso-690-author-date")

  // Display the paper's title and authors at the top of the page,
  // spanning all columns (hence floating at the scope of the
  // columns' parent, which is the page).
  // place(
  //   top,
  //   float: true,
  //   scope: "parent",
  //   clearance: 30pt,
  //   {
  //     v(3pt, weak: true)
  //     align(center, par(leading: 0.5em, text(size: 24pt, title)))
  //     v(8.35mm, weak: true)

  //     // Display the authors list.
  //     set par(leading: 0.6em)
  //     for i in range(calc.ceil(author.len() / 3)) {
  //       let end = calc.min((i + 1) * 3, author.len())
  //       let is-last = author.len() == end
  //       let slice = author.slice(i * 3, end)
  //       grid(
  //         columns: slice.len() * (1fr,),
  //         gutter: 12pt,
  //         ..slice.map(author => align(center, {
  //           text(size: 11pt, author.name)
  //           if "department" in author [
  //             \ #emph(author.department)
  //           ]
  //           if "organization" in author [
  //             \ #emph(author.organization)
  //           ]
  //           if "location" in author [
  //             \ #author.location
  //           ]
  //           if "email" in author {
  //             if type(author.email) == str [
  //               \ #link("mailto:" + author.email)
  //             ] else [
  //               \ #author.email
  //             ]
  //           }
  //         }))
  //       )

  //       if not is-last {
  //         v(16pt, weak: true)
  //       }
  //     }
  //   }
  // )

  // Configure paragraph properties.
  set par(spacing: 0.45em, justify: true, first-line-indent: 1em, leading: 0.45em)

  // CHANGE:
  show link: it => {
    if underline-links == 2 {
      underline[#it]
    } else {
      it
    }
  }


  // TODO: fix/change/remove

  // Display abstract and index terms.
  // if abstract != none [
  //   #set text(9pt, weight: 700, spacing: 150%)
  //   // ORIGINALLY:
  //   // #h(1em) _Abstract_---#h(weak: true, 0pt)#abstract
  //   // CHANGE:
  //   // #emph[text] == italic same as using _text_
  //   #if abstract-name-slovak == true [
  //     #h(1em) _Abstrakt_---#h(weak: true, 0pt)#abstract
  //   ] else if abstract-name-slovak == false [
  //     #h(1em) _Abstract_---#h(weak: true, 0pt)#abstract
  //   ] else [
  //     #h(1em) #emph[#abstract-name-slovak]---#h(weak: true, 0pt)#abstract
  //   ]

  //   #if index-terms != () [
  //     // ORIGINALLY:
  //     // #h(.3em)_Index Terms_---#h(weak: true, 0pt)#index-terms.join(", ")
  //     // CHANGE:
  //     // #emph[text] == italic same as using _text_
  //     #if index-terms-name-slovak == true [
  //       #h(.3em)_Kľúčové slová_---#h(weak: true, 0pt)#index-terms.join(", ")
  //     ] else if index-terms-name-slovak == false [
  //       #h(.3em)_Index Terms_---#h(weak: true, 0pt)#index-terms.join(", ")
  //     ] else [
  //       #h(.3em)#emph[#index-terms-name-slovak]---#h(weak: true, 0pt)#index-terms.join(", ")
  //     ]
  //   ]
  //   #v(2pt)
  // ]

  // CHANGE:
    show link: it => {
    if underline-links == 1 {
      underline[#it]
    } else {
      it
    }
  }


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