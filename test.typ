#set heading(numbering: "1. 1")
= Heading 1
== Heading 2

#{
  show heading: set align(center)
  show heading: set block(above: 5em)
  set heading(numbering: "A. 1  ")
  [
  = Heading 1
  == Heading 2
  ]
}

#{
  show heading.where(level: 1): it => {
    pagebreak()
    it
  }
  [
    = Heading 1
    == Heading 2
  ]
}

#set heading(numbering: none)
= Heading 3