#import "template.typ": *

/// 开始论文写作
/// 
/// 参数提供论文的基本信息。暂不确定的信息可空置，论文中相关位置由红色文字占位。确定后及时补充。
#show: 论文.with(
    题目: [如何用Typst排版论文],
    年级: [2024],
    //学号: [123456],
    //姓名: [张三], 
    专业: [交通工程],
    指导教师: [熊耀华],
    //发题日期: datetime(year: 2023, month: 12, day: 1),
    //完成日期: datetime.today(),
    目的意义: [
        写论文是大学毕业的必要条件，有重要的的意义。使用有效的工具排版论文可以减少工作量，提高结果质量。传统的工具中，微软Word所见即所得、容易上手，但编辑论文这样的复杂文档时难以保证格式统一；LaTeX是学术论文写作的事实标准，但开发时间久远，易用性不好，安装、配置、定制都很繁琐。

        本研究探索一种新型排版工具Typst在本科论文排版中的潜力，为快速高质量排版本科论文提供技术支持。
    ],
    任务: [
        本研究中学生应完成以下任务：
        - 阅读论文排版相关文献；
        - 尝试用Word排版论文；
        - 尝试用LaTeX排版论文；
        - 结合本文学习Typst排版，与前两个排版流程进行对比；
        - 总结Typst排版论文的优势和不足，为未来改进提供建议。
    ],
    达成度: [
        通过本研究，学生实现以下专业培养目标：
        - 知识结构上了解排版的基本原理；
        - 能力结构上掌握结构化排版技能；
        - 素质结构上提升主动学习探索精神。
    ],
    时间分配: [
        / 文献阅读: 阅读学术论文写作技巧、排版理论相关文献（3周）
        / Word排版试验: 用Word尝试排版两万字的学位论文。完整包括目录、章节、索引、引用等学术论文组成元素。（2周）
        / LaTeX排版试验: 用LaTeX排版同一内容，要求与上一条相同。（3周）
        / Typst排版试验: 用Typst排版同一内容，要求与上一条相同。（3周）
        / 撰写报告: 比较不同软件排版的体验，撰写报告。从安装难度、定制丰富性、排版效果等方面比较三种软件的优劣。（3周）
        / 评阅及答辩: 提交报告，准备答辩（2周）
    ],
    备注:[
        无
    ],
    中文关键词: [论文、排版、Typst],
    中文摘要: [
        论文排版规范是毕业要求之一，有重要的意义。本文探索用新锐结构化排版工具Typst在论文排版工作中的应用。本文首先介绍了排版的一般理论；然后比较分析了不同类型排版软件的特点；最后用Typst实际排版一篇符合西南交通大学学位论文格式要求的论文作为案例。通过理论分析和案例分析本文得出结论：Typst能够保证排版质量、提高排版效率、降低排版工作量，是学位论文排版的有效工具。
    ],
    英文关键词: [Thesis, Typesetting],
    英文摘要: [
        A well typesetted thesis, conforming to required style, is a prerequisite for academic degrees. This research explore the potential of a new structural typesetting system, named _Typst_, in thesis typesetting. We first introduced the general typesetting rules and principles, then analyzed various typesetting systems by feature comparison. Finally, with the gained insight and skill, we carried out an actural typesetting project, which produces a sample text conforming to the thesis style guide of Southwest Jiaotong University, as a case study. Based on theoritial analysis and case study we conclude that _Typst_ represents an effective typesetting tool for thesis, and it excels not only in quality of result, but also in efficiency of process.
    ]
)

#page(header: none, footer: none)[] //FIXME: 自动插入空白页
= 绪论 <绪论章>

Typst是一种新锐结构化文档排版工具@madje2022，可用于复杂结构化文档的排版。本文主要有两个目的，一是作为文档介绍用Typst排版本科毕业论文的方法；二是_本文自身用Typst排版_，可以作为案例证明Typst排版的有效性。

