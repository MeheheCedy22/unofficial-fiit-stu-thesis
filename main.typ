#import "thesis-template/lib.typ": thesis

#show: thesis.with(
  title: [Test],
  author: (
    (
      // TODO: rename some stuff
      name: "Meno Priezvisko",
      department: [Faculty XYZ],
      organization: [University of XYZ],
      location: [City, Country],
      email: "xpriezvisko@stuba.sk"
    ),
  ),

  // full: true -> show all references without citing
  // TODO: remove the full: true
  bibliography: bibliography("refs.bib", full: true),

  // TOOD: remove and fix
  abstract: [#lorem(1)],
  index-terms: ("Kľúčové", "slová", "článku"),
  figure-reference-supplement: [Obr.],  // default
  table-reference-supplement: [Tabuľka],  // default
  section-reference-supplement: [Sekcia],  // default
  underline-links: 2,  // default
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
