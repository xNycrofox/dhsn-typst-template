#import "@local/baarticle:0.1.0": *

#show: basimple.with(
  first: "firstname",
  last: "lastname",
  company: "comp",
  location: "Dresden",
  img: image("images/logo.png"),
  course: "thecourse",
  title: "The title",
  number: 1234567,
  corrector: ("corrector1", "corrector2"),
  themedate: today(),
  returndate: today(),
  signature: image("images/signature.png"),
  companylocation: "Dresden",
  type: "thesis",
  acronyms: (
    HTTP: "Hypertext Transfer Protocol",
  ),
  bibliography: bibliography("document.bib"),
)

= Caption
Here is the content of paper.
#gls("HTTP") is a protocol on the OSI-Layer 7.#footnote[Also note that...]

indirect citation.#vglcite(<cloudcomp>)[17-21]
"direct citation"#bacite(<cloudcomp>)[29]
