#import "thesis-template/lib.typ": thesis

#show: thesis.with(
  thesis-type: "bp1", // bp1, bp2, dp1, dp2, dp3, etc.
  title: [Title of the Thesis], 
  author: "Janko Mrkvicka",
  thesis-supervisor-name: "Ing. Giovanni Petr, PhD.",
  dateEN: [January 2025],
  dateSK: [Január 2025],
  annotationEN: [Annotation text. #underline("Size should be 150-200 words.") #lorem(150)],
  annotationSK: [Text anotácie. #underline("Dĺžka by mala byť 150-200 slov.") #lorem(150)],
  index-terms: ("Index", "terms", "of", "the", "thesis"),

  assignment: "../assets/assignment.png", // relative path to assignment file

  // full: true -> show all references without citing
  // TODO: remove the full: true
  bibliography: bibliography("refs.bib", full: true),

  bib-name: [References], // defaults are in Slovak
  figure-reference-supplement: [Figure], // defaults are in Slovak
  table-reference-supplement: [Table], // defaults are in Slovak
  section-reference-supplement: [Section], // defaults are in Slovak

  underline-links: true,  // default true

  acknowledgement: [Write your acknowledgement. #underline("Do not forget") to mention your thesis supervisor. #lorem(30)],
  paper-size: "a4",
  thesis_lang: "en", // For Slovak use "sk"
  evidence-number: "FIIT-XXXX-XXXXX",
)
// need to reset the counter here, it does not work in the lib.typ from my little testing
#counter(page).update(1)


= Test
#lorem(10)

== Test2
#lorem(10)

=== Test3
#lorem(10)

==== Test4
#lorem(10)

===== Test5
#lorem(10)

@tab:example shows example of table in this template. #lorem(10)

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1],[Content], [Content],
    [Row 2],[Content], [Content]
  )
) <tab:example>

== Test22
#lorem(10)

=== Test5
#lorem(10)

=== Test5
#lorem(10)

=== Test5
#lorem(10)


== Test5
#lorem(10)

=== Test5
#lorem(10)

= Test5
#lorem(10)

== Test5
#lorem(10)

=== Test5
#lorem(10)

=== Test5
#lorem(10)

#lorem(20)

== Test5
#lorem(10)


=== Test5
#lorem(10)


== Test5
#lorem(10)


== Test5
#lorem(10)

= Test5
#lorem(10)
