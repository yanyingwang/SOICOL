#lang scribble/manual

@title[#:tag "implementation"]{Implementation}

@(require (file "../styles/fonts.css.rkt")
          (file "../styles/hj.js.rkt"))
@css/wenquan-extend-font
@js/highlight-jumping

This chapter explains how Chinese and Chinese characters can be incorporated into the syntax of Lisp's S-expressions to take advantage of their distinctive strengths—in other words, how the Ming language can be designed and implemented.

@section{Why Racket Was Chosen as the Implementation Language}

@subsection{Overview of the Racket Programming Language}

Racket, formerly known as PLT Scheme, is a general-purpose, multi-paradigm functional programming language belonging to the Lisp family. One of its design goals is to provide a platform for creating, designing, and implementing other programming languages. Racket is used in a variety of fields, including scripting, general-purpose programming, computer science education, and academic research.

Racket provides an implementation platform that includes a runtime environment, libraries, a just-in-time compiler (JIT compiler), and other components. It also provides DrRacket, formerly known as DrScheme, a development environment written in Racket itself.

Racket is distributed as free and open-source software under the GNU Lesser General Public License. Extensions and packages developed by the community can be published through PLaneT, a web-based package distribution system.

Scribble, which is implemented in Racket, can be used to generate HTML or PDF documents, with PDF generation relying on LaTeX. Racket's official documentation is written using Scribble.

Starting with version 8.0, Racket changed its default compilation and runtime system from Racket BC to Racket CS @cite{matthew21}. Racket CS is based on the Chez Scheme implementation @cite{dybvig09}@cite{dybvig22}. Chez Scheme is a Scheme implementation developed by R. Kent Dybvig and is one of the fastest available Scheme implementations. First released in 1985, it became open-source software on May 13, 2016, following its acquisition by Cisco.

@subsection{Racket's Design Principles}

Racket's development is based on the following principles:

@itemlist[
@item{The purpose of a programming language is to express and solve problems. This process usually takes place in a specific context, which has its own language for describing problems. Racket should therefore be a programming language capable of creating new programming languages;}
@item{Given the way problems are expressed, a problem-solving system can be viewed as a collection of interconnected components written in different languages. Racket should provide sufficient mechanisms for encapsulation and protection to allow the full features of different languages to be implemented;}
@item{Mechanisms related to problem solving but external to the programming language itself, such as project and resource management, can also be transformed into language constructs by Racket.}
]

@subsection{Key Advantages of Racket}

Overall, the following characteristics make Racket particularly suitable for implementing a Chinese programming language:

@itemlist[
@item{Racket was designed from the outset to provide a platform for creating, designing, and implementing other programming languages. It therefore already offers a rich set of features required for language implementation;}
@item{Racket is widely used in computer science education and academic research, making it easier to access the latest research findings and facilitating the dissemination of new results;}
@item{Racket is a dialect of Scheme, which is itself a dialect of Lisp. Racket inherits and extends the S-expression syntax of Lisp and Scheme. The extreme simplicity of S-expressions means that a new implementation does not need to focus on implementing a new syntax, leaving considerable room for enhancing semantic expressiveness in Chinese;}
@item{Among Scheme implementations, Racket offers one of the richest library ecosystems;}
@item{Racket's API documentation is written using Scribble, a documentation language implemented in Racket itself. This allows the documentation for a Chinese programming language to be built with Scribble and seamlessly linked to the original Racket documentation.}
]

@section{The Ming Language}

For convenience in both discussion and implementation, the "Chinese programming language based on Lisp's S-expression syntax" described above will henceforth be referred to as the "Ming language."

The Chinese character 名, meaning "name" or "naming," refers here to the process of assigning names in a natural language to abstract concepts within a programming language.

@subsection{Syntax: S-Expressions}

Since Ming is a Chinese programming language based on Lisp's S-expression syntax, it can take advantage of the extreme simplicity of S-expressions. This means that the new implementation does not need to focus on implementing a new syntax, leaving considerable room for enhancing semantic expressiveness in Chinese. Ming therefore adopts S-expressions as its syntax.

Compared with mainstream programming languages today, Ming inherits an extremely simple syntax from Lisp, known as S-expressions:

@itemlist[
@item{Parentheses first determine the order of evaluation;}
@item{The first word or character within each pair of parentheses indicates the meaning of the expression enclosed by those parentheses. This is known as prefix notation.}
]

For clarity, here are a few examples:

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Meaning} @bold{Ming Code})
               (list @code{1+1+1} @code{(+ 1 1 1)})
               (list @code{1+2-3} @code{(- (+ 1 2) 3)})
               (list @code{2x(3+(5x4))} @code{(* 2 (+ 3 (* 5 4)))})
               (list @code{If 1+1=2, return 3; otherwise, return 4} @code{(若 (= (+ 1 1) 2) 3 4)}))]

