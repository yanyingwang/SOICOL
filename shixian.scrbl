#lang scribble/manual

@title[#:tag "sheji"]{实现}

@(require (file "css/fonts.css.rkt"))
@css/wenquan-extend-font

本章将阐述如何把汉语和汉字融入进 Lisp的S-表达式的语法中并发挥
出汉字汉语的优势（名语言要如何设计实现）。

@section{基于Racket编程语言而实现的原因}
@subsection{Racket编程语言特性概览}
Racket（原名 PLT Scheme）是个通用、多范型，属于Lisp家族的函数式
程序设计语言，它的设计目之一是为了提供一种用于创造设计与实现其它编程
语言的平台，Racket被用于脚本程序设计、通用程序设计、计算机科学教育和
学术研究等不同领域。

Racket有一个实现平台，包含了执行环境、函数库、即时编译器（JIT
compiler）等等，还有提供一个以Racket本身写成的开发环境DrRacket（原
名 DrScheme）。

Racket平台的发行版本是免费且开放源代码的，以GNU宽通用公共许可
证授权发行，所有由社群所编写的扩展和包都会被上传到PLaneT（一个网页包
发布系统）。

基于Racket实现的Scribble可以用来构建HTML或PDF（依赖
LaTeX），Racket 官方文档就是基于这个语言来编写的。
Racket从8.0的版本开始，将默认的编译和运行系统从Racket BC改为了Racket CS@cite{matthew21}，
RacketCS基于Chez Scheme编程语言@cite{dybvig09}@cite{dybvig22}的实现，Chez
Scheme是一个由R. Kent Dybvig开发的Scheme实现，Chez Scheme是最
快的可用的Scheme实现之一，于1985年首次发布，在2016年5月13日随
着被思科公司收购而变为开源软件。


@subsection{Racket 编程语言的开发原则}
Racket 的开发基于以下原则：
@itemlist[
@item{编程语言的目的是表述和解决问题，这一过程通常在特定的情境中发
生，该情境有一定的描述语言，因此 Racket 应该是能够创制新编程语
言的编程语言；}
@item{基于上述的表述问题的方式，问题系统可视为多语言的相互联系的组件
的集合，Racket 应当能够提供足够的保护机制，允许实现各种语言的完
26整特性；}
@item{与问题解决相关的在语言之外的机制，如项目和资源的管理，也可被
Racket 转换为语言构造。}
]

@subsection{原因总结}
总体来说，Racket 的以下特点令其非常适合用于实现汉语编程语言：
@itemlist[
@item{Racket编程语言的设计初衷就是要提供一种用于创造设计与实现其它编
程语言的平台，其势必已经有了丰富的为实现编程语言而所需的各种特
性；}
@item{Racket编程语言已经被广泛的应用于了计算机科学教育和学术研究等领
域，这有利于获取学术领域最新的研究成果并有利于新研究成果的传
播；}
@item{Racket编程语言是Scheme的方言，Scheme是Lisp的方言，Racket
继承并发展了Lisp和Scheme的 S-表达式语法，S-表达式的极简语法
使得新实现不需要关注语法的实现，并给汉语留下了极大的语义层面上
的发挥空间；}
@item{Racket是Scheme语言的实现方言里面函数库最为丰富的实现之一；}
@item{Racket编程语言的文档API是基于其自身而实现的一个称之为
Scribble的编程语言的，这令汉语编程语言的实现文档可以基于
Scribble语言并与原文档做无缝链接跳转。}
]

@section{名语言}
为叙述方便和代码实现上的方便，上文所述“基于 Lisp 的 S-表达式而实现
的汉语编程语言”我们将在下文统一称之为“名语言”。

“名”有命名之意，即对编程语言里面的抽象概念在自然语言层面上的赋名
化。

@subsection{语法：S-表达式}
因为是基于 Lisp 的S-表达式而实现的汉语编程语言”S-表达式的极简语法
使得新实现不需要关注语法的实现，并给汉语留下了极大的语义层面上的发挥
空间，所以名语言的语法采用 S-表达式。

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


@subsection{汉字造字法：基于其发展出的数据结构名}
毋庸置疑，数据结构是编程语言的基石。

名语言的数据结构可以直接借用 Racket 语言的内部数据结构，Racket 因为用
于学术研究领域的原因，拥有非常多的数据结构，如：Equality、Strings、
Booleans、Characters、Numbers、SymbolsStrings、Byte、Regular Expressions、
Keywords 、Pairs and Lists、Mutable Pairs and Lists、
Vectors、Stencil Vectors、Boxes、Hash Tables、Sequences andStreams、
Dictionaries、Sets、Procedures 等。

这些数据结构从形式上来看，都是基于Lisp的S-表达式和链表的，
彼此之间高度类似且相互之间存在着演变关系，比如：

@itemlist[
@item{
pair是一种数据结构，list是基于pair发展而来的数据结构，如果一个
list的末尾也是数据，则它同时是pair又是list；
}
@item{
list如果是一个二维list，则它同时也是association list（类似散列
表）。而目前 Racket 中的英文名并不能明确的反映出这种各个数据结
构之间的演变关系。
}
]

名语言发挥了中文汉字表象、归类、属性指示的特长和汉字图形化、抽象化
表意的优势而发展了一套更具系统化和结构化的命名系统：
@tabular[#:style 'boxed
         #:row-properties '(bottom-border ())
         (list (list @bold{英文单词名} @bold{英文创建函数实例} @bold{Racket表示法} @bold{中文创建函数实例} @bold{中文字符名})
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
却在形式上存在着关系。实际上这主要是因为它们大多都是链表结构的变形。

中文化的单字命名，突出了数据结构之间的演变关系，并且令代码显得更加简
洁工整。

名语言的如上命名示例，演示了汉语命名Lisp编程语言内部数据结构概念的一种思
维方法：

如果我们把“又”看成是编程中数据的概念抽象的话，通过以上表内容，
我们就可以明白要如何用汉字的造字法来的表达LISP语言里面的
固有概念。并且我们能看到，较之英文，汉字的表达是更能体现出这些抽象的
数据结构概念之间的逻辑关系的。



@subsection{函数命名规则：基于汉字造字法和汉语组词规范发展出的一种轻量级类型指
示方法}

对于Lisp语言，比如Racket语言：
@itemlist[
@item{函数在 Racket 中特别的称之为“例程”（Procedure），是其最为重要
的一个概念，函数可以用来处理数据；}
@item{此外的类似逻辑处理的部分，有一个称之为“语法”（Syntax）概念来
对代码进行形式转换。}
]

Racket 作为一种动态编程语言，在代码的书写中并无类型指代，虽然已经
有了基于 Racket 语言的扩展类型系统库，称为 Typed Racket。

而名语言是依附于动态编程的，除了造字方法来优化Racket编程语言里面已有
的抽象数据概念外，与此同时发挥了汉字造字法的精神和文言文精简化、浓缩化的优点，
对于函数命名，名语言也引入发展了一套通过函数名暗示输入参数类型和输出
参数类型的方法。

对于名语言，中文的单字表意特性更利于构造命名，中文化有利于 Lisp 代
码更易被读懂的关键就是把函数的命名规范化，给予函数命名一种命名规则。

函数名的命名规则，在名语言的官方API文档上有详细记述, 比如
@hyperlink["http://www.yanying.wang/ming/pairs-and-lists.html"
"双和􏿴的例程命名规则"]。以下是提炼：

@bold{总则}：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{规则} @bold{解释} @bold{示例})
               (list "单字例程名且带有“亻”偏旁"  "表示例程入参和出参的数据类型相同（且数据内容也部分相同）" "佐、佑、攸")
               (list "例程名字中包含“/入”"  "表示例程的入参并非常规数据，而是一个函数例程或是匿名函数"  "佐/入、攸/入、消/入")
               (list "例程名字中包含“/以”" "用于提示例程的入参数据类型"  "诗修!/以它段")
               (list "例程名字中包含“/成”的"  "用于提示例程的输出结果是某一类型" "/成诗、/成词")
               )]

