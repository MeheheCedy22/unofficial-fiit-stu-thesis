= Evaluation
#lorem(10)
@fig:test-image2 shows test image. #lorem(20)

#figure(
  image("../assets/Test.svg", width: 50%),
  caption: [Second Test image],
) <fig:test-image2>

@tab:example2 shows example of table in this template. #lorem(10)

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example 2 of a Table],
) <tab:example2>

#lorem(100)
