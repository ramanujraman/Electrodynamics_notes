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
#let chapter = [Maxwell's Equations]
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
== Electromotive Force
== Electromagnetic Induction
== Maxwell's Equations
Okk so now let us try to summarize everything we have learnt till now and what actually Maxwell had in front of him when he tried to fix the theory of
electromagnetism. So let us write them down
$
  div va(E) = rho/epsilon_0
$<eq-div_E>
 $
  div va(B) = 0
  $<eq-div_B>
 $
  curl va(E) = - pdv(va(B),t)
  $<eq-curl_E>
 $
  curl va(B) = mu_0 va(J)
  $<eq-wrong-curl_B>
Now let us try to understand the problem with the above equations. Take the @eq-curl_E and take the divergence of it. We get $div (curl va(E))=-dv(div(va(B)),t)$
Now we have both left and right hand sides of the equation to zero. Now for @eq-wrong-curl_B we have $div(curl va(B)) = mu_0 div va(J)$ in which left hand side
is zero but right hand side is not in general except we for steady current. So how do we fix it? We need to add a term to the equation which will make the right
hand side zero. So by using equation of continuity we can write $div va(J) = -pdv(rho,t)$ and hence we can write the corrected equation as and by using @eq-div_E
we have $div va(J) = -epsilon_0 pdv(div(va(E)),t)$ and hence we have $va(J)= -epsilon_0 pdv(va(E),t)$ and hence the corrected equation is
$
  curl va(B) = mu_0 va(J) + mu_0 epsilon_0 pdv(va(E),t)
$<eq-curl-B>
and we have a quantity called *displacement current* that we define as
#definition("Displacement Current")[
  We define the displacement current as
  $
    va(J_d) = epsilon_0 pdv(va(E),t)
  $<eqn_displace-current>
]
Now we can write all the maxwell's equations in differential form as
$
  div va(E) = rho/epsilon_0
$
$
  div va(B) = 0
$
$
  curl va(E) = - pdv(va(B),t)
$
$
  curl va(B) = mu_0 va(J) + mu_0 epsilon_0 pdv(va(E),t)
$
We can also write the equations in integral form as
$
  integral.surf va(E) dot dd(va(a)) = Q/epsilon_0
$<eq-int-gauss-law>
$
  integral.surf va(B) dot dd(va(a)) = 0
$<eq-int-div_B>
$
  integral.cont va(E) dot dd(va(l)) = -integral.surf pdv( va(B) dot dd(va(a)),t)
$<eq-int-curl-E>
$
  integral.cont va(B) dot dd(va(l)) = mu_0 i + mu_0 epsilon_0 integral.surf pdv(va(E) dot dd(va(a)),t)
$<eq-int-curl-B>
One can derive the above simply using the integral theorems discussed in earlier chapters. Now let us try to understand the physical significance of the
@eq-int-curl-B. Suppose we have a capacitor attached to a battery, we can measure the current in the circuit by measuring the magnetic field around the
circuit, using the amperian loop. Now so if we make a
