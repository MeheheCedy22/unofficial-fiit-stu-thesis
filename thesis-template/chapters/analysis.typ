= Analysis

#lorem(250)

#figure(image("../assets/Test.svg", width: 50%), caption: [Test image]) <fig:test-image-asdf>

#figure(image("../assets/Test.svg", width: 50%), caption: [Test image]) <fig:test-image-qwer>

#text(blue)[
  Referencing images @fig:test-image-asdf and @fig:test-image-qwer.
]

#lorem(250)


#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example of a Table],
) <tab:example-iop>

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example of a Table 2],
) <tab:example-jkl>

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example of a Table 3],
) <tab:example-bnm>

#text(blue)[
  Referencing tables @tab:example-iop, @tab:example-jkl, and @tab:example-bnm.
]