== 背景

排版软件各式各样，论文写作最常用的有两种：微软Word和LaTeX。其中Word作为图形化程序上手简单，但排版论文，尤其是长篇学术论文时，往往存在效率低下，排版质量欠缺的问题。LaTeX是当前学术排版的事实标准，排版质量近乎完美，但是LaTeX开发年代久远，语法晦涩、使用繁琐，新手难以入门。

Typst可以看作现代化的LaTeX，基于同样的核心设计思想——_“内容与形式分离”_，但是吸收了半个世纪软件技术的成果，在表达能力、处理效率、易用性等各个方面有了长足的进步。#ref(<衰和帅>)风趣的表达了两种系统的区别。

Typst项目根据名字的首字母“t”，设计了该项目的吉祥物：字母怪兽t。@吉祥物

#figure(image(
    "./images/typst-logo.jpg",
    width: 40%
    ),
    caption: [Typst项目吉祥物] 
) <吉祥物>

本文结合本科学位论文排版需求，探索如何用Typst排版复杂的结构化文档。

== 研究问题

为了排版学位论文，需要研究下列问题：
- 如何安装Typst，配置写作环境；
- 如何对论文手稿进行版本管理；
- 如何在手稿中标记各种格式要求，例如标题、列表、强调、原文引用等；
- 如何排版数学公式；
- 如何插入图、表；
- 如何交叉索引论文中的其他元素，例如公式、图标、章节等；
- 如何管理参考文献、引用参考文献。

== 章节安排

本文后续章节安排如下：
- 第二章综述相关文献，包括排版的一般概念和理论；排版工具软件的主要分类；Typst软件的设计思想。
- 第三章详细描述使用Typst软件，基于西南交大学位论文模板（后文简称*模板*），排版学位论文的方法。
- 第四章分析Typst软件和模板的优势和不足，建议后续改进提供方向。
- 最后总结全文，得出结论。

= 文献综述

本章首先介绍排版的一般概念和理论，帮助读者建立排版流程的概念模型。然后简单比较排版软件的两种主要设计思路：结构化排版和所见即所得排版，比较各自的优缺点、适用范围。最后简单分析Typst软件的设计思想，如何实现功能强大、使用简单、运行高效的现代排版系统。

== 排版一般理论和概念

*排版*本意是将活字排列成印版，是活字印刷的前置环节@griffin2021。传统的书籍出版流程大致如下：
+ 作者写出*手稿*。手稿中除文字本身，还按照一定规则*标记*出文字的逻辑结构。例如加下划线表示标题，提行表示分段，下面加点代表强调。
+ 编辑校对，审核手稿，排除错别字。
+ 版面设计师设计*视觉样式*，决定各种逻辑结构的大小、形状、颜色等视觉属性。例如不同类型元素的字体、字号；行距、段距；压花、水印、页头、页脚、装饰花纹，等等。
+ 排版工人根据手稿和视觉元素规则将铅字排列和固定到印版上，也就是所谓的排版。排版大量文字不但工作量巨大，同时排版是否美观极其依赖排版工人的经验。
+ 印版安装上印刷机，实际印刷。

#h(2em)传统的排版流程人工耗费大、周期长、成本高，普通人无法承担，因此付印自己的作品是少数作者的特权。二十世纪六十年代，随着计算机开始在学术界普及，少数学者开始用计算机排版的尝试，其中最为成功的是斯坦福大学高德纳（Donald Knuth）教授。在出版自己学术著作的过程中，由于对出版社的排版水平不满意，他开发了一款称为TeX的排版软件，自己完成排版工作@knuth1986。一经推出TeX风靡学术界和出版界，后续Leslie Lamport博士在其基础上开发了LaTeX，至今仍是计算机排版的黄金标准@lamport1994。

