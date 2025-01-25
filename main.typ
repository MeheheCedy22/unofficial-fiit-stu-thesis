#import "thesis-template/lib.typ": thesis

#show: thesis.with(
  thesis-type: "bp1", // bp1, bp2, dp1, dp2, dp3, etc.
  title: (en: "The title of the thesis", sk: "Názov práce"),
  author: "Janko Mrkvicka",
  thesis-supervisor-name: "Ing. Enzo Gorlomi, PhD.",
  // input 'studyField' and 'workplace' parameters based on language (used only once in document)
  // defaults are in english
  studyField: "9.2.1 Computer Science / Informatika",
  workplace: "Institute of Computer ... / Ústav počítačového ...",
  // NOTE: the english annotations actually ask for `Year, month`
  date: (en: "2025, January", sk: "Január 2025"),
  annotations: (
    en: [
      Annotation text. #underline("Size should be 150-200 words.")
      #lorem(150)
    ],
    sk: [
      Text anotácie. #underline("Dĺžka by mala byť 150-200 slov.")
      #lorem(150)
    ],
  ),

  assignment: "../assets/assignment.png", // relative path to assignment file

  // parameter -- full: true -> show all references without citing
  bibliography: bibliography("refs.bib"),
  bib-style: "ieee", // style alternative "iso-690-numeric"

  // you still can underline links individually when set to false 
  underline-links: true,  // default true

  acknowledgement: [
    Write your acknowledgement. #underline("Do not forget") to mention your
    thesis supervisor. 
    
    Napíšte svoje poďakovanie. #underline("Nezabudnite") spomenúť svojho vedúceho práce.
  ],
  paper-size: "a4",
  thesis-lang: "en", // For Slovak use "sk"
  evidence-number: "FIIT-XXXX-XXXXX",

  list-of-abbrev: [
      #table(
        // setup
        stroke: none,
        align: left,
        columns: 2,
        inset: (left: 0pt, right: 1em),
        row-gutter: 0.5em,
        // content
       [*API*], [Application Programming Interface],
       [*UI*], [User Interface],
       [*UX*], [User Experience],
       [*SDK*], [Software Development Kit],
       [*IDE*], [Integrated Development Environment],
       [*IoT*], [Internet of Things],
       [*VPN*], [Virtual Private Network],
       [*SEO*], [Search Engine Optimization],
       [*HTTP*], [HyperText Transfer Protocol],
       [*CSS*], [Cascading Style Sheets],
      )
  ],

  // appendices needs to be written here manually to not break other things (for now)
  appendices: [
    = Appendix A
    == Work Schedule in Winter Semester
    #figure(
      table(
        columns: 2,
        [*Semester week number *], [*Info*],
        [1],[#lorem(8)],
        [2],[#lorem(8)],
        [3],[#lorem(8)],
        [4],[#lorem(8)],
        [5],[#lorem(8)],
        [6],[#lorem(8)],
        [7],[#lorem(8)],
        [8],[#lorem(8)],
        [9],[#lorem(8)],
        [10],[#lorem(8)],
        [12],[#lorem(8)],
        [12],[#lorem(8)],
      ),
    )

    // TODO: fix 2nd and deeper heading to not show or show properly in Table of Contents for appendices
    // need to manually write this for now, because numbering is off globally for appendix and it will break other things
    === A.1 Plan Evaluation
    #lorem(100)

    = Appendix B

    == Survey questions

    #lorem(50)

    #figure(
      image("assets/Test.svg")
    )

  ]
)
// need to reset the counter here, it does not work in the lib.typ from my little testing
// TODO: fix the counter to now show numbering on blank pages before ToC (Table of Contents) and Introduction
#counter(page).update(1)

// =============== HERE YOU CAN START WRITING YOUR THESIS ===============

= Introduction
#lorem(100)

@tab:example shows example of table in this template. #lorem(10)

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1],[Content], [Content],
    [Row 2],[Content], [Content]
  ),
  caption: [Example of a Table],
) <tab:example>

#lorem(20)

@fig:test-image shows test image.
#lorem(20)

#figure(
  image("assets/Test.svg", width: 50%),
  caption: [Test image]
) <fig:test-image>

= Analysis
#lorem(100)

== History of Paperclips
#lorem(100)

=== Manufacturing Process
#lorem(100)

=== Innovations in Design
#lorem(100)

== Benefits of Origami

This is a test cite @vaswani2023attentionneed.
#lorem(100)

=== Stress-Relief Benefits
#lorem(100)

=== Environmental Impact
#lorem(100)

=== Artistic Applications
#lorem(100)

== Mysteries of Black Holes
#lorem(30)

=== Accretion Disks
#lorem(100)

== Recipes for Success
#lorem(100)

== Laws of Motion
#lorem(100)

=== Newtonian Mechanics
#lorem(50)

=== Relativity
#lorem(50)

=== Quantum Implications
#lorem(50)

=== Practical Applications
#lorem(50)

= Experimenting
#lorem(10)
@fig:test-image2 shows test image. #lorem(20)

#figure(
  image("assets/Test.svg", width: 50%),
  caption: [Second Test image]
) <fig:test-image2>

@tab:example2 shows example of table in this template. #lorem(10)

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1],[Content], [Content],
    [Row 2],[Content], [Content]
  ),
  caption: [Example 2 of a Table],
) <tab:example2>

#lorem(100)

== Wonders of Jellyfish
#lorem(100)

= Evaluation

== Benefits of Duct Tape
#lorem(100)

== Secrets of Ancient Cartography
#lorem(100)

== Strategies for Surviving Sharknadoes
#lorem(100)

= Guidelines for users
#lorem(100)

= Conclusion
#lorem(100)

// ==== RESUME is present only in theses which are not written in Slovak/Czech language ====
// this code needs to be here to now show resume in table of contents (ToC) and also it makes writing resume much easier
#set heading(numbering: none, outlined: false)
= Resumé
#lorem(100)
