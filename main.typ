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
  bibliography: bibliography("refs.bib", full: true)
)

= Test
#lorem(10)