在计算机排版流程中，排版软件取代了版面设计师和排版工人的角色。作者只要写好手稿文字，并按照排一定规则标记好段落、章节等逻辑结构，排版软件会自动选择视觉样式，生成可以用于印刷的文件（例如pdf文件）。有了排版软件的帮助，作者付印自己作品的难度大大降低。

== 排版工具分类

排版软件从功能上大致应该包含以下三个方面：
+ 编辑文字，标记其逻辑结构；
+ 修改某种逻辑结构的视觉样式；
+ 综合文字、逻辑结构标记、视觉样式三个元素，生成可应刷文件。

#h(2em)按照前两个方面的操作方式，排版软件可以大致分为两大类：批处理排版软件和所见即所得排版软件。更详细的分类参考文献@rebelo2023[]。

=== 批处理排版软件 <批处理软件小节>

TeX/LaTeX/Typst都属于批处理排版软件。所谓批处理是指作者写作过程中面向手稿，主要考虑文字和逻辑结构，而不关心视觉样式。当手稿写作完成后，排版软件一次性将手稿转换为可印刷文件。

批处理排版软件尤其适合处理规模大、结构性强的手稿@rebelo2023。首先写作过程中专注内容和结构，排除视觉元素干扰，更能集中注意力；其次批处理生成可应刷文件能够保证视觉样式的一致性。另外批处理排版本质上是一种面向文字的编程，手稿是源代码，排版软件是编译器，可印刷文件是编译后的结果。通过编程可以很快速完成大量重复的文字编辑工作。

=== 所见即所得排版软件

微软的Word是典型的所见即所得排版软件。所见即所得的写作过程中，不但能编辑文字，还能同时编辑文字的字体、颜色等各种视觉样式。这样的好处首先是直观，符合一般用户直觉，容易上手；其次可以随时观察和修改最终排版效果，灵活性强，适合用于少量视觉性、探索性强的排版工作，如海报等@rebelo2023。

== 批处理排版软件发展历程

Typst软件可以看作对TeX/LaTeX设计思想的继承和发展。TeX/LaTeX开创性的提出了*排版就是编程*这个概念，具有划时代的意义。但由于当时技术条件的局限性，软件的设计实现存在不少问题。例如：
- 70年代计算内存紧张，往往以k为单位。为了节省内存TeX被设计为一种*宏语言*。但后续计算机科学领域的研究和实践证明，宏语言存在各种缺陷，不适合作为主力语言。一个直接的后果就是LaTeX下脆弱的宏包。
- 70年代很少有人考虑非英语世界的用户，更没有Unicode标准。因此TeX一开始只支持英文，后续才扩展到其他欧洲文字，最后才是中日韩等非欧洲文字。由于初始设计的限制，这些扩展直到今天任然存在各种小问题。
- 70年代主力编程语言是C，而TeX的源代码采用的CWEB语言是高德纳教授基于C开发的一种扩展。CWEB后续没能流行起来，除了TeX开发者外基本上没人用。因此TeX的代码很少有人能够理解、维护、扩展。

#h(2em)基于以上原因，过去半个世纪里有各种改进TeX/LaTeX系统的尝试，分为两条技术路线。一是在保证与TeX兼容的前提下进行扩展。主要的工作有eTeX增加英语外的欧洲语言支持；pdfTeX支持输出pdf格式的文件；XeTeX增加Unicode编码以及ttf、otf字体技术支持@kew2005。最有雄心的计划应该是LuaTeX，准备用Lua语言尽可能替换TeX宏语言，降低复杂宏包的开发难度@isambert2011。

另外一条路线是放弃和TeX兼容，推倒重来，用现在的技术重新设计排版软件。这条路线上多数项目都是浅尝则止，没能流行起来。毕竟绝大多数用户已经习惯了TeX，新系统必须有很强的吸引力才能让用户愿意学习一种新的系统。这条路线上之前最成功的案例是SILE，现在是Typst，走到了一个新高度。

