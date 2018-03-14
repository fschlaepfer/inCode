---
title: You Could Have Invented Matrices!
categories: Math, Rambling
tags: linear algebra
create-time: 2018/03/09 14:25:14
identifier: invent-matrices
slug: you-could-have-invented-matrices
---

You could have invented matrices!

Let's talk about vectors.  A **vector** (denoted as $\mathbf{x}$, a lower-case
bold italicized letter) is an element in a **vector space**, which means that
it can be "scaled", like $c \mathbf{x}$ (the $c$ is called a "scalar" ---
creative name, right?) and added, like $\mathbf{x} + \mathbf{y}$.

In order for vector spaces and their operations to be valid, they just have to
obey some [common-sense rules][laws] (like associativity, commutativity,
distributivity, etc.) that allow us to make meaningful conclusions.

[laws]: https://en.wikipedia.org/wiki/Vector_space#Definition

Dimensionality
--------------

One neat thing about vector spaces is that, in *some* of them, you have the
ability to "decompose" any vector in it as a weighted sum of some set of
**basis vectors**.  If this is the case for your vector space, then the size of
smallest possible set of basis vectors is known as the **dimension** of that
vector space.

For example, for a 3-dimensional vector space $V$, any vector $\mathbf{x}$ can
be described as a weighted sum of three basis vectors.  If we call them
$\mathbf{v}_1$, $\mathbf{v}_2$, $\mathbf{v}_3$, then:

$$
\mathbf{x} = a \mathbf{v}_1 + b \mathbf{v}_2 + c \mathbf{v}_3
$$

Where $a$, $b$, and $c$ are scalars.

Dimensionality is really a statement about being able to decompose any vector
in that vector space into a useful set of bases.  For a 3-dimensional vector
space, you can make a bases that can reproduce *any* vector in your space...but
that's only possible with at least three vectors.

Some examples include:

*   In physics, we often treat reality as taking place in a three-dimensional
    vector space.  The basis vectors are often called $\hat{\mathbf{i}}$,
    $\hat{\mathbf{j}}$, and $\hat{\mathbf{k}}$, and so we say that we can
    describe our 3D physics vectors as $\mathbf{r} = r_x \hat{\mathbf{i}} + r_y
    \hat{\mathbf{j}} + r_x \hat{\mathbf{k}}$.
*   The set of all polynomials ($5 p^2 - 3 p + 2$, etc.) is an
    infinite-dimensional vector space, whose scalars are set of possible
    coefficients.  Polynomials can be scaled and added together.  One possible
    basis is $1$, $p$, $p^2$, $p^3$, etc.; any polynomial can be made as a
    weighted combination of these.
*   N-Tuples of $\mathbb{R}$ (ordered sequences of a given length) are a vector
    space, and they're one of the more common examples.  One possible basis for
    $\mathbb{R}^3$ is $(1,0,0)$, $(0,1,0)$, and $(0,0,1)$.  N-tuple of real
    numbers can be expressed as a weighted sum of these.

### Encoding

One neat thing that physicists take advantage of all the time is that if we
*agree* on a set of basis vectors and a specific ordering, we can actually
*encode* any vector $\mathbf{x}$ in terms of those basis vectors.

So in physics, we can say "Let's encode vectors in terms of $\hat{\mathbf{i}}$,
$\hat{\mathbf{j}}$, and $\hat{\mathbf{k}}$, in that order."  Then, we can
*write* $\mathbf{r}$ as $\langle r_x, r_y, r_z \rangle$, and understand that we
really mean$\mathbf{r} = r_x \hat{\mathbf{i}} + r_y \hat{\mathbf{j}} + r_x
\hat{\mathbf{k}}$.

Note that $\langle r_x, r_y, r_z \rangle$ is **not** the same thing as the
**vector** $\mathbf{r}$.  It is *an encoding* of that vector, that only makes
sense once we choose to *agree* on a specific set of basis.  If we chose a
different basis, we'd have a different encoding.

For an N-dimensional vector space, it means that, with a minimum of N items, we
can represent any vector in that space.  And, if we agree on those N items, we
can devise an encoding, such that:

$$
\langle x_1, x_2 \dots x_N \rangle
$$

will *represent* the vector:

$$
x_1 \mathbf{v}_1 + x_2 \mathbf{v}_2 + \ldots + x_N \mathbf{v}_N
$$

