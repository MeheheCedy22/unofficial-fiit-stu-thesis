#import "thesis-template/lib.typ": thesis

#show: thesis.with(
  title: [Title of the Thesis], 
  author: "Janko Mrkvicka",
  thesis-supervisor-name: "Ing. Giovanni Petr, PhD.",
  dateEN: [January 2025],
  dateSK: [Január 2025],
  annotationEN: [Annotation text. #underline("Size should be 150-200 words.") #lorem(150)],
  annotationSK: [Text anotácie. #underline("Dĺžka by mala byť 150-200 slov.") #lorem(150)],
  abstract: [This is the abstract of the thesis.],
  index-terms: ("Index", "terms", "of", "the", "thesis"),

  assignment: "../assets/Test.svg",

  // full: true -> show all references without citing
  // TODO: remove the full: true
  bibliography: bibliography("refs.bib", full: true),

  // TOOD: remove and fix


  figure-reference-supplement: [Obr.],  // default
  table-reference-supplement: [Tabuľka],  // default
  section-reference-supplement: [Sekcia],  // default

  underline-links: true,  // default true
)


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
