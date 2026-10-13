---
layout: default
title: Motivation
sort: 2
---

# Motivation

Some general information about Typst, why you should use it for writing scientific papers, how to install
and use it can be found in the [tutorial](https://typst.app/docs/tutorial/) and the [guide for LaTeX users](https://typst.app/docs/guides/guide-for-latex-users/).
Typst does not follow the "What you see is what you get" principle. You write plain text with a lightweight markup and the compiler turns it into a PDF.
It is a lot easier to learn than LaTeX, compiles within milliseconds, so a preview can follow every keystroke, and reports understandable errors.
From my point of view learning Typst is worthwhile. Some arguments to justify the effort to get into Typst are listed below.

One major advantage of Typst is consistent formatting.
If the code describing the formatting of paper is correct, there cannot be any formatting errors.
Following the styleguide, using correct spelling and grammar make up more than a half of the DHSN Dresden's assessment,
so you can basically pass any required scientific work without content but correct formatting.
A rule, which easily creates violations of the styleguide, is that every citation after the first has to replace the
author and year with "ebenda".
You might do it right while writing the paper the first.
After receiving feedback you might copy blocks of text around. Obviously, this will move citations and if inattentive
violate the rule. Moreover, this template sorts the abbreviations and provides the full term on the first occurrence
automatically, creates compliant bibliography, creates compliant references on images and so on.

Additionally, Typst can easily be used with version control systems.
This makes working in a group super easy, because Typst separates the document's content from its design.
Furthermore, there is only a single, correct and reproducible version.
Copies containing different versions cannot exist.
If you are using GitHub reviews could be made with pull requests.

Unfortunately, the DHSN styleguide makes the usage of Typst for the average user unnecessarily hard.
There is no style included in Typst, which fulfills the requirements of the DHSN.
That is why this template has been created.
