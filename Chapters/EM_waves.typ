#import "@preview/physica:0.9.4": *
/*-----theorem environment--------- */
#import "@preview/ctheorems:1.1.3":*
#show: thmrules
#show link: underline
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
#let think = thmbox(
"theorem", // identifier
"Think", // head
fill: rgb("#f4fde5")
).with(numbering: none)

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
#let remark = thmplain("remark", "Remark").with(numbering: none)

#let definition = thmbox(
"definition",
"Definition",
base_level: 1, stroke: rgb("#68ff68") + 1pt
// take only the first level from the base
)
/*-----Page Environment--------- */
#let chapter = [Electromagnetic Waves]
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
#show bibliography: set heading(numbering: "1.")
/*-----------Some Mathematical shortcuts----------------------*/

= #chapter
#v(2.5%)
/*-----------Body----------------------*/
== Introduction
We have maxwell's equations as
$
  div va(E) = rho/epsilon_0
$<eq-div-E>
$
  div va(B) = 0
$<eq-div-B>
$
  curl va(E) = -pdv(va(B),t)
$<eq-curl-E>
$
  curl va(B) = mu_0 J + mu_0 epsilon_0 pdv(va(E),t)
$<eq-curl-B>
Now we this set of equations couple both $va(E)(va(r),t)$ and $va(B)(va(r),t)$ and now we can decouple them and get two decoupled sets of equations and we can
simply have wave equations in different situations.
== Electromagnetic Waves in Free Space
Now let us try to decouple the above equations and get the wave equations. We can decouple the above equations and get the wave equations assuming there is no
charge in the media and nor we have any current flowing. So we have the Maxwell's equations as @eq-div-E to @eq-curl-B for vaccum them we have
$
  div va(E) = 0
$<eq-div-E-vaccum>
$
  div va(B) = 0
$
$
  curl va(E) = -pdv(va(B),t)
$
$
  curl va(B) = mu_0 epsilon_0 pdv(va(E),t)
$<eq-curl-B-vaccum>
Now by taking curl for @eq-curl-E and by using the identity $curl (curl va(A))=grad(div va(A))-laplacian(va(A))$ so we have the resulting equation as
$
  grad(div va(E))-laplacian(va(E)) = -pdv(curl va(B),t)
$
Now by using @eq-div-E-vaccum and @eq-curl-B-vaccum we have the wave equation as
$
  laplacian va(E) = mu_0 epsilon_0 pdv(va(E),t,2)
$<eq-wave-eqn-E-field>
and similarly one can find one equation for magentic field as by taking curl of @eq-curl-B-vaccum and using @eq-div-B have
$
  laplacian va(B) = mu_0 epsilon_0 pdv(va(B),t,2)
$<eq-wave-eqn-B-field>
Now these two are typical PDEs for wave equations so we can compare it with the standard wave equation PDE $laplacian f = 1/v^2 pdv(f,t,2)$ and hence we can have
the velocity of the wave as $v = 1/sqrt(mu_0 epsilon_0)$ and this is interestingly is the speed of light.
== Electromagnetic Waves in a Medium
== Electromagnetic Waves in Conducting Medium