@bold{具体库的规则}：
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


@subsection{翻译程序}
因为语法和数据结构是和 Racket 语言相同的，名语言将会利用 Racket 语
言的内部特性建立一个翻译层程序，将中文命名转译为 Racket 语言。

又因为 Racket 语言拥有非常良好的模块关系，名语言可以针对 Racket 语
言的标准库、扩展库来进行中英文的翻译映射。

另又因 Racket 语言的函数编程特性，翻译可以被轻松的作为扩展库而被重
新引入进 Racket 语言并被使用。

@subsection{文档程序}
因为翻译程序的设计，名语言内部必然是存在一个个中英文映射表的，又因
Racket 语言的编写文档所基于的 Scribble 语言本质上是一个 Racket 语言的
库，因此名语言可以基于 Scribble 语言实现并和 Racket 语言的官方文档进行
无缝衔接跳转，以利于名语言文档的查看和溯源。

@subsection{扩展库}
因为 Racket 语言实质上是 Scheme 语言的方言，Scheme 遵从一种极简哲
31学，所有的代码可以回归到最基础的几个函数定义上，这为名语言的汉化提供
了极大便利：
@itemlist[
@item{
在不完全汉化的前提下，名语言可以作为函数库被引入 Racket 部分的
使用；
}
@item{
在不完全汉化的前提下，可以基于名语言来写自身的扩展库，只要扩展
库所使用的 Racket 库是已经汉化了的；
}
@item{
Racket 遵从 Scheme 的极间原则，此原则为将来名语言在底层上摆脱
Racket 甚至 Scheme 提供了条件：当名语言完成 Racket 和 Scheme 编
程语言全部的编程概念本地化后，条件即成熟。
}
]


@subsection{目录结构}
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

@subsection{核心库}
@hyperlink["http://www.yanying.wang/ming/ming-core.html" "名语言的核心库"]是
名语言的核心代码，主要包含：
@itemlist[
@item{ming/core：用于为名语言名化（汉化）一个Racket库的，核心为一个用Racket 编程语言实现的称之为mingize的函数。}
@item{ming/scribble：用来从名语言的翻译表中生成翻译文档的，核心分别为用Racket语言实现的defchinesize和defmapping函数。}
@item{mapping-lang：名语言为了借用 Racket 的标准库，需要做大量的翻译。又因翻译文件重在数据，其代码逻辑比较简单，故此另外实现了一个简单的模板用以编写翻译映射表。}
]
@subsection{代码实例展示}
@filebox{file1.rkt
@codeblock|{
#!/usr/bin/env racket
#lang ming
(名 某物 (􏿴 "苹果" "香蕉" "梨"))
(示 某物)
(示 (甲 某物))
}|
}
更多详细的代码实例和库使用方法在名语言的官方API文档中有详细说明，这里不再赘述。