Note that what this encoding represents is *completely dependent* on what
$\mathbf{v}_1, \mathbf{v}_2 \ldots \mathbf{v}_N$ we pick, and in what order.
The basis vectors we pick are arbitrary, and determine what our encoding looks
like.

To highlight this, note that the same vector $\mathbf{x}$ has many many
different potential encodings --- all you have to do is pick a different set of
basis vectors, or even just re-arrange or re-scale the ones you already have.
However, all of those encodings correspond go the same vector $\mathbf{v}$.

One interesting consequence of this is that any N-dimensional vector space
whose scalars are in $\mathbb{R}$ is actually isomorphic to $\mathbb{R}^N$ ---
the vector space of N-tuples of real numbers.  This means that we can basically
treat any N-dimensional vector space with $\mathbb{R}$ scalars as if it was
$\mathbb{R}^N$, *once we decide* on the basis vectors.  Because of this, we
often call *all* N-dimensional vector spaces (whose scalars are in
$\mathbb{R}$) as $\mathbb{R}^N$.  You will often hear physicists saying that
the three-dimensional vector spaces they use are $\mathbb{R}^3$.  However, what
they really mean is that their vector spaces is *isomorphic* to $\mathbb{R}^3$.

Linear Transformations
----------------------

Now, one of the most interesting things in mathematics is the idea of the
**linear transformation**.  Linear transformations are useful to study because:

1.  They are ubiquitous.  They come up everywhere in engineering,
    physics, mathematics, data science, economics, and pretty much any
    mathematical theory.  And there are even more situations which can be
    *approximated* by linear transformations.
2.  They are mathematically very nice to work with and study, in practice.

A linear transformation, $f(\mathbf{x})$, is a function that "respects"
addition and scaling:

$$
\begin{aligned}
f(c\mathbf{x}) & = c f(\mathbf{x}) \\
f(\mathbf{x} + \mathbf{y}) & = f(\mathbf{x}) + f(\mathbf{y})
\end{aligned}
$$

This means that if you scale the input, the output is scaled by the same
amount.  And also, if you transform the sum of two things, it's the same as the
sum of the transformed things (it "distributes").

Note that I snuck in vector notation, because the concept of vectors are
*perfectly suited* for studying linear transformations.  That's because talking
about linear transformations requires talking about scaling and adding,
and...hey, that's just exactly what vectors have!

From now on, we'll talk about linear transformations specifically on
*N-dimensional vector spaces* (vector spaces that have dimensions and bases we
can use).

### Studying linear transformations

From first glance, a linear transformation's description doesn't look too
useful or analyzable.  All you have is $f(\mathbf{x})$.  It could be anything!
Right?  Just a black box function?

But, actually, we can exploit its linearity and the fact that we're in a vector
space with a basis to analyze the heck out of any linear transformation, and
see that all of them actually have to follow some specific pattern.

Let's say that $A(\mathbf{x})$ is a linear transformation from N-dimensional
vector space $V$ to M-dimensional vector space $U$.  That is, $A : V
\rightarrow U$.

Because we know that, once we pick a set of basis vectors $\mathbf{v}_i$, any
vector $\mathbf{x}$ in $V$ can be decomposed as $x_1 \mathbf{v}_1 + x_2
\mathbf{v}_2 + \ldots x_n \mathbf{v}_N$, we really can just look at how a
transformation $A$ acts on this decomposition.  For example, if $V$ is
three-dimensional:

$$
A(\mathbf{x}) = A(x_1 \mathbf{v}_1 + x_2 \mathbf{v}_2 + x_3 \mathbf{v}_3)
$$

Hm.  Doesn't seem very insightful, does it?

### A simple definition

But!  We can exploit the linearity of $A$ (that it distributes and scales) to
rewrite that as:

$$
A(\mathbf{x}) = x_1 A(\mathbf{v}_1) + x_2 A(\mathbf{v}_2) + x_3 A(\mathbf{v}_3)
$$

Okay, take a moment to pause and take that all in.  This is actually a pretty
big deal!  This just means that, to study $A$, **all you need to study** is how
$A$ acts on our *basis vectors*.  If you know how $A$ acts on our basis vectors
of our vector space, that's really "all there is" about $A$!  Not such a black
box anymore!

