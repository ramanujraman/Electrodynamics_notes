#import "@preview/physica:0.9.4": *
/*-----theorem environment--------- */
#import "@preview/ctheorems:1.1.3":*
#show: thmrules

#let theorem = thmbox(
"theorem", // identifier
"Theorem", // head
fill: rgb("#e8e8f8")
)

#let lemma = thmbox(
"theorem", // identifier - same as that of theorem
"Lemma", // head
fill: rgb("#efe6ff"))

#let corollary = thmbox(
"corollary", // identifier
"Corollary", // head
base: "theorem", // base - use the theorem counter
fill: rgb("#f8e8e8")
)

#let proof = thmproof("proof", "Proof")
#let solution = thmproof("solution", "Solution")

#let example = thmbox(
"example",
"Example",
base_level: 1,
stroke: rgb("#000000") + 1pt
)

#let exercise = thmbox(
"exercise",
"Exercise",
base_level: 1,
stroke: rgb("#000000") + 1pt
)

#let definition = thmbox(
"definition",
"Definition",
base_level: 1, stroke: rgb("#68ff68") + 1pt
// take only the first level from the base
)
/*-----Page Environment--------- */
#let chapter = [Electric Field in Matter]
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
/*-----------Some Mathematical shortcuts----------------------*/

= #chapter
#v(2.5%)
/*-----------Body----------------------*/
== Introduction
