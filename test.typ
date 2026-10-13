// Some sort of unit tests for the template
// Compilation fails if an assertion does not hold: `typst compile test.typ`
#import "lib.typ": *

#show: baarticle.with(
  first: "firstname",
  last: "lastname",
  company: "comp",
  location: "Dresden",
  linkcoloring: true,
  codetheme: "github-dark",
)

// Test counter
#let tst = counter("tst")

// Assertion helper, prints the result and lets the compilation fail if the test fails
#let check(description, got, expected) = {
  assert(got == expected, message: description + ": expected " + repr(expected) + ", got " + repr(got))
  tst.step()
  block(spacing: 0.8em, text(font: "DejaVu Sans Mono", size: 9pt)[
    Test #context tst.display() (Assert #description): #text(fill: green)[Passed]
  ])
}

#mktitle(
  title: "Test Report",
  img: rect(width: 3cm, height: 1.5cm)[A],
  course: "science",
  number: 1234,
  corrector: "corrector 1, corrector 2",
  themedate: today(),
  returndate: datetime(year: 2021, month: 9, day: 24),
  type: "thesis",
)
#context check("title page increases page counter", counter(page).get(), (2,))
#mkblocknotice(signature: rect[A], date: today(), location: "Dresden")
#mkainotice(model: "GPT-4omini, DALL-E")
#mkgendernotice()
#mkaffirmation(signature: rect[A], date: today())
#mkfrontmatter(printacronyms())
#context check("frontmatter swaps to arabic page numbering", counter(page).display(), "1")

== Lengths
#context check("parindent is 0", par.first-line-indent.amount, 0pt)
#context check("paragraphs are justified", par.justify, true)
#context check("font size is 12pt", text.size, 12pt)
#context check("left margin is 3cm", page.margin.left, 3cm)
#context check("top margin is 3cm", page.margin.top, 3cm)

== Helpers
#check("dates are printed in german", format-date(datetime(year: 2021, month: 9, day: 24)), "24. September 2021")
#check("dates given as text are kept", format-date("heute"), "heute")
#check("type thesis", paper-type("thesis", course: "c"), paper-type("thesis", degreetype: "Science", course: "c"))
#check("type study", paper-type("study"), [
    Studienarbeit
  ])
#check("custom type", paper-type("Praxisbericht"), "Praxisbericht")
#check("no ai model", ai-models(()), none)
#check("one ai model", ai-models("A"), [
    Als Modell wurde #"A" verwendet.
  ])
#check("many ai models", ai-models("A, B"), ai-models(("A", "B")))

== Environments
// Test environment captions
#check("caption is Title (Quelle: eigene Darstellung)", env-caption("Title"), [
    #"Title" (Quelle: eigene Darstellung)
  ])
#check("caption is Title (Quelle: Source)", env-caption("Title", source: "Source"), [
    #"Title" (Quelle: #"Source")
  ])

#bafigure("Test1")[Content2]
#bafigure(source: "Source2", label: "thesecond")[Test2][Content]
#bafigure(placement: bottom)[Test3][Content]
#batable("Table1")[The Table]
#batable(source: captioncite(<cloudcomp>)[12], placement: bottom)[Table2][The Table2]
#bacode("Code1")[
  ```python
  # a comment
  print("Hello World!")
  ```
]

#context check("label is the title if not set explicitly", counter(figure.where(kind: image)).at(label("Test1")), (1,))
#context check("label can be set", counter(figure.where(kind: image)).at(<thesecond>), (2,))
#context check("tables are counted on their own", counter(figure.where(kind: table)).at(label("Table1")), (1,))
#context check("figures are listed", query(figure.where(kind: image)).len(), 3)

References: @thesecond, @Table1, @Code1 and #link("https://typst.app")[a link].
#gls("HTTP") and #gls("HTTP").#vglcite("cloudcomp", 3)#bacite(<cloudcomp>)

#newacronym("HTTP", "HTTP", "Hypertext Transfer Protocol")

#baappx[
  #bafigure("Appx1")[Content]
  #addtoappx[Appx2]
  #context check("appendix entries are counted", counter(figure.where(kind: "ba-appx")).get(), (2,))
  #context check("appendix entries are not listed as figures", query(figure.where(kind: image)).len(), 3)
  The last entry is #theappx().
]

#bibliography("minimal.bib")
