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
#let chapter = [Introduction and Mathematical Tools]
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
#let A = (i,j) => $a_(#i #j)$
= #chapter
#v(2.5%)
/*-----------Body----------------------*/
== Introduction
Electrodynamics is the study of moving electric charges and their effects. Now the first question that comes to my mind is what is an electric charge? and the
answer is I don't know. But interestingly, the whole field is about interaction of electric charges and I don't what it is. Anyway let's put a hand wavy
definition for now and move on and I believe it'll work for most part of the course.
#definition("Electric Charge")[Electric Charge is a physical property of the matter that cause it to experience a force when placed in an electromagnetic field.
]<definition-electric-charge>
Not a very impressive definition but it'll do for now. But on the other hand, I don't think there are any better definitions out there. Let me ask you this
question, what is a mass? and one would give a same kind of definition for mass as well. So let's not bother ourselves with the definitions and move on.
Now the next question why one should study electrodynamics? Well, one of the aspirations of the physics community is to unify all the fundamental forces in the
universe and write a lagrangian which explain all phenomena in the universe. Electrodynamics is the success story of this aspiration. First comes Faraday unifying
electric and magnetic forces and leading to electromagnetism and then Maxwell enters the picture and unifies electrodyamics with optics and hence reducing three
courses,in principle into one. After Maxwell comes Einstein unifying electromagnetism, optics with gravity and completely changes the way we think about the
very fundamental ideas of the universe. The story doesn't ends here but still continues leading to the program of string theory in modern times. So in that sense
this topic is a part of quite a big legacy.\
Now another reason to study this topic is that it is the first field theory that one encounters in the physics curriculum. So it is a good starting point to learn
classical field theory but not in a big framework but a very specific one. But one only realise this after a couple of advanced courses in field theory. And
definitely one'll learn quite a few advanced mathematical techniques. In rest of the chapter I'll introduce mathematical techniques required to study this course,
starting with vector analysis.
== Vector and Tensor Analysis
Before talking about vectors and tensors let me introduce some basic definitions of vector analysis. So what is a scalar? well we all learnt in high school that
a scalar is something that has only magnitude and no direction. For example, mass, temperature, pressure etc. are all scalars.
#definition("Scalar")[A scalar is quantity specified by a single number and remains invariant under rotations.]<definition-Scalar>
on the other hand a vector is something that has both direction and magnitude. For example, velocity, force, electric field etc. are all vectors. Let's write a
more formal definition of a vector. But before that let me introduce a powerful notation.
=== Einstein Summation Convention
Consider a $3 times 3$ matrix given as
$
  A=#xmat(3,3,A)
$
Now consider a vector $vb(x)$ given as
$
  vb(x)=vec(x_1,x_2,x_3)
$
Now by matrix multiplication we can write $vb(tilde(x))=A vb(x)$ and we can this expression more explicitly as
$
  vec(tilde(x)_1,tilde(x)_2,tilde(x)_3)= vec(a_(11)x_1+a_(12)x_2+a_(13)x_3,a_(21)x_1+a_(22)x_2+a_(23)x_3,a_(31)x_1+a_(32)x_2+a_(33)x_3)
$
this equation can further be shrinked into the following form
$
  tilde(x)_i= a_(i 1) x_1+a_(i 2) x_2+a_(i 3) x_3
$
where #emph[i] is the $#emph[i]^("th")$ index of the vector and one realise that this can written as sum over a repeated index. So the final form of the equation is
$
  tilde(x)_i= a_(i j) x_j
$<defn-eq-einstein-summation-convention>
so the ensence of the einstein summation convention is that #emph[whenever there is a repeated index in a term, it is understood that it is summed over all
  possible values of the index.]\
Now let us see the definition of a vector.\
#definition("Vector")[A vector in a n-dimensional vector space is defined as quantity with n components in a given frame that transforms like
$
  a_i = l_(i j) b_j
$]<definition-vector>
Similarly one can also define a tensor as
#definition("Tensor of nth order")[A tensor of $n^("th")$ order is a quantity that transforms like
$
  tilde(T)_(i_1 i_2 ... i_n)= l_(i_1 j_1) l_(i_2 j_2) ... l_(i_n j_n) T_(j_1 j_2 ... j_n)
$
]<definition-tensor>
In simple words, if some quantity have n-indexes then it is a tensor of $n^("th")$ order. \
=== Vector Algebra and Transformation
As for the rule of algebra are concerned, the following rules are followed
+ Each vector have n components and can be given as a column matrix.
+ All rules of matrix algebra are valid.
Suppose we have a vector $vb(A)$ and it's representation in some frame O is given as
/*$
  vb(A)=vec(a_1,a_2,a_3)
$*/
$
  va(r)=a_j vu(e)_j
$
and say in some other frame $O'$ the representation is
/*$
  vb(A)=vec(a'_1,a'_2,a'_3)
$*/
$
  va(r)=a'_j vu(e')_j
$
but how these two representations are related? So we have
$
  a'_i=a_j vu(e)_i dprod vu(e)_j
$
Now one can define $l_(i j):= vu(e)_i dprod vu(e)_j$ and we arrive at the following equation defining vector transformations
$
  a'_i=l_(i j) a_j
$<def-eq-vector-transformation>
Now how to determine $l_(i j)$?
