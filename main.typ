#align(center,text(25pt,font: "New Computer Modern", lang: "en")[Electrodynamics])
#pagebreak()
#set heading(numbering: "1.1",supplement: [Chapter])
#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(center)
  #set text(20.74pt, weight: "regular")
  #smallcaps(it.body)
]
#show heading.where(
  level: 2
): it => block(width: 100%)[
  #set align(left)
  #set text(14.4pt, weight: "regular")
  #smallcaps(it.body)
]
#show heading.where(
  level: 3
): it => block(width: 100%)[
  #set align(left)
  #set text(12pt, weight: "regular")
  #smallcaps(it.body)
]
#show heading.where(
  level: 4
): it => block(width: 100%)[
  #set align(left)
  #set text(11pt, weight: "regular")
  #smallcaps(it.body)
]
#outline( title: [Contents], indent: auto)
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#pagebreak()
= Chapter-1:Vectors: Algebra and Calculus
#include "Chapters/vectors.typ"
