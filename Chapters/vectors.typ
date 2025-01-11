#let chapter = [Vectors Analysis]
#set page(
  paper: "a4",
  header: align(left)[#chapter],
  numbering: "1",
)
#set heading(numbering: "1.1.1.a",supplement: [Chapter])
#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(center)
  #set text(20.74pt /*, weight: "regular"*/)
  #counter(heading).display(
    it.numbering
  )
   #smallcaps(it.body)

]
#set par(justify: true)
#set text(font: "New Computer Modern", lang: "en", size: 11pt)
#set math.equation(numbering: "(1)",supplement: [Eq.])
= #chapter
#v(2.5%)
== Introduction
Before we start we need to define what is a vector, tensor and scalar?
== Vector Algebra
