#lang scribble/manual

@(require (file "../styles/hj.js.rkt"))
@js/highlight-jumping

@title[#:tag "analysis"]{Analysis}

Can Chinese be used as a programming language? If Chinese is used as the human-computer interaction interface of a programming language, could it offer advantages over English? If so, what aspects would benefit? Furthermore, even if such advantages exist, is there a realistic possibility of Chinese distinguishing itself in the contemporary context?

@section{Transformations of Chinese and Chinese Characters in Modern Chinese History}

@subsection{Lessons from the Vernacular Chinese Movement}

In fact, comparisons between Chinese and Western languages can already be seen in the New Culture Movement @cite{liyingzi18}@cite{mayixin96} in modern Chinese history. At that time, on the one hand, China witnessed the tremendous achievements of the Industrial Revolution, driven by the advanced science and technology of Western countries. On the other hand, it faced pressure and armed aggression from Western powers. These circumstances inevitably gave rise to a motivation for self-criticism and self-renewal.

Broadly speaking, some of the issues addressed by the Vernacular Chinese Movement went directly to the heart of the differences between Chinese and Western natural languages:

@itemlist[
@item{
One major problem with Chinese identified by the reformists in the Vernacular Chinese Movement was the divergence between spoken and written Chinese: colloquial speech and written language were separated, whereas in most Western countries, spoken and written forms of most languages were highly consistent;
}
@item{
The principal advantage of Chinese emphasized by conservatives in the Vernacular Chinese Movement was its conciseness and ability to convey much meaning in a small amount of text, owing to the fact that Chinese is a logographic writing system.
}
]

From the perspective of contemporary knowledge, we can understand these differences as follows: Western languages such as English use phonographic writing systems, which naturally facilitate consistency between speech and writing, since their writing systems essentially represent spoken language. Chinese, by contrast, has a spoken-language system that is built upon its writing system and places greater emphasis on written expression. This makes it possible to convey meaning concisely, because spoken Chinese can draw upon a graphic writing system to improve the efficiency of expression.

Next, let us consider the characteristics of programming languages:

@itemlist[
@item{
A programming language is a writing system. In most circumstances, programming languages do not need to be spoken or heard; what matters is writing and reading.
}
@item{
Programming languages need to express information concisely. Given the complexity of concepts and referential relationships in programming, they must convey as much information as possible within a limited space. This helps preserve information more faithfully as internal data structures are transformed and converted, and allows these transformation processes to be described more precisely. Ultimately, this benefits the writing, reading, and preservation of code.
}
]

These are precisely the advantages that Chinese offers.

@subsection{The Standardization of Simplified Chinese, Hanyu Pinyin, and Chinese Punctuation}

Following the New Culture Movement, the People's Republic of China established the Chinese Character Reform Commission and promulgated the *Complete List of Simplified Chinese Characters*, simplifying Chinese characters and standardizing their usage at the national level. It also published the *Scheme for the Chinese Phonetic Alphabet* (Hanyu Pinyin) and national standards governing the use of punctuation marks in Chinese @cite{jiaoyubu11}.

The simplification of Chinese characters @cite{supeicheng13}, together with the development of Hanyu Pinyin, Chinese punctuation conventions, and a series of related standards for Chinese characters and the Chinese language, undoubtedly breathed new life into Chinese characters after thousands of years of evolution, enabling them to flourish in a new era and under new circumstances.

@section{An Overview of Programming Languages}

A programming language is a formal language used to define computer programs. Like natural languages in linguistics, formal languages generally have two aspects: syntax and semantics. Each programming language can be regarded as a formal specification consisting of syntax, vocabulary, and meaning.

Data inside modern computers is stored in binary form, using an on-off representation. Various kinds of information representing the real world—including names, bank account numbers, measurements, and even low-level binary data—are organized through programming languages and transformed into higher-level concepts.

@subsection{Type Systems}

The system in a programming language that deals specifically with data is called its type system. The study and design of type systems is known as type theory. Programming languages can be classified into statically typed systems, such as C++ and Java, and dynamically typed systems, such as Lisp, JavaScript, Tcl, and Prolog.

It is also necessary to consider the trade-offs between static and dynamic typing.

Static typing can reliably detect type errors at compile time and therefore often improves the reliability of the resulting program. However, there is still debate over how many errors are type errors and what proportion of them can be caught by static typing. Advocates of static typing argue that a program becomes more reliable once it passes type checking. Advocates of dynamic typing, however, point out that real-world software in circulation suggests little difference in reliability between the two approaches.

One can argue that the value of static typing lies in strengthening the type system. Advocates of strongly typed languages such as ML and Haskell argue that almost all bugs can be regarded as type errors, provided that programmers declare types appropriately or allow the compiler to infer them.

Static typing can generally produce faster code. When a compiler knows the types of the data being used, it can generate optimized machine code. Furthermore, compilers for statically typed languages can more easily identify efficient execution strategies. Some dynamically typed languages, such as Common Lisp, also permit arbitrary type declarations to facilitate optimization. These considerations have contributed to the widespread adoption of static typing.

By contrast, dynamic typing can make the compilation and interpretation process more efficient. In dynamically typed languages, source code can be processed with less need for certain checks and less parsing overhead. This can also shorten the edit-compile-test-debug cycle.

Some statically typed languages lack type inference, as in the case of Java in the context being discussed, requiring programmers to declare the types of methods or functions they intend to use. The compiler does not allow these declarations to be omitted, which can provide additional documentation for the program. However, statically typed languages can also support programming without explicit type declarations. Thus, rather than viewing type declarations as a cost of static typing, one might regard them as a benefit that static typing provides.

Dynamic typing makes it possible to construct certain things that are difficult to achieve in static type systems. For example, an `eval` function makes it possible to execute arbitrary data as code, although the types of the resulting code may still be subject to static constraints. Dynamic typing also accommodates transitional code and prototyping, such as using strings in place of data structures. Recent advances in static typing, such as generalized algebraic data types in Haskell, have made it possible to implement `eval` in a type-safe manner.

Dynamic typing makes metaprogramming more powerful and easier to use. For example, writing C++ templates is more cumbersome than writing equivalent code in Ruby or Python. More sophisticated runtime constructs, such as metaclasses and introspection, are generally more difficult to implement in statically typed languages.

@subsection{Functional Programming}

Functional programming is a programming paradigm that treats computation as the evaluation of functions and avoids the use of program state and mutable objects.

In functional programming, functions are first-class objects, meaning that a function can be passed as an argument to another function, returned as a value from a function, modified, or assigned to a variable. Lambda calculus is one of the most important foundations of this paradigm. Functions in lambda calculus can accept other functions as arguments and return functions as results.

Developed by Alonzo Church in the 1930s, lambda calculus is a formal system of computation built around function application. In 1937, Alan Turing demonstrated the equivalence of lambda calculus and Turing machines as models of computation, establishing that lambda calculus is Turing-complete. Lambda calculus @cite{Matthias06} forms the foundation of functional programming languages.

@section{Lisp, Scheme, and Racket}

@subsection{History}

In 1958, John McCarthy invented the Lisp programming language at the Massachusetts Institute of Technology.

Lisp, historically written as LISP, is a family of computer programming languages with a long history. Originating in 1958, it is the second-oldest high-level programming language still in widespread use. The Lisp family has evolved into numerous dialects. Among the best-known modern general-purpose dialects are Scheme, Common Lisp, and the more recent Clojure.

In the 1970s, Guy L. Steele and Gerald Jay Sussman developed Scheme, as described in the influential *Lambda Papers* and the classic 1985 textbook *Structure and Interpretation of Computer Programs* @cite{abelson96}. Scheme was the first Lisp dialect to use lexical scoping and tail-call optimization. It helped extend the influence of functional programming and introduced its ideas to a broader programming-language community.

Matthias Felleisen established the PLT research group in the mid-1990s. In January 1995, the group decided to develop an educational programming-language environment based on the functional programming language Scheme. Matthew Flatt assembled MrEd (the original virtual machine of Racket), wxWidgets, and several other free software components from libscheme. Over the following years, a team consisting of Flatt, Robby Findler, Shriram Krishnamurthi, Cormac Flanagan, and many others developed DrScheme. On June 7, 2010, PLT Scheme was renamed Racket.

@subsection{Data Structures}

As mentioned above, the homoiconicity of Lisp programs is achieved through the correspondence between the form of S-expressions and the form of data structures. Examining Lisp's data structures reveals a high degree of interrelatedness:

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Data Structure} @bold{Representation in Racket})
               (list "pair" @code{'(a . b)})
               (list "list" @code{'(a b c)})
               (list "list" @code{'(a b . c)})
               (list "vector" @code{'#(1 2 3)})
               (list "association list" @code{'((a . b) (c . d))})
               (list "hash table" @code{'#hash((a . b) (c . d))}))]

@subsection{Advantages and Disadvantages}

Unlike many popular programming languages today, Lisp has an extremely regular syntax based on S-expressions, making it particularly easy for computers to manipulate. Because the forms of its data structures and syntax correspond to one another, Lisp programs exhibit homoiconicity. This enables Lisp to build almost all the higher-level concepts found in popular programming languages from a small set of core functions and data structures.

Scheme, as a Lisp dialect, exemplifies a minimalist philosophy: it establishes a small language core as its foundation and extends the language with powerful language constructs, including syntactic sugar.

However, the high degree of uniformity between Lisp's syntax and data is a double-edged sword. S-expressions are extremely simple, efficient, and powerful, but they also introduce certain problems. The main issues can be summarized as follows:

@itemlist[
@item{
Difficulty of reading and understanding: Because the syntax is highly uniform and concise, there are few obvious formal distinctions between different expressions. This places an additional burden on readers who must interpret and distinguish different pieces of code.
}
@item{
High demands on precise naming: Because of its functional nature, Lisp does not naturally establish structural hierarchies in the way object-oriented programming does. Object-oriented programming effectively formalizes abstract concepts through structural organization, whereas in functional programming, such distinctions often have to be conveyed through names alone.
}
]

Let us illustrate these issues with practical examples. First, consider how the same operations are expressed in Racket and Ruby:

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Meaning} @bold{Racket Code} @bold{Ruby Code})
               (list "Addition" @code{(+ 1 2 3)} @code{1+2+3})
               (list "Constructing an array" @code{(vector 1 2 3)} @code{[1, 2, 3]})
               (list "Constructing a hash table" @code{(hash 'a 1 'b 2)} @code{{a: 1, b: 2, c: 3}})
               (list "Constructing an array containing a sequence of integers" @code{(build-list 5 values)} @code{Array(1..5)})
               (list "Constructing an array containing repeated elements" @code{(make-list 3 1)} @code{Array.new(3, 1)}))]

The table shows that in Ruby, code performing different functions takes different forms, whereas in Racket, all these operations are expressed using S-expressions.

In particular, consider the operations "constructing an array containing a sequence of integers" and "constructing an array containing repeated elements." In Ruby, these operations are expressed through object-oriented constructs and use different forms and construction methods. In Racket, both are implemented using functions (`make-list` and `build-list`). Consequently, their meanings and purposes must be conveyed through their function names.

Consider the following table showing Racket expressions and their outputs:

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Input Expression} @bold{Output})
               (list @code{(list 'foo 'foo 'foo)} @code{'(foo foo foo)})
               (list @code{(make-list 3 'foo)} @code{'(foo foo foo)})
               (list @code{(make-list 6 'foo)} @code{'(foo foo foo foo foo foo )})
               (list @code{(build-list 5 values)} @code{'(0 1 2 3 4)})
               (list @code{(build-list 10 values)} @code{'(0 1 2 3 4 5 6 7 8 9)}))]

We can observe the following:

@itemlist[
@item{
`make-list` generates a list containing N copies of V, where N is the first argument and V is the second argument.
}
@item{
`build-list` also generates a list, but its contents are the natural numbers from 0 through N-1, where N is the first argument.
}
]

However, judging from their names alone, it is clear that both `make-list` and `build-list` construct lists, but the differences between them and their respective purposes are not immediately apparent. This places higher demands on function naming: a function's name must precisely convey the subtle distinctions between its behavior and that of other functions. It is also worth noting that function names are grounded in natural language.

@section{Binary, the I Ching, and Chinese Characters}

We know that the origins of computing lie in the binary numeral system of mathematics. It is fair to say that without binary, modern computer systems would not exist in their present form.

The modern binary numeral system was devised by Gottfried Wilhelm Leibniz in 1679. In his 1703 paper, *Explication de l'arithmétique binaire, qui se sert des seuls caractères 0 et 1 avec des remarques sur son utilité et sur ce qu'elle donne le sens des anciennes figures chinoises de Fohy* (Explanation of Binary Arithmetic, Which Uses Only the Characters 0 and 1, with Remarks on Its Usefulness and the Meaning It Gives to the Ancient Figures of Fuxi) @cite{leibniz46}, Leibniz explained the relationship between the transformations of the eight trigrams in the Chinese *I Ching* and the binary system.

The ancient *I Ching* and modern computers are both associated with binary systems. Is this merely a coincidence? Regardless of whether it is, we can clearly recognize that many things in the world exhibit relationships of binary opposition and transformation, such as black and white, heaven and earth, male and female, and yin and yang.

The *I Ching* has also influenced Chinese culture in many ways, including the development of Chinese characters.

Yang Zhenning, the 1957 Nobel laureate in Physics, delivered a lecture in 1993 entitled "Looking Back on and Forward to the Entrance of Modern Science into China" @cite{yangzhenning93}. In 2004, he also gave a lecture on "The Influence of the I Ching on Chinese Culture" at the 2004 Cultural Summit Forum in the Great Hall of the People @cite{yangzhenning04}. Several important points were highlighted in these lectures:

@itemlist[
@item{Compression, classification, abstraction, simplification, and symbolization are central principles of the *I Ching*. These principles have permeated every corner of Chinese culture over thousands of years.}
@item{Chinese characters and the Chinese language were influenced by the *I Ching* in their development toward a monosyllabic language.}
@item{Classical Chinese is an exceptionally beautiful literary form. One reason for its beauty is that it does not follow the usual patterns of grammatical development, instead striving to express the greatest possible meaning with the fewest possible words. This aesthetic principle can be understood as an extension of the compression and simplification found in the *I Ching*.}
]

@section{Advantages of Chinese Characters}

In the preceding sections, when discussing the disadvantages associated with Lisp's distinctive S-expression syntax, we noted that precise function naming is crucial to improving the readability of Lisp code. We will now use tables to illustrate several characteristics of the Chinese language and Chinese characters.

@subsection{Finer-Grained Linguistic Units}

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{English Root} @bold{English Words and Their Chinese Equivalents})
               (list "exo-: external, outside" "exotic: foreign; exoteric: intended for or accessible to outsiders")
               (list "com-, con-: together, jointly" "combine: join, unite; compassion: sympathy; comparison: comparison")
               (list "by-: beside, secondary" "byproduct: a secondary product (by + product); byroad: a secondary road (by + road); byway: a minor road or path (by + way)"))]

As the table illustrates, an English root often corresponds to the meaning of a Chinese word or character, while a word formed from English roots may correspond to a single Chinese lexical item. Chinese can therefore express finer-grained distinctions in meaning than English.

@subsection{Classification by Attributes}

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Chinese Character Component} @bold{Related Characters})
               (list "Three-dot water radical (氵)" "波 (wave), 浪 (wave), 浴 (bathe), 沐 (bathe), 海 (sea), 江 (river), 河 (river)")
               (list "Grass radical (艹)" "草 (grass), 花 (flower), 艺, 芒, 苏, 菜")
               (list "Walking radical (辶)" "过, 达, 迅, 速, 迁, 近, 远")
               (list "Hand radical (扌)" "指, 执, 扣, 打, 扔, 押"))]

As the table shows, Chinese characters sharing the same component often share a related attribute or semantic category. English does not possess an equivalent system for encoding and classifying the attributes of abstract concepts through the components of its writing system.

@subsection{Examples}

Consider the Racket functions `make-list` and `build-list` mentioned earlier. If we express their names in Chinese, we could use the following:

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{Input Expression} @bold{Output})
               (list @code{(链 'foo 'foo 'foo)} @code{'(foo foo foo)})
               (list @code{(复链 3 'foo)} @code{'(foo foo foo)})
               (list @code{(复链 6 'foo)} @code{'(foo foo foo foo foo foo )})
               (list @code{(序链 5 values)} @code{'(0 1 2 3 4)})
               (list @code{(序链 10 values)} @code{'(0 1 2 3 4 5 6 7 8 9)})]