与TeX相比，Typst的吸引力来自以下方面：
- Typst虽然与TeX不直接兼容，但是完整继承了“排版就是编程”的精神，和对排版细节质量的追求。实际上Typst里的核心算法，如分词、断行等，直接来自于TeX。
- Typst抛弃了TeX的宏语言设计，采用了当前最先进的*不可变函数式编程*（immutable functional programing）语言设计@wadler1992。这种设计极大的提高了语言的严密性、表达力、运行效率。
- Typst开发中采用当前最新的软件技术与工具。例如用Rust语言开发，基于WASM的插件机制，基于freetype库的字体管理，基于LSP协议的编辑器整合，基于Web技术的在线编辑器，等等。通过这些技术不但降低了使用难度，也降低了开发难度。

#figure(
    image("./images/why-typst.jpg"),
    //caption: [LaTeX衰，Typst帅#emoji.dog.face],
    caption: [LaTeX衰，Typst帅],
) <衰和帅>

== 小结

本节对排版软件的一般概念和方法进行综述，说明Typst系统的特性非常适合排版学位论文这类结构化的复杂文档。下一章我们将描述具体排版方法。

= 排版方法

本章结合西南交通大学学位论文模板介绍Typst的常用功能。如需了解完整功能请参考Typst官方文档@typst-doc。

== Typst安装和设置

搭建Typst环境最简单的方法是：
+ 下载、安装Visual Studio Code编辑器；
+ 打开编辑器，点击窗口左侧插件边栏；
+ 搜索、安装以下插件
    - Typst LSP
    - Typst Preview
+ 完成

#h(2em)另外，如果要自动化管理手稿版本和参考文献，还推荐安装以下软件：
+ 版本管理软件Git
+ 文献管理软件Zotero

== 文字模式和代码模式

Typst工作过程中为了区分手稿中的字符是需要排版的_文字_，还是需要运行的_代码_，因此存在两种不同的*工作模式*。其中默认状态下处于*文字模式*，如果需要明确切换到文字模式可以使用方括号包裹，例如`[文字]`。需要切换到*代码模式*时需要使用井号`#代码`表示一行代码，或者用井号加花括号`#{代码}`包裹多行代码块。

#示例(```[
    排版是一门艺术，讲究说学逗唱。

    #let a = 10
    #lorem(a)

    #{
        let b = 20
        lorem(b)
    }
]```.text)

对于最终用户，绝大多数时候在默认的文字模式中工作，因此_最外层的方括号可以省略_。

== 普通文字排版

论文中绝大部分是普通文字，最重要的逻辑结构是_章节、段落、列表、强调_等。
Typst用不同数量的_等号`=`表示章节结构_，例如

#示例("[
    = 绪论
    论文排版很重要，有研究的必要性和可行性。论文排版工具有许多，用哪个工具最好？
    = 文献综述
    == 国内文献
    关于排版国内学者做了如下研究……
    == 外国文献
    关于排版国外学者做了如下研究……
    = 研究方法
    我们的研究方法是……
    = 实验设置和结果
    我们的实验怎么做的，结果如何，说明了什么……
    = 结论
    我们的结论是：使用合适的工具排版事半功倍，Typst是最好的工具。
]")

其中，源码中正文文字用_空行表示分段_，连续的行属于同一段。例如
#示例("[
    这是第一段。
    这还是第一段。

    空行之后是第二段。
    空行之后是第二段。
    空行之后是第二段。
    
    空行之后是第三段。空行之后是第三段。
]")

注意，第二、第三段前提行两个字，但第一段没有。原因是首段不提行是西文排版规范。在中文排版规则支持完善前，我们需要用`#h(2m)`_手动插入空白_。
这里`#`切换到代码模式、`h`函数代表横向（horizontal）空白、参数`2em`代表两个字符宽度。
#示例("[
    #h(2em)这是第一段。这还是第一段。这还是第一段。这还是第一段。

    空行之后是第二段。空行之后是第二段。空行之后是第二段。
]")

