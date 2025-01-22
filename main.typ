#import "thesis-template/lib.typ": thesis

#show: thesis.with(
  thesis-type: "bp1", // bp1, bp2, dp1, dp2, dp3, etc.
  title: [Title of the Thesis], 
  author: "Janko Mrkvicka",
  thesis-supervisor-name: "Ing. Enzo Gorlomi, PhD.",
  dateEN: [January 2025],
  dateSK: [Január 2025],
  annotationEN: [Annotation text. #underline("Size should be 150-200 words.") #lorem(150)],
  annotationSK: [Text anotácie. #underline("Dĺžka by mala byť 150-200 slov.") #lorem(150)],
  index-terms: ("Index", "terms", "of", "the", "thesis"),

  assignment: "../assets/assignment.png", // relative path to assignment file

  // parameter -- full: true -> show all references without citing
  bibliography: bibliography("refs.bib"),
  bib-style: "ieee", // style alternative "iso-690-numeric"

  bib-name: [References], // defaults are in Slovak
  figure-supplement: [Figure], // defaults are in Slovak
  table-supplement: [Table], // defaults are in Slovak
  section-supplement: [Section], // defaults are in Slovak

  underline-links: true,  // default true

  acknowledgement: [Write your acknowledgement. #underline("Do not forget") to mention your thesis supervisor. #lorem(30)],
  paper-size: "a4",
  thesis_lang: "en", // For Slovak use "sk"
  evidence-number: "FIIT-XXXX-XXXXX",

  list-of-abbrev: [
    = List of abbreviations
  
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

  // appendices needs to be written here to not break other things
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

    // TODO: fix 2nd and deeper heading to not show or show properly in Table of Contents
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

== Artificial Intelligence
#lorem(100)

=== AI Models
#lorem(100)

=== Prompt engineering
#lorem(100)

== Risks of implementing AI solutions

This is a test cite @vaswani2023attentionneed.
#lorem(100)

=== Ethical risks
#lorem(100)

=== Moral risks
#lorem(100)

=== Cybersecurity risks
#lorem(100)

== Content Moderation
#lorem(30)

=== Jailbreak
#lorem(100)

== Methods of attacks
#lorem(100)

== Legislation
#lorem(100)

=== European Union (EU)
#lorem(50)

=== United States
#lorem(50)

=== China
#lorem(50)

=== India
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

== Jailbreaking
#lorem(100)

= Evaluation

== Risks of implementing AI solutions
#lorem(100)

== AI content filtering and security mechanisms
#lorem(100)

== Mitigation strategies for sybersecurity threats
#lorem(100)

= Guidelines for users
#lorem(100)

= Conclusion
#lorem(100)

// this code needs to be here to now show resume in table of contents (ToC) and also it makes writing resume much easier
#set heading(numbering: none, outlined: false)
= Resumé
#lorem(100)