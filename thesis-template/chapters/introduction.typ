#import "@preview/wordometer:0.1.4": word-count, total-words


= Introduction <sec:intro>
#lorem(100)

@tab:example shows example of table in this template. #lorem(10)

#figure(
  table(
    columns: 3,
    [], [*Col 1*], [*Col 2*],
    [Row 1], [Content], [Content],
    [Row 2], [Content], [Content],
  ),
  caption: [Example of a Table],
) <tab:example>

#lorem(20)

@fig:test-image shows test image.
#lorem(20)

#figure(
  image("../assets/Test.svg", width: 50%),
  caption: [Test image],
) <fig:test-image>

== Typst equation showcase (\<- explainer)
This is inline $f(x) = a dot x^2 + b dot x + c$ equation. You cannot number not reference inline equation.

This is an example of equation which have numbering and you can reference it.

Entropy:

$
  H(S) = sum_(n=1)^C -p_i dot log_2(p_i)
$ <eq:entropy>

Equation @eq:entropy shows how entropy is calculated. For math symbols check Typst documentation on math/symbols.

== Another Typst references (\<- explainer)

We explained this in @sec:intro.

This is a test cite @vaswani2023attentionneed.

This is a test cite of more than one reference @vaswani2023attentionneed @einstein2005albert @newton.

// you can remove this anytime, it is just for your information and testing for how many words are in this document (idk about accuracy, but seems good)
// the position in document does not alter the calculation so you can move it anywhere
#text(stroke: 0.3pt + red)[
  Bachelor thesis should have 40 standard pages (recommended). One standard page is defined as 1800 characters per page. This is calculated as 30 rows #sym.times 60 characters per row. You can also calculate it as \~250 words per standard page. This means that you need \~10,000 words for this document.

  There is total of #underline([#total-words / 10000]) words in this document to fullfil the requirements of the thesis. Note that there are so many words because of lorem ipsum text.
]

#pagebreak()

- Example of bulleted list
  - indented
    - more indented
      - even more
    - #lorem(4)
  - #lorem(4)
- #lorem(4)

+ Example of ordered list
+ More
  + indented
    + even more
    + more 2
  + #lorem(4)
  + #lorem(4)
+ #lorem(4)