@subsection{Chinese Character Formation: Naming Data Structures Derived from It}

There is no doubt that data structures are the foundation of programming languages.

Ming can directly reuse Racket's internal data structures. Because Racket is used in academic research, it provides a wide variety of data structures, including Equality, Strings, Booleans, Characters, Numbers, Symbols, Bytes, Regular Expressions, Keywords, Pairs and Lists, Mutable Pairs and Lists, Vectors, Stencil Vectors, Boxes, Hash Tables, Sequences and Streams, Dictionaries, Sets, and Procedures.

In terms of their forms, these data structures are largely based on Lisp's S-expressions and linked lists. They are highly similar to one another and often have derivational relationships. For example:

@itemlist[
@item{A pair is a data structure, and a list is a data structure derived from pairs. If the final element of a list is itself data rather than the empty list, the structure can be regarded as both a pair and a list;}
@item{A two-dimensional list can also serve as an association list, which is similar to a hash table. The existing English names in Racket do not clearly reflect the derivational relationships among these data structures.}
]

Ming takes advantage of the ability of Chinese characters to depict, classify, and indicate attributes, as well as their graphic forms and abstract semantic representations, to develop a more systematic and structured naming system:

@tabular[#:style 'boxed
         #:row-properties '(bottom-border ())
         (list (list @bold{English Name} @bold{English Constructor Example} @bold{Racket Representation} @bold{Chinese Constructor Example} @bold{Chinese Name})
               (list "pair" @code{(cons 1 2)} @code{'(1 . 2)} @code{(双 1 2)} "双")
               (list "list" @code{(list 1 2 3)} @code{'(1 2 3)} @code{(􏿴 1 2 3)} "􏿴")
               (list "list*" @code{(list* 1 2 3)} @code{'(1 2 . 3)} @code{(􏿫 1 2 3)} "􏿫")
               (list "circular-list" @code{(circular-list 1 2 3)} @racket{#0='(1 2 3 . #0#)} @code{(􏿮 1 2 3)} "􏿮")
               (list "vector" @code{(vector 1 2 3)} @code{'#(1 2 3)} @code{(􏿲 1 2 3)} "􏿲")
               (list "association list" @code{(list (cons 1 2) (cons 3 4))} @code{'((1 . 2) (3 . 4))} @code{(􏿳 1 2 3 4)} "􏿳")
               (list "hash" @code{(hash 1 2 3 4)} @code{'#hash((1 . 2) (3 . 4))} @code{(􏿱 1 2 3 4)} "􏿱"))]

As the table illustrates, Racket's internal data structures—pairs, lists, vectors, association lists, and hash tables—have different forms but also exhibit structural relationships. This is primarily because many of them are variations on linked-list structures.

Using single Chinese characters as names highlights the derivational relationships among data structures and makes code more concise and visually regular.

The examples above illustrate a way of thinking about how to name the internal data-structure concepts of a Lisp programming language in Chinese.

If we regard "又" as an abstract representation of the concept of data in programming, the table above helps us understand how Chinese character formation can be used to express the built-in concepts of the Lisp language. Compared with English, Chinese characters can make the logical relationships among these abstract data-structure concepts more apparent.

@subsection{Function-Naming Rules: A Lightweight Type-Indication Method Derived from Chinese Character Formation and Word-Formation Conventions}

In Lisp languages such as Racket:

@itemlist[
@item{Functions in Racket are specifically referred to as procedures. They are one of its most important concepts and can be used to process data;}
@item{For other forms of logical processing, Racket has a concept called syntax, which is used to transform code structurally.}
]

As a dynamically typed programming language, Racket does not require explicit type annotations when writing ordinary code, although an extension library providing a type system, Typed Racket, is available.

Ming is built on dynamic programming. In addition to using Chinese character formation to improve the naming of existing abstract data concepts in Racket, Ming also draws on the principles of Chinese character formation and the concision and compression of Classical Chinese. It introduces a method of naming functions that uses their names to suggest the types of their input and output values.

For Ming, the semantic density of individual Chinese characters makes them particularly suitable for constructing names. The key to making Lisp code easier to understand through Chinese is to standardize function naming by establishing explicit naming conventions.

The naming rules for functions are documented in detail in the official Ming API documentation, for example, @hyperlink["http://www.yanying.wang/ming/pairs-and-lists.html" "Naming Conventions for Procedures Based on 双 and 􏿴"]. The following is a summary.

@bold{General Rules}:

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Rule} @bold{Explanation} @bold{Examples})
               (list "A single-character procedure name containing the 亻 radical" "Indicates that the input and output have the same data type and that some of their data contents are also shared" "佐, 佑, 攸")
               (list "A procedure name containing /入" "Indicates that the input is not ordinary data but a procedure or anonymous function" "佐/入, 攸/入, 消/入")
               (list "A procedure name containing /以" "Indicates the data type expected for the input" "诗修!/以它段")
               (list "A procedure name containing /成" "Indicates the type of the output result" "/成诗, /成词"))]

@bold{Rules for Specific Libraries}:

In addition to the general naming rules, individual libraries may define additional conventions. For example, the Chinese-localized library for pairs and lists has the following rules:

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Naming Rule} @bold{Meaning} @bold{Effect on Inputs and Outputs})
               (list "A single-character function name containing the 㐅 component on the upper side" "Delete, remove, or eliminate" "Affects only the data contents")
               (list "A single-character function name containing the 亻 component on the left" "Similar items; returns data similar to the input" "The output has the same type as the input and contains similar data")
               (list "A single-character function name containing the 阝 component on the right" "Partially identical items; returns data sharing part of the input" "The output has the same type as the input, and the output is a part of the input")
               (list "A word-form function name ending in 分 or containing 分/" "Split into parts; returns multiple values" "The output consists of multiple values")
               (list "A word-form function name ending in * or containing */" "Indicates increased intensity" "Affects only the data contents"))]

@subsection{Translation Program}

Since Ming uses the same syntax and data structures as Racket, it can use Racket's internal features to implement a translation layer that translates Chinese names into their Racket equivalents.

Racket has a well-organized module system, allowing Ming to provide Chinese-English name mappings for Racket's standard libraries and extension libraries.

Furthermore, because Racket supports functional programming, the translation functionality can easily be packaged as an extension library and imported back into Racket for use.

@subsection{Documentation System}

The translation program necessarily contains a set of Chinese-English mapping tables. Since Scribble, the language used to write Racket documentation, is essentially a Racket library, Ming can use Scribble to generate its documentation and provide seamless navigation to the official Racket documentation. This facilitates both reading Ming's documentation and tracing concepts back to their original sources.

@subsection{Extension Libraries}

Since Racket is essentially a dialect of Scheme, and Scheme follows a minimalist philosophy in which all code can be reduced to a small set of fundamental function definitions, this provides considerable convenience for localizing Racket in Chinese.

@itemlist[
@item{Even without fully localizing Racket, Ming can be imported as a function library and used alongside portions of Racket;}
@item{Even without full localization, extension libraries can be written using Ming, provided that the Racket libraries on which they depend have already been localized into Chinese;}
@item{Racket follows Scheme's minimalist principles, which provide a path for Ming to eventually free itself from its dependence on Racket and even Scheme at the implementation level. This stage will be reached when Ming has localized all programming concepts found in Racket and Scheme.}
]

@subsection{Directory Structure}

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Directory} @bold{Description})
               (list "/*" "Ming's core library")
               (list "mapping/*" "Chinese-English mapping tables, organized into subdirectories according to library structure")
               (list "mapping/racket/*Racket" "Chinese-English mapping tables for Racket libraries, organized according to library structure")
               (list "racket/*" "Ming-localized versions of Racket libraries, with translations extracted automatically from the Chinese-English mapping tables")
               (list "private/scribble-styles/*" "Fonts and styling code for HTML documentation")
               (list "scribble/*" "Source code for generating HTML documentation, with translations extracted automatically from the Chinese-English mapping tables")
               (list "doc/*" "HTML documentation generated from Scribble source code; the files can be opened in a web browser for reading"))]

@subsection{Core Libraries}

@hyperlink["http://www.yanying.wang/ming/ming-core.html" "Ming's core libraries"] contain the core implementation of the Ming language. They mainly consist of the following components:

@itemlist[
@item{ming/core: Used to localize a Racket library into Ming. Its core component is a function called `mingize`, implemented in Racket itself;}
@item{ming/scribble: Used to generate translated documentation from Ming's translation tables. Its core components are the Racket functions `defchinesize` and `defmapping`;}
@item{mapping-lang: To reuse Racket's standard libraries, Ming needs to provide a substantial number of translations. Since translation files primarily contain data and require relatively little logic, a simple template language was implemented to facilitate writing translation mapping tables.}
]

@subsection{Code Examples}

The official Ming API documentation provides detailed explanations, so they will not be repeated here.
