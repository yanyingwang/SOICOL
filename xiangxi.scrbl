#lang scribble/manual

@(require (file "css/fonts.css.rkt"))
@css/wenquan-extend-font

@title[#:tag "xiangxi"]{详细}

本章将详细叙述如何把汉语和汉字融入进 Lisp 的 S-表达式的语法中并发挥
出汉字汉语的优势。

本章在代码示例中会进行注释说明，注释是以英文分号（;）开始的。

@section{S-表达式}

相较于现今主流的编程语言，名语言的语法遗传自 Lisp 编程语言，是极其
简单的，称为 S-表达式：
@itemlist[
@item{
它首先由括号约定执行优先级；
}
@item{
然后由每个括号中的第一个字词表示此括号内容的含义（称为前缀表达
式）。
}
]

为方便理解，我们简单的罗列一些示例：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{代码释意}   @bold{名语言代码})
               (list @code{1+1+1} @code{(+ 1 1 1)})
               (list @code{1+2-3} @code{(- (+ 1 2) 3)})
               (list @code{2x(3+(5x4))} @code{(* 2 (+ 3 (* 5 4)))})
               (list @code{如果1+1=2，则返回3，否则返回4} @code{(若 (= (+ 1 1) 2) 3 4)})
               )]


@section{目录结构}
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{目录}   @bold{解释})
               (list "/*" "名语言核心库")
               (list "mapping/*" "中英文映射表（按库结构设子目录）")
               (list "mapping/racket/*Racket" "库的中英文映射表（按库结构设子目录）")
               (list "racket/*" "Raket库的名化库（会自动从中英文映射表中提取翻译）")
               (list "private/scribble-styles/*" "字体以及HTML文档的样式代码")
               (list "scribble/*" "生成 HTML文档的原始代码（会自动从中英文映射表中提取翻译）")
               (list "doc/*" "scribble源代码所生成的 HTML文档（可使用浏览器打开文件以阅读文档）")
               )]


@section{核心库}
名语言的核心库是名语言的核心代码，主要包含：ming/core、ming/scribble 和 mapping-lang。（详情请见名语言API文档）

@subsection{ming/core}
ming/core是用于为名语言名化（汉化）一个Racket库的，核心为一个用
Racket 编程语言实现的称之为mingize的函数。

@subsection{ming/scribble}
ming/scribble是用来从名语言的翻译表中生成翻译文档的，核心分别为用
Racket语言实现的defchinesize和defmapping函数。

@subsection{mapping-lang}
名语言为了借用 Racket 的标准库，需要做大量的翻译。又因翻译文件重在数
据，其代码逻辑比较简单，故此另外实现了一个简单的模板用以编写翻译映射
表。


@section{数据结构名}
毋庸置疑，数据结构是编程语言的基石。

又因为 Lisp 的 S-表达式和基于链表的数据结构，Racket 编程语言里面的
不同数据结构之间往往存在着一种互相间相互依赖的外在演变形式。这恰恰给
予了汉字发挥空间，来展现不同数据结构间的内在关系：

@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{英文单词名} @bold{英文创建函数的使用示例} @bold{Racket代码中的表示法（创建代码的执行结果）} @bold{中文创建函数的使用示例} @bold{中文字符名})
               (list "pair" @code{(cons 1 2)} @code{'(1 . 2)} @code{(双 1 2)} "双")
               (list "list" @code{(list 1 2 3)} @code{'(1 2 3)} @code{(􏿴 1 2 3)} "􏿴")
               (list "list*" @code{(list* 1 2 3)} @code{'(1 2 . 3)}@code{(􏿫 1 2 3)} "􏿫")
               (list "circular-list" @code{(circular-list 1 2 3)} @racket{#0='(1 2 3 . #0#)} @code{(􏿮 1 2 3)} "􏿮")
               (list "vector" @code{(vector 1 2 3)} @code{'#(1 2 3)} @code{(􏿲 1 2 3)} "􏿲")
               (list "association list" @code{(list (cons 1 2) (cons 3 4))} @code{'((1 . 2) (3 . 4))} @code{(􏿳 1 2 3 4)} "􏿳")
               (list "hash" @code{(hash 1 2 3 4)} @code{'#hash((1 . 2) (3 . 4))} @code{(􏿱 1 2 3 4)} "􏿱")
               )]

如上表所示，从Racket示例中看Racket内部的数据结构
pair、list、vector、association list、hash会发现，它们形态虽有不同但是
却在形式上存在着关系，实际上这主要是因为它们大多都是链表结构的变形。

中文化的单字命名，突出了数据结构之间的演变关系，并且令代码显得更加简
洁工整。

名语言的如上命名示例，演示了汉语命名Lisp编程语言内部数据结构概念的一种思
维方法：如果我们把“又”看成是编程中数据的概念抽象的话，通过以上表内容，
我们就可以明白要如何用汉字的造字法来的表达LISP语言里面的
固有概念。并且我们能看到，较之英文，汉字的表达是更能体现出这些抽象的
数据结构概念之间的逻辑关系的。

@section{函数命名规则}
除了造字方法来优化 Racket 编程语言里面已有的抽象数据概念外，特别的
对于函数命名，名语言也有一套规则。

对于 Lisp 语言，比如 Racket 语言：
@itemlist[
@item{函数在 Racket 中特别的称之为“例程”（Procedure），是其最为重要
的一个概念，函数可以用来处理数据；}
@item{此外的类似逻辑处理的部分，有一个称之为“语法”（Syntax）概念来
对代码进行形式转换。}
]

对于名语言，中文的单字表意特性更利于构造命名，中文化有利于 Lisp 代
码更易被读懂的关键就是把函数的命名规范化，给予函数命名一种命名规则。


@subsection{总则}
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{规则} @bold{解释} @bold{示例})
               (list "单字例程名且带有“亻”偏旁"  "表示例程入参和出参的数据类型相同（且数据内容也部分相同）" "佐、佑、攸")
               (list "例程名字中包含“/入”"  "表示例程的入参并非常规数据，而是一个函数例程或是匿名函数"  "佐/入、攸/入、消/入")
               (list "例程名字中包含“/以”" "用于提示例程的入参数据类型"  "诗修!/以它段")
               (list "例程名字中包含“/成”的"  "用于提示例程的输出结果是某一类型" "/成诗、/成词")
               )]

@subsection{具体库的规则}
除总命名规则外，对于具体的库，会有额外的规则。比如对于 pair 和 list
的汉化库，另有：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{函数名规则} @bold{含义} @bold{对进出参的影响})
               (list "单字函数名且字包含上偏旁“㐅”"  "删除、移走、去掉" "仅对数据内容产生影响")
               (list "单字函数名且字包含左偏旁“亻”"  "相似者（返回相似之数据）" "出参数据与进参数据相比，类型相同且内容类似")
               (list "单字函数名且字包含右偏旁“阝”"  "部分一样者（返回部分相同之数据）" "出参数据与进参数据相比，类型相同且前者是后者的一部分")
               (list "词语函数名以“分”结尾或包含“分/”"  "切分(返回复值数据)"  "出参数据为复值")
               (list "词语函数名以“*”结尾或包含“*/”" "加强力度" "仅对数据内容产生影响")
               )]

@section{代码实例展示}

@filebox{file1.rkt
@codeblock|{
#!/usr/bin/env racket
#lang ming
(名 某物 (􏿴 "苹果" "香蕉" "梨"))
(示 某物)
(示 (甲 某物))
}|
}

更多详细的代码实例和库使用方法在名语言的API文档中有详细说明，这里不再赘述。