Typst用_减号`- `表示无顺序列表，加号`+ `表示有顺序列表，下划线`_ _`表示强调，星号`* *`表示着重强调_。示例如下：
#示例("[
    论文排版者，_毕业之大事_，死生之地，存亡之道，*不可不察*也。

    排版中需要注意的事项有：
    - 注意事项一
    - 注意事项二
    - ……
    
    #h(2em)排版的流程分三步：
    + 第一步
    + 第二步
    + 第三步
]")

== 数学公式排版

学术论文，尤其是科学、工程类论文往往包含大量数学公式。TeX最初能够流行的重要原因就是高质量的公式排版。Typst继承了TeX的衣钵，具有同样强大，甚至某些方面更为强大的公式排版能力。

数学公式用`$`符号表示，分为两种形式：_行内公式_，内嵌在文字行中，用*没有空白*的`$`包围，例如$f(x)=a + b^2$ 这个函数。_行外公式_，单独成行，用*有空白*的`$`包围，例如
$ f(x)=integral sin(x)/cos(d) dif x $
注意，行内公式只适合简单、不需要在别处引用的公式；对复杂的，需要引用的公式，必须使用行外公式。

数学公式排版依赖一套语法规则，这里篇幅有限，只展示一些典型的案例。需要了解详细规则的读者自行参考Typst文档。

#示例(```[
    - 这是行内公式：$f(x)=a + b^2$
    - 这是行外公式：$ f(x)=integral sin(x)/cos(d) dif x $
    - 多行公式用`\`表示换行，`&`表示对齐位置
    $
        sum_(k=0)^n k
            &= 1 + ... + n \
            &= (n(n+1)) / 2 
    
    $
    - `lr`动态调整包围符号大小
    $
        angle.l i, 2^(2^i) angle.r \
        lr(angle.l i, 2^(2^i) angle.r)
    $
    - 公式中内嵌文字
    $ "area" = pi dot "radius"^2 $
    - 使用其他字体
    $ cal(A) := { x in RR | x "is natural" } $
]```.text)

== 图、表、代码排版 <图表排版节>

除了文字外，某些时候需要_插入图片、表格、代码段_帮助说明问题。Typst中插入图、表分为两个步骤：
+ 插入图、表、代码本身
+ 添加说明文字
这样设计的原因是，某些文件里图片和表格不需要说明。但_对于论文说明文字是必须的_。

首先使用`image`函数插入图片，`table`函数插入表格。各函数的详细用法参考官方文档，这里提供简单示例如下：

