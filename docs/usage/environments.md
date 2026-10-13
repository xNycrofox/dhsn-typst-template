---
title: Environments
sort: 4
---

# Environments

The template provides two functions to deal with figures and tables.
Both will not break if the content spans multiple pages, the content is moved to the next page instead.
Therefore, it could make sense to split up large content and use multiple `bafigure` or `batable`.
There's also an additional function to deal with code snippets in your work, `bacode`.

## bafigure

The `bafigure` function creates a frame and a label around its content and adds an entry to the list of figures.
It also adds the given caption with a source reference below the figure.

```typst
#bafigure(
  source: [SOURCE],
  placement: auto,
  label: "LABEL",
)[CAPTION][
  // The content e.g. #image("...")
  // Large images should be nicely sized by setting their width to 14cm, e.g. #image("...", width: 14cm)
]
```

Let's describe the optional arguments shortly:

- `source` is the source of the figure, it defaults to you. To cite something here properly `captioncite` should be used, e.g. `source: captioncite(<citekey>)[17]`.
- `placement` describes the placement of the figure, it defaults to `none`, which puts the figure exactly where it was specified in the code. Other values are `auto`, `top` and `bottom`.
- `label` is the label, which you can use in `@label`, it defaults to the provided caption.

```note
 A reference like `@label` renders to "Abbildung 1". To get the number only use `#ref(<label>, supplement: none)`. If the label is the caption and contains spaces, the reference has to be written as `#ref(label("the caption"))`.
```

## batable

The `batable` function centers its content and adds an entry to the list of table.
It also adds the given caption with a source reference below the table.

```typst
#batable(
  source: [SOURCE],
  placement: auto,
  label: "LABEL",
)[CAPTION][
  // The content e.g. a #table(...)
]
```

The optional arguments have the same meaning as for `bafigure`.

- `source` is the source of the table, it defaults to you. To cite something here properly `captioncite` should be used.
- `placement` describes the placement of the table, it defaults to `none`, which puts the table exactly where it was specified in the code.
- `label` is the label, which you can use in `@label`, it defaults to the provided caption.

Footnotes in tables work as everywhere else with `#footnote[...]`.

## bacode

The `bacode` function provides a caption for its content and adds it to the list of codes.
The caption which includes a source reference is placed beneath the code snippet. Unlike figures and tables code may span multiple pages.

````typst
#bacode(
  source: [SOURCE],
  label: "LABEL",
)[CAPTION][
  ```python
  print("Hello World!")
  ```
]
````

The optional arguments have the same meaning as for `bafigure` and `batable`.

- `source` is the source of the code, it defaults to you. To cite something here properly `captioncite` should be used.
- `placement` is **not** available.
- `label` is the label, which you can use in `@label`, it defaults to the provided caption.

The template provides 2 different styling options for your code highlighting. These theme options are `github-light` and `github-dark` and are orientated on the code highlighting from [GitHub](https://github.com). Unfortunately the DHSN itself doesn't provide any requirements for code formatting, highlighting etc. The default theme option is `github-light`. If you want to change this you can do this with the option `codetheme: "github-dark"` of `basimple` and `baarticle`. `codetheme: none` disables the styling of the template, so that you can style code blocks with your own show rules. If you want to learn more about code in Typst you can visit the [raw](https://typst.app/docs/reference/text/raw/) reference.

## baappx

The `baappx` function creates the appendix along with list of all appendix entries and adds required entries to the table of contents.
It adjusts the behavior of `bafigure`, `batable` and `bacode` so that they do not add entries to the list of figures/tables/codes and
put them instead into the list of all appendix entries.

```typst
#baappx[
  #bafigure[CAPTION][
    // A figure in the appendix
  ]
  #pagebreak()
  #batable[CAPTION][
    // A table in the appendix
  ]
]
```

Throughout the document `#theappx()` can be used to get the number/index of the last appendix entry.
An entry to the list of all appendix entries can be created manually with `#addtoappx[caption]`
