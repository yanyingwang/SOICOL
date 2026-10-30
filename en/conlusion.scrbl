#lang scribble/manual

@(require (file "../styles/hj.js.rkt"))
@js/highlight-jumping

@title[#:tag "conclusion"]{Conclusion}

@section{Summary}

By analyzing Lisp's underlying philosophy, the syntax of S-expressions, the structural relationships and transformations among different data structures, and commonly used function libraries, this paper has identified the advantages and disadvantages of the Lisp programming language. Building on this analysis and drawing on the distinctive strengths of Chinese characters, it has further explored the design of a Chinese programming language based on Lisp. Racket was ultimately selected as the implementation platform, and a practical implementation was developed.

The results demonstrate that the implemented Chinese programming language offers advantages that English-based approaches cannot readily match. These advantages can be summarized as follows:

@itemlist[
@item{The structural relationships and derivations among data structures are expressed through Chinese language and Chinese characters;}
@item{Function names use Chinese character components and Chinese word-formation conventions to indicate the types of function arguments and return values;}
@item{The syntax is simple and highly extensible, allowing compatibility with existing function libraries.}
]

@section{Outlook}

Over nearly a century of development, programming languages in the computer industry have evolved from structured procedural programming, exemplified by C, to object-oriented programming, exemplified by C++, Java, Python, and Ruby. Functional programming is now emerging as another important paradigm.

By leveraging the features of functional programming languages, the S-expression syntax of Lisp, and the minimalist design philosophy of its Scheme dialect, existing English-language function libraries can be localized into Chinese with relative ease. At the same time, introducing Chinese naming conventions makes it possible to realize the advantages explored and proposed in this paper. This provides a potential path for Chinese programming to build on the accumulated achievements of existing programming languages, such as their function libraries, and points toward a feasible direction for its further development.

The Ming language represents an exploration of the distinctive characteristics of Chinese in a new era and under new conditions.

A Chinese programming language is not merely a straightforward repetition of existing technologies; it has value of its own. Rather, if the characteristics of the Chinese language and Chinese characters can be fully utilized, a Chinese programming language may be able to demonstrate distinctive advantages of its own.