That is, if I were to ask you, "Hey, what is $A$ like?", *all you'd have to
tell me* is the result of $A(\mathbf{v}_1)$, $A(\mathbf{v}_2$, and
$A(\mathbf{v}_3)$.  Just give me those three *vectors*, and we *uniquely
determine $A$*.

To put in another way, *any linear transformation* from a three-dimensional
vector space is uniquely characterized and determined by *three vectors*:
$A(\mathbf{v}_1)$, $A(\mathbf{v}_2)$, and $A(\mathbf{v}_3)$.

Those three vectors *completely define* $A$.

In general, we see that *any linear transformation* from an N-dimensional
vector space can be *completely defined* by N vectors: the N results of that
transformation on each of N basis vectors we choose.

### Enter the Matrix

Okay, so how do we "give"/define/state those N vectors?

Well, recall that the result of $A(\mathbf{x})$ and $A(\mathbf{v}_1)$, etc. are
*themselves* vectors, in M-dimensional vector space $U$.  Let's say that $U$ is
2-dimensional, for now.

This means that any vector $\mathbf{y}$ in $U$ can be represented as $y_1
\mathbf{u}_1 + y_2 \mathbf{u}_2$, where $\mathbf{u}_1$ and $\mathbf{u}_2$ is an
arbitrary choice of basis vectors.

This means that $A(\mathbf{v}_1)$ etc. can also all be represented in terms of
these basis vectors.  So, laying it all out:

$$
\begin{aligned}
A(\mathbf{v}_1) & = a_{11} \mathbf{u}_1 + a_{21} \mathbf{u}_2 \\
A(\mathbf{v}_2) & = a_{12} \mathbf{u}_1 + a_{22} \mathbf{u}_2 \\
A(\mathbf{v}_3) & = a_{13} \mathbf{u}_1 + a_{23} \mathbf{u}_2
\end{aligned}
$$

Or, to use our bracket notation from before:

$$
\begin{aligned}
A(\mathbf{v}_1) & = \langle a_{11}, a_{21} \rangle \\
A(\mathbf{v}_2) & = \langle a_{12}, a_{22} \rangle \\
A(\mathbf{v}_3) & = \langle a_{13}, a_{23} \rangle
\end{aligned}
$$

So, we now see two facts:

1.  A linear transformation from an N dimensional vector space to an M
    dimensional vector space can be *defined* using N vectors.
2.  Each of those N vectors can, themselves, be defined using M scalars each.

Our final conclusion: *any* linear transformation from an N dimensional vector
space to an M dimensional vector space can be completely defined using $N M$
scalars.

That's right -- *all* possible linear transformations from a 3-dimensional
vector space to a 2-dimensional are parameterized by only *six* scalars!  These
six scalars uniquely determine and define our linear transformation, given a
set of basis vectors that we agree on.  All linear transformations
$\mathbb{R}^3 \rightarrow \mathbb{R}^2$ can be defined/encoded/expressed with
just six real numbers.

These six numbers are pretty important.  Just like how we often talk about
3-dimensional vectors in terms of the encoding of their three coefficients, we
often talk about linear transformations from 3-d space to 2-d space in terms of
their six defining coefficients.

We group these things up in something called a *matrix*.

If our linear transformation $A$ from a 3-dimensional vector space to a
2-dimensional vector space is defined by:

$$
\begin{aligned}
A(\mathbf{v}_1) & = a_{11} \mathbf{u}_1 + a_{21} \mathbf{u}_2 \\
A(\mathbf{v}_2) & = a_{12} \mathbf{u}_1 + a_{22} \mathbf{u}_2 \\
A(\mathbf{v}_3) & = a_{13} \mathbf{u}_1 + a_{23} \mathbf{u}_2
\end{aligned}
$$

(for arbitrary choice of bases $\mathbf{v}_i$ and $\mathbf{u}_i$)

We "encode" it as the matrix:

$$
\begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23}
\end{bmatrix}
$$

And that's why we use matrices in linear algebra -- like how $\langle x, y, z
\rangle$ is a convenient way to represent and define a *vector* (once we agree
on a bases), a $M \times N$ matrix is a convenient way to represent and define
a *linear transformation* from an N-dimensional vector space to a M-dimensional
vector space (once we agree on the bases in both spaces).

Matrix Operations
-----------------

In this light, we can understand the definition of the common matrix
operations.

### Matrix-Vector Multiplication

Matrix-vector multiplication is essentially the *decoding* of the linear
transformation that the matrix represents.

Let's look at the $2 \times 3$ example.  Recall that we had:

$$
f(\mathbf{x}) = x_1 f(\mathbf{v}_1) + x_2 f(\mathbf{v}_2) + x_3 f(\mathbf{v}_3)
$$

And we say that $A$ is completely defined by:

$$
\begin{aligned}
f(\mathbf{v}_1) & = a_{11} \mathbf{u}_1 + a_{21} \mathbf{u}_2 \\
f(\mathbf{v}_2) & = a_{12} \mathbf{u}_1 + a_{22} \mathbf{u}_2 \\
f(\mathbf{v}_3) & = a_{13} \mathbf{u}_1 + a_{23} \mathbf{u}_2
\end{aligned}
$$

This means that:

$$
\begin{aligned}
f(\mathbf{x}) & = x_1 (a_{11} \mathbf{u}_1 + a_{21} \mathbf{u}_2) \\
              & + x_2 (a_{12} \mathbf{u}_1 + a_{22} \mathbf{u}_2) \\
              & + x_3 (a_{13} \mathbf{u}_1 + a_{23} \mathbf{u}_2)
\end{aligned}
$$

Which is itself a vector in $U$, so let's write this as a combination of its
components $\mathbf{u}_1$ and $\mathbf{u}_2$, by distributing and rearranging
terms:

$$
\begin{aligned}
f(\mathbf{v}) & = (v_1 a_{11} + v_2 a_{12} + v_3 a_{13}) \mathbf{u}_1 \\
              & + (v_1 a_{21} + v_2 a_{22} + v_3 a_{23}) \mathbf{u}_2
\end{aligned}
$$

And this is exactly the formula for matrix-vector multiplication!

$$
\begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23}
\end{bmatrix}
\begin{bmatrix}
x_1 \\
x_2 \\
x_3
\end{bmatrix}
=
\begin{bmatrix}
x_1 a_{11} + x_2 a_{12} + x_3 a_{13} \\
x_2 a_{21} + x_2 a_{22} + x_3 a_{23}
\end{bmatrix}
$$

Again, remember that what we are doing is manipulating *specific encodings* of
our vectors and our linear transformations.  Namely, we encode linear
transformations as matrices, and vectors in their component encoding.  The
reason we can do these is that we agree upon a set of bases for our source and
target vector spaces, and express these encodings in terms of those.

The magic we get out of this is that we can manipulate things in our "encoding
world", which correspond to things in the "real world".

### Addition of linear transformations

One neat thing about linear transformation is that they "add" well -- you can
add them together by simply applying them both and adding the results.  The
result is another linear transformation.

$$
(f + g)(\mathbf{x}) \equiv f(\mathbf{x}) + g(\mathbf{x})
$$

If $f : V \rightarrow U$ and $g : V \rightarrow U$ are linear transformations
between the *same* vector spaces, then $f + g : V \rightarrow U$, as we defined
it, is also one:

$$
\begin{aligned}
(f + g)(c \mathbf{x}) & = f(c \mathbf{x}) + g(c \mathbf{x}) \\
                      & = c f(\mathbf{x}) + c g(\mathbf{x}) \\
                      & = c ( f(\mathbf{x}) + g(\mathbf{x}) ) \\
(f + g)(c \mathbf{x}) & = c (f + g)(\mathbf{x})
\end{aligned}
$$

(Showing that it respects addition is something you can look at if you want to
have some fun!)

So, if $f$ is encoded as matrix $\hat{A}$ for given bases, and $g$ is encoded
as matrix $\hat{B}$, what is the encoding of $f + g$ ?

Let's say that, if $V$ and $U$ are 3-dimensional and 2-dimensional,
respectively:

$$
\begin{aligned}
f(\mathbf{x}) & = (x_1 a_{11} + x_2 a_{12} + x_3 a_{13}) \mathbf{u}_1 \\
              & + (x_1 a_{21} + x_2 a_{22} + x_3 a_{23}) \mathbf{u}_2 \\
g(\mathbf{x}) & = (x_1 b_{11} + x_2 b_{12} + x_3 b_{13}) \mathbf{u}_1 \\
              & + (x_1 b_{21} + x_2 b_{22} + x_3 b_{23}) \mathbf{u}_2
\end{aligned}
$$

Then the breakdown of $f + g$ is:

$$
\begin{aligned}
(f + g)(\mathbf{v}) & = (x_1 a_{11} + x_2 a_{12} + x_3 a_{13}) \mathbf{u}_1 \\
                    & + (x_1 a_{21} + x_2 a_{22} + x_3 a_{23}) \mathbf{u}_2 \\
                    & + (x_1 b_{11} + x_2 b_{12} + x_3 b_{13}) \mathbf{u}_1 \\
                    & + (x_1 b_{21} + x_2 b_{22} + x_3 b_{23}) \mathbf{u}_2 \\
(f + g)(\mathbf{v}) & = (x_1 [a_{11} + b_{11}] + x_2 [a_{12} + b_{12}] + x_3 [a_{13} + b_{13}]) \mathbf{u}_1 \\
                    & + (x_1 [a_{21} + b_{21}] + x_2 [a_{22} + b_{22}] + x_3 [a_{23} + b_{23}]) \mathbf{u}_2
\end{aligned}
$$

Note that if we say that $f + g$ is encoded as matrix $\hat{C}$, and call the
components $c_{11}$, $c_{12}$, etc., then we can rewrite that as:

$$
\begin{aligned}
(f + g)(\mathbf{x}) & = (x_1 c_{11} + x_2 c_{12} + x_3 c_{13}) \mathbf{u}_1 \\
                    & + (x_1 c_{21} + x_2 c_{22} + x_3 c_{23}) \mathbf{u}_2
\end{aligned}
$$

Where $c_{11} = a_{11} + b_{11}$, $c_{12} = a_{12} + b_{13}$, etc.

So, if $\hat{A}$ and $\hat{B}$ encode linear transformations $f$ and $g$, then
we can encode $f + g$ as matrix $\hat{C}$, where the components of $\hat{C}$
are just the sum of their corresponding components in $\hat{A}$ and $\hat{B}$.

And that's why we define $\hat{A} + \hat{B}$, matrix-matrix addition, as
component-wise addition: component-wise addition perfectly "simulates" the
addition of the linear transformation!

What's happening here is we can represent manipulations of the functions
themselves by manipulating *their encodings*.

And, again, the magic here is that, by manipulating things in our "encoding
world", we can make meaningful manipulations in the "real world" of linear
transformations.

$$
\begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23}
\end{bmatrix}
+
\begin{bmatrix}
b_{11} & b_{12} & b_{13} \\
b_{21} & b_{22} & b_{23}
\end{bmatrix}
=
\begin{bmatrix}
c_{11} & c_{12} & c_{13} \\
c_{21} & c_{22} & c_{23}
\end{bmatrix}
$$

Symbolically, if we write function application as matrix-vector multiplication,
we say that $\hat{A} + \hat{B}$ is defined so that
$(\hat{A} + \hat{B})\mathbf{x} = \hat{A} \mathbf{x} + \hat{B} \mathbf{x}$.

### Multiplication of linear transformations

We might be tempted to define *multiplication* of linear transformations the
same way.  However, this doesn't quite make sense.

Remember that we talked about adding linear transformations as the addition of
their results.  However, we can't talk about multiplying linear transformations
as the multiplication of their results because the idea of a vector space
doesn't come with any notion of multiplication.

However, even if we talk specifically about linear transformations to
*scalars*, this still doesn't quite work:

$$
\begin{aligned}
(f * g)(c \mathbf{x}) & = f(c \mathbf{x}) * g(c \mathbf{x}) \\
                      & = c f(\mathbf{x}) * c g(\mathbf{x}) \\
                      & = c^2 ( f(\mathbf{x}) * g(\mathbf{x}) ) \\
(f * g)(c \mathbf{x}) & = c^2 (f * g)(\mathbf{x})
\end{aligned}
$$

That's right, $f * g$, defined point-wise, does not create a linear
transformation.

So, *there is no matrix* that could would even represent or encode $f * g$, as
we defined it.  So, since $f * g$ isn't even representable as a matrix in our
encoding scheme, it doesn't make sense to treat it as a matrix operation.

### Composition of linear transformations

Since linear transformations are functions, we can compose them:

$$
(f \circ g)(\mathbf{x}) \equiv f(g(\mathbf{x}))
$$

Is the composition of linear transformations also a linear transformation?

$$
\begin{aligned}
(f \circ g)(c \mathbf{x}) & = f(g(c \mathbf{x})) \\
                      & = f(c g(\mathbf{x})) \\
                      & = c f(g(\mathbf{x})) \\
(f \circ g)(c \mathbf{x}) & = c (f \circ g)(\mathbf{x})
\end{aligned}
$$