#示例(```[
    #h(2em)Typst项目根据名字的首字母“t”，设计了该项目的吉祥物：字母怪兽t。

    #image(
        "../images/typst-logo.jpg",
        width: 80%
    )
]```.text)

#示例(```[
    #h(2em)常用排版软件的作者是：
    #table(
        columns: (1fr, 1fr),
        [软件], [作者],
        [Typst], [Martin Haugh和Laurenz Mädje],
        [TeX], [Donald Knuth],
        [LaTeX], [Leslie Lamport],
        [Word], [不详]
    )
]```.text)

插入代码段可以用`raw`函数，或者六个单引号包围#raw("```代码```", block: false)。示例如下，注意单引号后的`python`一词，指定了代码语言，方便进行语法加亮。`raw`函数中的`lang`参数起同样的作用。Typst支持大量编程语言的语法，详情参考文档。

#示例("[
    ```python
    a = 3
    for i in range(20):
        a += i
    print(a)
    ```
]")
#示例(```[
    #raw("int a = 3;
for(i=0;i<20;i++) {
    a += i
}
cout << a;
    ", lang: "c++", block: true)
]```.text)
#示例("[
    ```rust
    let mut a: i32 = 3;
    for i: i32 in 0..20 {
        a += i;
    }
    println!(a)
    ```
]")

添加标题需要使用`figure`函数，其中`caption`参数指定标题，示例如下：
#示例(```[
    #h(2em)新老两代排版人，白发苍苍的老教授和意气风发的青年。
    #figure(
        grid(
            columns: (1fr, 1fr), column-gutter: 4pt,
            image("../images/knuth.jpeg"),
            image(
                "../images/martin-and-laurenz.jpeg"
            ),
        ),
        caption: [TeX的创造者Donald Knuth教授（左图）；Typst的创造者Martin Haugh和Laurenz Mädje（右图）]
    )

]```.text)
#示例("[
    #figure(
        ```python
        a = 0
        for i in range(1, 1001):
            a += i
        print(a)
        ```,
        caption: [从1累加到1000的Python代码。使用了高斯教授发明的最新科技`for`循环]
    )
]")
`figure`函数，同样可以给表格和代码添加标题，示例如下：
#示例(```[
    #figure(
        table(
        columns: (1fr, 1fr, 0.5fr),
        [*软件*], [*作者*], [*年代*],
        [TeX], [Donald Knuth], [1970],
        [LaTeX], [Leslie Lamport], [1980],
        [Typst], [Martin Haugh和\ Laurenz Mädje], [2020],
        [Word], [不详], [1990],
        ),
        caption: [常用排版软件和作者对照表],
        kind: table
    ) <软件作者对照表>
]```.text)
注意，这里`<软件作者对照表>`是一个*引用标签*，方便在文章其他地方引用该表；详情见@交叉引用节。

== 内部交叉引用 <交叉引用节>

_交叉引用_文本中其他部分的内容是学位论文等复杂文本的一大特点。手工维护交叉引用非常繁琐，费时费力还容易出错。Typst可以自动维护交叉引用，节省作者的时间精力。

使用交叉引用首先要给被引用对象*添加标签*，方法是在_被引用对象最后一行尾部_添加，语法是`<标签名>`；常见可引用对象包括：章节、公式、图、表。然后在文章中需要的位置*引用标签*，语法是`@标签名`或者`#ref(<标签名>)`；前者后面_必须接标点符号或空一格_，后者之后可以不用。

注意，标签名的选用原则按重要性排序是有实际意义、便于记忆、简短。不能为了简短取没有意义、不好记忆的名字。例如本章不能用`<第三章>`作为标签，因为顺序可能会调整；而应该用`<排版方法章>`这个有实际意义的标签。

