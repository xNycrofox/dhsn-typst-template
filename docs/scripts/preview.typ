// Arranges the pages of a compiled example on a single overview image
// typst compile --root <dir> --input dir=<pages> --input n=<count> preview.typ preview.png
#let dir = sys.inputs.dir
#let n = int(sys.inputs.n)
#set page(width: auto, height: auto, margin: 6pt, fill: rgb("#d0d7de"))
#grid(
  columns: 5,
  gutter: 6pt,
  // the page numbers of the file names are padded with zeros
  ..range(1, n + 1).map(i => {
    let name = "0" * (str(n).len() - str(i).len()) + str(i)
    image(dir + "/" + name + ".png", width: 6cm)
  })
)
