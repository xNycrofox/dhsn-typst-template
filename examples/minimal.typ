#import "../lib.typ": *

#show: dhsnarticle.with(first: "firstname", last: "lastname", company: "comp", location: "Dresden")

#mktitle(
  title: "Test Report",
  img: image("../template/images/logo.png"),
  course: "science",
  number: 1234,
  corrector: ("corrector 1", "corrector 2"),
  themedate: today(),
  returndate: today(),
  type: "thesis",
)
#mkblocknotice(
  signature: image("../template/images/signature.png"),
  date: today(),
  location: "Dresden",
)
#mkfrontmatter[
  #heading(numbering: none)[Abkürzungsverzeichnis]
]

= abc
Le citation.#vglcite(<cloudcomp>)[17-22]
The duplicate.#vglcite(<cloudcomp>)[33-35]
longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong#vglcite(<rpa>)[38]
#footnote[longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong]

== sub
== pub

= abc
#dhsnfigure[Image regarding section abc][
  The image.
]
#pagebreak()

#dhsnappx[
  #dhsnfigure[Abc][
    asdasdas
  ]
  #addtoappx[Def]
  asdagggh

  #addtoappx[Ghi]
  eufzsiukefhabl@internal[7]
]

#bibliography("literatur.bib")
longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong longlonglong

#mkaffirmation(
  signature: image("../template/images/signature.png"),
  date: today(),
)