#示例(```[
    $ E = m dot.c c^2 $ <质能方程>
    
    #h(2em)爱因斯坦首先提出了@质能方程；根据#ref(<质能方程>) 可以计算原子核发生裂变时放出的能量，因此称为质能方程。
]```.text)

#示例(```[
    #h(2em)#ref(<图表排版节>)中的@软件作者对照表 列出了常见排版软件的作者和开发年代。
    #ref(<绪论章>)里的@衰和帅 形象的展示了LaTeX和Typst功能上的区别。
    #ref(<批处理软件小节>)介绍了不同批处理结构化排版软件的历史沿革。
]```.text)

附录中标号有特殊要求，一般用“A、B、C”代替“1、2、3”。不过本模板会处理好这些细节，不用作者操心。例如：@附录公式，@附录图，@附录表。
== 外部引用和文献管理

学术写作中往往需要_大量引用他人的作品_，作为支撑材料，作为研究对象、理论基础、或者观点佐证。与内部引用相比，外部引用数量更大，管理更繁琐，是学术写作的一大痛点。幸好Typst提供了很好的支持。

使用外部文献一般需要三个步骤：搜集、整理文献数据库；导出文献；引用文献。接下来简要介绍。

搜集文献是指在平时的阅读、研究过程中，将看过的论文、书籍、网页、邮件等各种资料的_信息输入一个数据库_；同时对数据库中的大量资料要_分门别类整理_。这个过程很多文献管理软件可以完成，这里推荐开源的Zotero。

论文写作时排版软件一般不能直接引用数据库，而是引用某种_标准格式的导出文件_，最常用的格式是BiBLaTeX格式，扩展名为`.bib`@lehman2006。从Zotero中可以将数据库导出成该格式文件。`.bib`文件中包含有很多_条目_，本文`.bib`文件中的第一个条目内容如下：

```
@book{griffin2021,
  title = {Type {{Specimens}}: {{A Visual History}} of {{Typesetting}} and {{Printing}}},
  author = {Griffin, Dori},
  date = {2021},
  publisher = {{Bloomsbury Publishing}},
  isbn = {1-350-11661-0}
}
```

每个条目有一个*键值*，用于引用该条目。键值一般是一个短字符串，由Zotero自动生成，保证唯一性。常见的方式是_作者姓名加发表年份_。例如以上条目的键值是`griffin2021`，从后续字段中可以看出这是Dori Griffin在2021年出版的一本书。

在Typst中排版论文时，用交叉引用相同的语法进行外部引用，只是_用键值代替标签_。示例如下，具体解释见@交叉引用节。

#示例(```[
    斯坦福大学的Donald Knuth教授发明了TeX排版系统@knuth1986。
    北京大学的王选院士在文献#cite(<WangXuan1998>, style: "ieee")中回顾了中文计算机排版的发展历程。
]```.text)

所有被引用过的文献，Typst会自动调整格式后，按顺序排列在文末#link(<参考文献>)[参考文献]一节。

== 手稿版本管理

学位论文写作是一个长期的过程，往往需要几个月甚至几年，在漫长的过程中_需要反复增删改_。这个过程中留下每次增删改的详细记录，随时追溯不同版本的变化非常重要。

最简单的方法是每天保存一个版本文件，按日期命名，但这种方法过于简陋。更好的方法是向程序员学习，使用版本管理软件。这类软件不少，但当前最流行的是Git，功能强大、支持广泛，建议采用@zolkifli2018。
#show: 正文结束
= 结论

本文介绍了新锐结构化排版软件Typst，包括它的设计理念、基本功能、实际使用。本文中提供的案例，尤其是本文排版过程本身证明了Typst是排版学位论文的优秀工具。

= 致谢

感谢Donald Knuth教授奠定了结构化排版的理论基础，实现了早期的可用系统TeX；感谢Leslie Lamport博士在TeX基础上开发了LaTeX，增强了易用性，推动结构化排版在学术界的广泛应用；最后感谢Martin Haugh和Laurenz Mädje两位的出色工作，继承TeX/LaTeX的精神，融合现代软件工程技术，开发出Typst这一优秀的结构化排版系统，让本文成文可能。

#bibliography("references/reference.bib", style: "./references/china-national-standard-gb-t-7714-2015-numeric.csl") <参考文献>

#show: 附录

= 其他说明
附录中标号有特殊要求，一般用“A、B、C”代替“1、2、3”。不过本模板会处理好这些细节，不用作者操心。例如：

#示例(```[
    $ f(x)=integral sin(x)/cos(d) dif x $ <附录公式>
]```.text)

#示例(```[
    #figure(
        table(
        columns: (1fr, 1fr),
        [软件], [作者],
        [Typst], [Martin Haugh和Laurenz Mädje],
        [TeX], [Donald Knuth],
        [LaTeX], [Leslie Lamport],
        [Word], [不详]
        ),
        caption: [常用排版软件和作者对照表],
        kind: table
    ) <附录表>
]```.text)

#示例(```[
    #figure(
        grid(
            columns: (1fr, 1fr),
            column-gutter: 4pt,
            image("../images/knuth.jpeg"),
            image("../images/martin-and-laurenz.jpeg"),
        ),
        caption: [TeX的创造者Donald Knuth教授（左图）；Typst的创造者Martin Haugh和Laurenz Mädje（右图）]
    ) <附录图>
]```.text)

= 英文翻译

= 公式推导