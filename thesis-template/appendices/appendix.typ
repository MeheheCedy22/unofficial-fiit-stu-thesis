= Random content which is not part of the thesis

#lorem(100)

#text(blue)[
  There are a testing image in appendix.
]

#figure(image("../assets/Test.svg", width: 30%), caption: [Appendix Test image]) <fig:appendix-test-image1>

#figure(image("../assets/Test.svg", width: 45%), caption: [Appendix Test image]) <fig:appendix-test-image2>


#text(blue)[
  Referencing images @fig:appendix-test-image1 and @fig:appendix-test-image2.
]

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example of a Table],
) <tab:example-fgh>

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example of a Table 2],
) <tab:example-rty>

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example of a Table 3],
) <tab:example-cvb>

#text(blue)[
  Referencing tables @tab:example-fgh, @tab:example-rty, and @tab:example-cvb.
]