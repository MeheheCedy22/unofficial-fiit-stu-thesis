#import "thesis-template/lib.typ": thesis

#show: thesis.with(
  title: [This is Title of Thesis], 
  author: "Janko Mrkvicka",

  // full: true -> show all references without citing
  // TODO: remove the full: true
  bibliography: bibliography("refs.bib", full: true),

  // TOOD: remove and fix
  abstract: [This is the abstract of the thesis.],
  index-terms: ("Index", "terms", "of", "the", "thesis"),

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
