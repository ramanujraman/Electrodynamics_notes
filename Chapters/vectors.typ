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
  a'_j=l_(i j) a_i
$<def-eq-vector-transformation>
Now how to determine $l_(i j)$?
#exercise[Show that $l_(i j)$ is a rotation matrix.#emph[Hint: Use the fact that $vu(e)_i dprod vu(e')_j=l_(i j)$]]
Now this rule is clearly valid for every vector in $O_1$ and $O_2$ and I would like state the following results
+ If we have $vb(c)=alpha vb(a) + beta vb(b)$ then well have $c'_j=l_(i j)c_i$.
+ Say for the nth derivative of $vb(r)$ the $dv(r'_j,t,n)=l_(i j) dv(r_i,t,n)$.
#exercise[Prove the above the two properties.]
Now it is the time to introduce another important concept in vector analysis, the concept of a *scalar product*.
#definition("Scalar Product")[The scalar product of two vectors $vb(a)$ and $vb(b)$ is defined as
$
  vb(a) dprod vb(b)=a_i b_i
$<definition-scalar-product>
]
Now one would love to ask this question how dot product change under coordinate transformation and we'll leave it as an exercise for you.
#exercise[Show that scalar product is invariant under the coordinate transformation.]<exercise-scalar-prod-remain-invariant-under-lin-transf>

One more way to define scalar product or dot product is the following,
$
  vb(a) dprod vb(b) = abs(a)abs(b) cos(theta)
$<geometric-definition-dot-prod>
#think[How @definition-scalar-product and @geometric-definition-dot-prod are related?]
Now another important tool is *vector product*,
#definition("Vector Product")[For to vectors $va(a)$ and $va(b)$ one can define their vector product in the following manner
$
  vb(a) cprod vb(b) = epsilon_(i j k) hat(e)_i a_(j) b_(k)
$<def-eq-vector-prod>
]
where $epsilon_(i j k)$ is  #link("https://www.homepages.ucl.ac.uk/~ucappgu/seminars/levi-civita.pdf")[Levi-Civita-Tensor]. One can also give a geometric
definition in the following manner
$
  vb(a) cprod vb(b) = abs(a)abs(b) sin(theta) hat(n)
$<def-eq-geo-def-of-cprod>
where $hat(n)$ is perpendicular to both $vb(a)$ and $vb(b)$.

#think[How @def-eq-geo-def-of-cprod and @def-eq-vector-prod are related?]
here we are using Levi-Civita tensor $epsilon_(i j k)$ so I would like to enlist few to its properties
+ Let we have $epsilon_(i j k)$ for even permutation of i,j,k we have +1, for odd permutations of i,j,k we'll have -1 and other we'll have 0.
+ $
    epsilon_(i j k)epsilon_(p q k)=delta_(i p)delta_(j q)-delta_(i q)delta_(j p)
  $<Eq-one-index-contrc-levi-tens>
+ $
    epsilon_(i j k)epsilon_(p j k)=2 delta_(i p)
  $<Eq-two-index-contrc-levi-tens>
+ $
    epsilon_(i j k)epsilon_(i j k)=6
  $<Eq-three-index-contrc-levi-tens>

#exercise[Show that for the vectors $va(a)$,$va(b)$ and $va(c)$ to be coplanar then
  $
    epsilon_(i j k)a_i b_j c_k=0
  $]
#exercise[If $va(a)$ and $va(b)$ are any vectors then,
  $
    lr((va(a) cprod va(b))) dprod (va(a) cprod va(b))+(va(a) dprod va(b))^2 = abs(va(a))^2 abs(va(b))^2
  $ ]
Another important type of product that one encounters quite often is *triple product*.
Two kinds of triple product quite famous are *Vector Triple Product* and *Vector Scalar Product*. So let us start with triple scalar product simply can be given as
$va(a) dprod (va(a) cprod va(b))= epsilon_(i j k)a_i b_j c_k$
and triple vector product
$ va(c) cprod (va(b) cprod va(c))= epsilon_(i j k)vu(e_i)c_j(va(b) cprod va(c))_k $
I'll leave the rest to reader to work out and get this result
$
  va(a) cprod (va(b) cprod va(c))=va(b)(va(a) cprod va(c))-va(c)(va(a)cprod va(b))
$
and there is one more result I would like to put forward
$
  va(a) cprod (va(b) cprod va(c))+va(c)cprod(va(a)cprod va(b))+va(b)cprod(va(c)cprod va(a))=0
$
#example[
  Show $va(a)dprod(va(b) cprod va(c))$ vanishes identically if two of three vectors are proportional to each other.
  #solution[
    By using levi-civita tensor we have
      $
        va(a) dprod (va(b) cprod va(c))=epsilon_(i j k) a_i b_j c_k
      $
        without loss of generality, let $a=lambda b$
      $
        va(a)dprod(va(b)cprod va(c))= lambda epsilon_(i j k) b_i b_j c_k
      $
        Now the expression $epsilon_(i j k) b_i b_j c_k$ is actually the determinant of the following matrix
      $
            epsilon_(i j k)b_i b_j c_k = mdet(
                b_1 , b_2 , b_3 ;
                b_1 , b_2 , b_3 ;
                c_1 , c_2 , c_3
            )
      $
        because we have two rows same so by the properties of the determinant we have
      $
        epsilon_(i j k)b_i b_j c_k = 0
      $
        hence proved that, #emph[if two of three vectors are proportional to each other].
  ]
]
#exercise[
  If $vu(e)$ is an unit vector and $vu(a)$ an arbitrary vector then show that
    $
      va(a)=(va(a) dprod vu(e))+vu(e)cprod(va(a) cprod vu(e))
    $
    This shows that $va(a)$ can be resolved into component parallel to and one perpendicular to an arbitrary direction $vu(e)$.
]
#exercise[
    Prove the following identites
    + $
            (va(a)cprod va(b))dprod(va(c)cprod va(d))=mdet(
            va(a)dprod va(c) , va(b)dprod va(c) ;
            va(a)dprod va(d) , va(b)dprod va(d)
        )
      $
    + $
        (va(a)cprod va(b))cprod(va(c)cprod va(d))=[va(c)dprod(va(d)cprod va(a))]va(b)-[va(c)dprod(va(d)cprod va(b))]va(a)
      $

      $
        (va(a)cprod va(b))cprod(va(c)cprod va(d))=[va(a)dprod(va(b)cprod va(d))]va(c)-[va(a)dprod(va(b)cprod va(c))]va(d)
      $
    + $
      lr([va(a)dprod(va(b)cprod va(c))])va(d)=lr([va(d)dprod(va(b)cprod va(c))])va(a)+lr([va(a)dprod(va(d)cprod va(c))])va(b)+lr([va(a)dprod(va(b)cprod va(d))])
      va(c)
      $

]
