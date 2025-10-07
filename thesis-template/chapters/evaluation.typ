= Evaluation

#lorem(10)

#text(blue)[
  @fig:test-image-eval shows test image.
]
#lorem(20)

#figure(image("../assets/Test.svg", width: 50%), caption: [Second Test image]) <fig:test-image-eval>

#figure(image("../assets/Test.svg", width: 25%), caption: [Test image]) <fig:test-image-zxvc>

#text(blue)[
  Referencing image @fig:test-image-zxvc.
]

#text(blue)[
  @tab:example-eval shows example of table in this template.
]
#lorem(10)

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Another Example of a Table],
) <tab:example-eval>

#lorem(100)