Yes! (Well, once you prove that it respects addition.  I'll leave the fun to
you!)

Okay, so we know that $f \circ g$ is indeed a linear transformation.  That
means that it can *also* be encoded as a matrix.

So, let's say that $f : U \rightarrow W$, then $g : V \rightarrow U$.  $f$ is a
linear transformation from $U$ to $W$, and $g$ is a linear transformation from
$V$ to $U$.  That means that $f \circ g : V \rightarrow W$ is a linear
transformation from $V$ to $W$.

Let's say that $V$ is 3-dimensional, $U$ is 2-dimensional, and $W$ is
4-dimensional.

If $f$ is encoded by the $4 \times 2$ matrix $\hat{A}$, and $g$ is encoded by
$2 \times 3$ matrix $\hat{B}$, then we can represent $f \circ g$ as the $4
\times 3$ matrix $\hat{C}$.

If you've taken a linear algebra class, you might recognize this pattern.
Combining a $4 \times 2$ and a $2 \times 3$ to make a $4 \times 3$ ?

We *can* compute $\hat{C}$ using only the encodings $\hat{A}$ and $\hat{B}$!
We call this **matrix multiplication**.  It's typically denoted as $\hat{C} =
\hat{A} \hat{B}$.

That's exactly what *matrix multiplication* is defined as.  If:

*   $\hat{A}$ is a $O \times M$ matrix representing a linear transformation
    from a M-dimensional space to an O-dimensional space
*   $\hat{B}$ is an $M \times N$ matrix representing a linear transformation from
    an N-dimensional space to an M-dimensional space

Then:

*   $\hat{C} = \hat{A}\hat{B}$ is a $O \times N$ matrix representing a linear
    transformation from an N-dimensional space to an O-dimensional space.

Again -- manipulation of our *encodings* can manifest the manipulation in the
*linear transformations* that we want.

Symbolically, if we treat function application as matrix-vector multiplication,
this means that $\hat{A}\hat{B}$ is defined such that
$(\hat{A}\hat{B})\mathbf{x} = \hat{A}(\hat{B}\mathbf{x})$.

In that notation, it kinda looks like the associativity of multiplication,
doesn't it?  Don't be fooled!  $\hat{A} \hat{B}$, matrix-matrix multiplication,
is a completely different type of operation than $\hat{B}\mathbf{v}$.  One is
the *symbolic manipulation* of an encoding of a linear transformation, and the
other is an *application* of an encoding of a linear transformation on encoding
of a vector.

If you're familiar with Haskell idioms, matrix-matrix multiplication is like
`.` (function composition), and matrix-vector multiplication is like `$`, or
function application.  One is a "higher order function": taking two functions
(at least, the encodings of them) and returning a new function.  The other is
an application of a function to its input.

And, like in Haskell:

```haskell
(f . g) x = f (g x)
```

We won't go over the actual process of computing the matrix-matrix product, but
it's something that you can work out just in terms of the definitions of the
encodings.  Just manually apply out everything and group together common
factors of the basis vectors of the destination space.

The Big Picture
---------------

At the highest level here, what we're doing is taking a *function* and encoding
it as *data* -- a parameterization of that function.  Essentially, we take the
properties of the type of functions we are looking at and find out that it can
be defined/represented in a limited number of parameters

Then, the breakthrough is that we look at useful higher-order functions and
manipulations of those transformations.  Then, we see how we can implement
those *transformations* by symbolically manipulating the *encodings*!

This is actually a dance we do all the time in programming.  Instead of working
with functions, we work with reified data that represent those functions.  And,
instead of direct higher order functions, we transform that data in a way that
makes it encodes the function we want to produce.

Matrices are exactly that.  Linear transformations are the functions we want to
analyze, and we realize that we can completely specify/define any linear
transformation with a matrix (against a choice of bases).

Then, we realize that there are some nice manipulations we can do on linear
transformations; we can combine them to create new linear transformations in
useful ways.

However, because those manipulations all produce *new* linear transformations,
we know that their results can all be encoded in *new* matrices.  So, we see if
we can just directly apply those manipulations by directly working on those
matrices!

I hope this post serves to demystify matrices, matrix addition, and
multiplication for you, and help you see why they are defined the way that they
are.  Furthermore, I hope that it gives some insight on why matrices are useful
in linear algebra, and also how similar encodings can help you with
manipulating other types of functions!