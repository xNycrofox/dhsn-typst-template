#import "../lib.typ": *

#show: dhsnsimple.with(
  first: "firstname",
  last: "lastname",
  company: "comp",
  location: "Dresden",
  img: image("../template/images/logo.png"),
  course: "thecourse",
  title: "Lorem ipsum dolor sit amet consetetur sadipscing elitr sed diam nonumy eirmod tempor invidunt ut",
  number: 1234567,
  corrector: ("corrector1", "corrector2"),
  themedate: today(),
  returndate: today(),
  signature: image("../template/images/signature.png"),
  companylocation: "Dresden",
  type: "thesis",
  acronyms: (
    HTTP: "Hypertext Transfer Protocol",
    UC: "Underpinning contract",
    ulong: "unsigned 64-bit integer",
  ),
  glossary: (
    cloud: (
      name: "Cloud Computing",
      description: [Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user.],
    ),
  ),
  abstract: [
    #lorem(90)

    #lorem(70)

    #lorem(80)
  ],
  abstractintoc: true,
)

= De finibus bonorum et malorum

== Sed ut perspiciatis

And also very satisfying. #gls("HTTP")#gls("UC")#gls("ulong")

#gls("cloud") is a term for ...

#lorem(100)

== Sed ut perspiciatis

#lorem(80)

#lorem(90)

= Das höchste Übel

#lorem(100)

// sample table with text
#dhsntable[My first table][
  #table(
    columns: (auto, 40%, 45%),
    align: left,
    stroke: (x, y) => (left: if x > 0 { 0.4pt }, top: if y > 0 { 0.4pt }),
    [*Type*], [*Description*], [*Value*],
    [1], lorem(40), lorem(45),
    [2], lorem(35), lorem(40),
  )
]

#lorem(100)

= Das höchste Gut

#lorem(100)

// sample table with numbers
#dhsntable[My second table][
  // Alignments: 1st column left, 2nd middle and 3rd right, with vertical lines in between
  #table(
    columns: 3,
    align: (left, center, right),
    stroke: (x, y) => (left: if x > 0 { 0.4pt }, top: if y == 1 { 0.4pt }),
    $alpha$, $beta$, $gamma$,
    [1], [11.1], [a],
    [2], [180.1], [b],
    [3], [4.25231], [c],
  )
]

#dhsncode[Wonderful python code][
  ```python
  print("Hello World!")
  ```
]

// appendix
#dhsnappx[
  #dhsnfigure[An intresting addition][
    #lorem(60)

    #lorem(60)
  ]
  #dhsncode(label: "appendix-code")[Wonderful python code][
    ```python
    print("Hello World!")
    ```
  ]
]
