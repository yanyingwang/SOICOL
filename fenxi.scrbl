#lang scribble/manual


@title[#:tag "fenxi"]{分析}
中文是否可以用于编程语言呢？如果把中文用在编程语言的人机交互接口上
又是否可以有超越英文的效果呢？如果有效果，这种效果是哪方面的呢？进而
的，即使有效果，在当代背景下，有脱颖而出的可能性吗？


@section{中文和汉字在中国近代史中的变革}
@subsection{白话文运动的启迪}
实际上中西方语言的比较早在中国近代史中发生的“新文化运动” @cite{liyingzi18}@cite{mayixin96} 就已
经可见一斑了。当时的旧中国一方面看到西方先进的科学技术推动下所产生的
9工业革命的巨大成就，另一方面也面临着西方国家的打压和武装侵略，不由的
产生了自我批判自我革新的动力。

总体来说，白话文运动中所涉及到的一些问题，正中中西方自然语言的核心
区别：
@itemlist[
@item{
白话文运动中的革新派所提到的中文的一大待续解决的问题是中文的
语、文不一，口头语与书面语的分隔，而大多数西方国家的大多数语言
是语和文高度一致的；
}
@item{
白话文运动中的保守派所提出的中文的中心优点是言简意赅，单位长度
内的信息含量大（因中文是一种图像文字）。
}
]

如果我们用当代的知识体系来看的话：西方语言诸如英文因为是一种表音系
统，所以其自然可以做到语和文的一致，因其书写系统本质上是一种口语的表
达；而中文的口语系统是建立在书写系统之上的，更加注重书写的表达，所以
可以做到言简意赅，因为其口语的表达可以借助图形化的书写系统以提高表达
效率。
进而，让我看一下编程语言所具有的特点：

@itemlist[
@item{
编程语言是一种书写系统，编程语言大部分情况下是不需要读和听的，
需要的是书写和阅读；
}
@item{
编程语言需要言简意赅，并且因为编程语言中各个概念和指代关系的繁
杂，需要在单位空间内作出尽可能多的信息表达，才能在内部的数据结
构的变换和转化中对信息做到更强的保真，对变换和转化的过程作出更
精准的描述，最终上会更有利于代码的书写、阅读和保存。
}
]
以上所属内容，正是中文的优势。

@subsection{简体中文、汉语拼音以及中文标点符号规范的制定}
承接新文化运动，新中国成立后设置了中国文字改革委员会并制定了《简化
字总表》，在国家层面对汉字进行了简化和规范使用。同时也公布的《汉语拼
音方案》和国家标准的标点符号用法@cite{jiaoyubu11}。

汉字的简化@cite{supeicheng13}、汉语拼音和中文标点符号及其相关一系列汉字汉语标准的制
定，无疑让历经千年演化的汉字在新时代和新背景下焕发出新的活力和生机。

@section{编程语言概览}
编程语言（英語：programming language），是用来定义计算机程序的
形式語言。如语言学中语言一样，形式语言一般有两个方面：语法和语义。每
一种程序设计语言可以被看作是一套包含语法、词汇和含义的正式规范。

现代计算机内部的数据都只以二元方式储存，即开-关模式（on-off）。现
实世界中代表信息的各种数据，例如名字、银行账号、度量以及同样低端的二
元数据，都经由程序设计语言整理，成为高阶的概念。

@subsection{类型系统}
一个程序中专门处理数据的那个系统被称为程序语言的类型系统（ type
system）；对型态系统的研究和设计被称为型态理论（ type theory）。语言
可以被分为静态型态系统（statically typed systems），例如 C++和 Java，和
动态型态系统（dynamically typed systems），例如 Lisp，JavaScript，Tcl
12和 Prolog。

对静态类型和动态类型两者之间的权衡也是必要的。

静态类型在编译时期时，就能可靠地发现类型错误。因此通常能增进最终程
序的可靠性。然而，有多少的类型错误发生，以及有多少比例的错误能被静态
类型所捕捉，目前对此仍有争论。静态类型的拥护者认为，当程序通过类型检
查时，它才有更高的可靠性。虽然动态类型的拥护者指出，实际流通的软件证
明，两者在可靠性上并没有多大差别。可以认为静态类型的价值，在于增进类
型系统的强化。强类型语言（如 ML 和 Haskell）的拥护者提出，几乎所有的
bug 都可以看作是类型错误，如果编写者以足够恰当的方式，或者由编译器推
断来宣告一个类型。

静态类型通常可以编译出速度较快的代码。当编译器清楚知道所要使用的资
料类型，就可以产生优化过后的机器代码。更进一步，静态类型语言中的编译
器，可以更轻易地发现较佳快捷方式。某些动态语言（如 Common Lisp）允
许任意类型的宣告，以便于优化。以上理由使静态类型更为普及。
相较之下，动态类型允许编译器和解译器更快速的运作。因为源代码在动态
13类型语言中，变更为减少进行检查，并减少解析代码。这也可减少编辑－编译
－测试－调试的周期。

静态类型语言缺少类型推断（如 Java），而需要编写者宣告所要使用的方
法或函数的类型。编译器将不允许编写者忽略，这可为程序起附加性帮助文档
的作用。但静态类型语言也可以无须类型宣告，所以与其说是静态类型的代
价，倒不如说是类型宣告的报酬。

动态类型允许建构一些静态类型系统所做不出来的东西。例如，eval 函
数，它使得运行任意资料作为代码成为可能（不过其代码的类型仍是静态
的）。此外，动态类型容纳过渡代码和原型设计，如允许使用字符串代替数据
结构。静态类型语言最近的增强（如 Haskell 一般化代数资料类型）允许 eval
函数以类型安全的方式撰写。

动态类型使元编程更为强大，且更易于使用。例如 C++模板的写法，比起等
价的 Ruby 或 Python 写法要来的麻烦。更高度的运行时期构成物，如元类别
（metaclass）和内观（Introspection），对静态类型语言而言通常更为困
难。

@subsection{函数式编程}
函数式编程，或称函数程序设计、泛函编程（英语：Functional
programming），是一种编程范型，它将电脑运算视为函数运算，并且避免
使用程序状态以及可变对象。

在函数式编程中，函数是头等对象即头等函数，这意味着一个函数，既可以
作为其它函数的输入参数值，也可以从函数中返回值，被修改或者被分配给一
个变量。λ 演算是这种范型最重要的基础，λ 演算的函数可以接受函数作为输入
参数和输出返回值。

阿隆佐·邱奇（ Alonzo Church）在 1930 年代开发的 λ 演算[8]，是建造自函
数应用的一种计算形式系统。在 1937 年，艾伦·图灵证明了 λ 演算和图灵机是
等价的计算模型，展示了 λ 演算是图灵完备性的。λ 演算形成了所有函数式编
程语言的基础。

@section{Lisp、Scheme 和 Racket}
@subsection{历史}
在 1958 年，约翰·麦卡锡在麻省理工学院发明了 Lisp 编程语言。

Lisp（历史上拼写为 LISP），是具有悠久历史的计算机编程语言家族，它
起源于 1958 年，是现今第二悠久而仍广泛使用的高级编程语言。Lisp 编程语
族已经演变出许多种方言，现代最著名的通用编程方言是 Scheme、Common
Lisp 和新近的 Clojure。

在 1970 年代，Guy L. Steele 和 Gerald Jay Sussman 开发了 Scheme，如
有影响力的“λ 论文集”和经典的 1985 年教科书《计算机程序的构造和解释》[9]
中所描述的那样。Scheme 是使用词法作用域和尾调用优化的第一个 Lisp 方
言，将函数式编程的影响力提升到更广泛的范围，让更多的编程语言社区接触
到它们。

Matthias Felleisen 在 1990 年代中期创建了 PLT 研究团队。在 1995 年 1
月，这个团队决定开发一个创建在 Scheme 函数式编程语言上的教学用编程语
16言环境，Mattew Flatt 简单的从 libscheme 中将 MrEd (Racket 的原始虚拟
机)、wxWidgets 与一些其他的免费系统结合，接下来的几年内，由
Flatt、Robby Findler、Shriram Krishnamurthi、Cormac Flanagan 和其
他许多人组成的团队推出了 DrScheme，在 2010 年 6 月 7 日, PLT Scheme 被
重命名为 Racket。

@subsection{数据结构}
上文提到，Lisp 程序的同像性是通过 S-表达式和数据结构的形式相同达到
的，如果我们观察 Lisp 的数据结构，能发现它们存在一种高度相关性：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{数据结构}   @bold{Racket中的表示法})
               (list "pair" @code{'(a . b)})
               (list "list" @code{'(a b c)})
               (list "list" @code{'(a b . c)})
               (list "vector" @code{'#(1 2 3)})
               (list "association list" @code{'((a . b) (c . d))})
               (list "hash table" @code{'#hash((a . b) (c . d))}))]

@subsection{优缺点}
不同于现今流行的很多编程语言，S-表达式作为 Lisp 语法是极其规整的，
非常利于计算机操纵，Lisp 通过数据结构和语法的形式相同，故此让 Lisp 程
序具备一种同像性， Lisp 因此得以可以让编程语言可以一些简单的核心函数为
基准，构造起几乎所有的目前流行编程语言所具有的高阶概念，Scheme[作为
Lisp 的一种方言，即是遵循极简主义哲学，以一个小型语言核心作为标准，加
上各种强力语言工具（语法糖）来扩展语言本身的典范。

但是 Lisp 高度统一的语法和数据是一柄双刃剑，S-表达式极为简单高效且
威力无穷，但同时，也带来了一些问题。总体上有以下：
@itemlist[
@item{
阅读理解困难：因为语法的高度统一，同时非常精简，并无明显的形式
可以作为区分，这给阅读和区分不同表达式的代码带来负担；
}
@item{
对精确命名的高要求：因其函数式的特性，不像面向对象编程一样天然
的会在结构上形成层次，面向对象实际上是对抽象的概念作出了规范，
而在函数式编程中，这种规范大多时候只能通过单纯的命名来表达。
}
]

我们下面来举例实际说明一下。首先我们看一下相同作用的代码用 Racket
和 Ruby 分别是如何表达的：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{含义}  @bold{Racket代码}  @bold{Ruby代码})
               (list "加法运算" @code{(+ 1 2 3)}  @code{1+2+3})
               (list "构造数组" @code{(vector 1 2 3)}  @code{[1, 2, 3]})
               (list "构造散列表" @code{(hash 'a 1 'b 2)}  @code{{a: 1, b: 2, c: 3}})
               (list "构造包含一段整数的数组" @code{(build-list 5 values)}  @code{Array(1..5)})
               (list "构造包含相同元素的数组" @code{(make-list 3 1)}  @code{Array.new(3, 1)})
)]

由上表我们可以看出，不同功能的代码在 Ruby 的实现中是形式各异
的，而其在 Racket 的代码实现中都以 S-表达式的方式表达的。

特别的，对于表中的“构造包含一段整数的数组”和“构造包含相
同元素的数组”，在Ruby语言中用面向对象的方式构造，形式各异两者的构
造方法不同 ， 而在Racket语言中都是通过函数来构造的（make-list和
build-list），那么势必需要通过函数名来表达两个函数的含义和作用。

请看下表Racket代码的输入和输出：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{代码输入}  @bold{代码输出})
(list @code{(list 'foo 'foo 'foo)} @code{'(foo foo foo)})
(list @code{(make-list 3 'foo)} @code{'(foo foo foo)})
(list @code{(make-list 6 'foo)} @code{'(foo foo foo foo foo foo )})
(list @code{(build-list 5 values)} @code{'(0 1 2 3 4)})
(list @code{(build-list 10 values)} @code{'(0 1 2 3 4 5 6 7 8 9)})
)]

我们可以看出：
@itemlist[
@item{
make-list用于生成一个列表，列表的内容是 N（第一个参数）个值（第
二个参数）；
}
@item{
build-list也是用于生成一个列表，列表的内容则是从 0 起的 N-1 个自然
数（N 是第一个参数）。
}
]

然而，从名字上看，make-list 和 build-list 显然都是要构造列表的，但是
两者的区别和各自的作用我们是无法看出来的，这势必对函数名的命名提出了
更高的要求，函数名要能精准的表示出不同函数的细微区别，另外值得注意的
是，函数名的命名是依托在自然语言之上的。


@section{二进制、易经和汉字}
我们都知道，计算机的起源是数学中的二进制计数法。可以说，没有二进
制，就没有如今的计算机系统。

现代的二进制记数系统由戈特弗里德·莱布尼茨于 1679 年设计，在他 1703
年发表的文章《论只使用符号 0 和 1 的二进制算术，兼论其用途及它赋予伏羲
所使用的古老图形的意义》（Explication de l'arithmétique binaire, qui se
sert des seuls caractères 0 et 1 avec des remarques sur son utilité et sur
ce qu'elle donne le sens des anciennes figures chinoises de Fohy）@cite{leibniz46}，莱
布尼茨阐明了中国易经中的八卦变换和二进制之间的关系。

古老的易经和新时代的计算机同时都是一种二进制的产物，这是一种巧合
吗？不管是不是巧合，我们能很明确的认识到，这个世界上存在的很多实物，
它们之间都有一种二进制的对立转化关系，比如：黑白，天地，男女，阴阳
等。

易经也在方方面面影响着中国文化甚至汉字。

1957 年诺贝尔物理学奖得主杨振宁曾经在 1993 年 发表过一篇《近代科学进入中国的回顾与前瞻》(LOOKING BACK ON AND FORWARD TO THE
ENTRANCE OF MODERN SCIENCE INTO CHINA）的演讲@cite{yangzhenning93}，进而在 2004
年人民大会堂“2004 文化高峰论坛”上有过关于“《易经》对中华文化的影
响”的演讲@cite{yangzhenning04}，演讲里面有几个重要概括：
@itemlist[
@item{浓缩化、分类化、抽象化、精简化、符号化是《易经》的精神。而这种
精神贯穿到了几千年以来中国文化里面每一个角落；}
@item{汉字汉语是受了易经的影响而发展为单音语言的；}
@item{文言文是极美的文学，美的原因之一就是它不遵循通常语法的发展方
式，而力求用最少的词表达出最多的意思，这种审美观念应是易经的浓
缩化精简化的申延。}
]

@section{汉字的优势}
我们在之前章节叙述Lisp的S-表达式独特的语法所带来的缺点的时候，提
到函数名的命名对于增强Lisp代码的可读性至关重要。我们下面来罗列表格说
明一下汉语汉字的特点。

@subsection{语言颗粒度更细}
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{英文词根}  @bold{英文单词以及对应翻译})
(list "exo-表示：外部的，外面" "exotic来自异国的、exoteric外界的")
(list "com-,con-表示：共同" "combine联合，结合、compassion同情、comparison比较")
(list "by-表示：在旁边，副的" "byproduct副产品（by+product产品）、byroad辅路（by+road路）、byway小道（by+way小路）")
)]
由上表我们可以看出，英文的词根通常对应的是汉字的一个词语
或者字的含义，由英语词根组成的词语对应的通常是一个汉字词汇了。汉语显
然相较英文能作出更多精细化的含义表达。

@subsection{属性归类能力}
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{汉字偏旁}  @bold{相关汉字})
(list "三点水（氵）" "波 （ wave ） 、 浪 （ wave ） 、 浴（bash）、沐（bath）、海（sea）、江（river）、河（river）")
(list "草字头（艹）" "草（grass）、 花（flower ）、 艺、芒、苏、菜")
(list "走之旁（辶）" "过、达、迅、速、迁、近、远")
(list "提手旁（扌）" "指、执、扣、打、扔、押")
)]
由上表我们可以看到，同样偏旁的汉字有着相同的属性，英文并没有这种对抽象概念的属性描述和归类能力。

@subsection{举例}
对于之前表提到的Racket的make-list和build-list函数，如果用中文，可以是如下：
@tabular[#:style 'boxed
         #:column-properties '(left left)
         #:row-properties '(bottom-border ())
         (list (list @bold{代码输入}  @bold{代码输出})
(list @code{(链 'foo 'foo 'foo)} @code{'(foo foo foo)})
(list @code{(复链 3 'foo)} @code{'(foo foo foo)})
(list @code{(复链 6 'foo)} @code{'(foo foo foo foo foo foo )})
(list @code{(序链 5 values)} @code{'(0 1 2 3 4)})
(list @code{(序链 10 values)} @code{'(0 1 2 3 4 5 6 7 8 9)})
)]
