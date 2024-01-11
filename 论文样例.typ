#import "template.typ": *

/// 开始论文写作
/// 
/// 参数提供论文的基本信息。暂不确定的信息可空置，论文中相关位置由红色文字占位。确定后及时补充。
#show: 论文.with(
    题目: [如何用Typst排版论文],
    年级: [2024],
    学号: [123456],
    //姓名: [张三], 
    专业: [交通工程],
    指导教师: [李四],
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
        #lorem(100)
    ],
    英文关键词: [Thesis, Typesetting],
    英文摘要: [
        #lorem(50)

        #lorem(50)
    ]
)

#page(header: none, footer: none)[] //FIXME: 自动插入空白页
= 绪论

Typst是一种排版工具，本文介绍如果用来排版本科毕业论文。

== 背景

排版软件各式各样，论文写作最常用的有两种：
- 微软Word；
- LaTeX。
其中Word不适合复杂结构化文本的排版，LaTeX开发年代久远，局限于当时的技术水平不注重用户使用体验。

Typst可以看作现代化的LaTeX，基于同样的“内容与形式分离”设计思想，但是利用现代技术极大的改进了用户体验。本文探索如何用Typst排版本科毕业论文。

== 研究问题

为了排版本科论文，需要研究下列问题：
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

*排版*本意是将活字排列成印版，是活字印刷的前置环节。传统的书籍出版流程大致如下：
+ 作者写出*手稿*。手稿中除文字本身，还按照一定规则*标记*出文字的逻辑结构。例如加下划线表示标题，提行表示分段，下面加点代表强调。
+ 编辑校对，审核手稿，排除错别字。
+ 版面设计师设计*视觉样式*，决定各种逻辑结构的大小、形状、颜色等视觉属性。例如不同类型元素的字体、字号；行距、段距；压花、水印、页头、页脚、装饰花纹，等等。
+ 排版工人根据手稿和视觉元素规则将铅字排列和固定到印版上，也就是所谓的排版。排版大量文字不但工作量巨大，同时排版是否美观极其依赖排版工人的经验。
+ 印版安装上印刷机，实际印刷。

#h(2em)传统的排版流程人工耗费大、周期长、成本高，普通人无法承担，因此付印自己的作品是少数作者的特权。二十世纪六十年代，随着计算机开始在学术界普及，少数学者开始用计算机排版的尝试，其中最为成功的是斯坦福大学高德纳（Donald Knuth）教授。在出版自己学术著作的过程中，由于对出版社的排版水平不满意，他开发了一款称为TeX的排版软件，自己完成排版工作。一经推出TeX风靡学术界和出版界，后续Leslie Lamport博士在其基础上开发了LaTeX，至今仍是计算机排版的黄金标准。

在计算机排版流程中，排版软件取代了版面设计师和排版工人的角色。作者只要写好手稿文字，并按照排一定规则标记好段落、章节等逻辑结构，排版软件会自动选择视觉样式，生成可以用于印刷的文件（例如pdf文件）。有了排版软件的帮助，作者付印自己作品的难度大大降低。

== 排版工具分类

排版软件从功能上大致应该包含以下三个方面：
+ 编辑文字，标记其逻辑结构；
+ 修改某种逻辑结构的视觉样式；
+ 综合文字、逻辑结构标记、视觉样式三个元素，生成可应刷文件。

#h(2em)按照前两个方面的操作方式，排版软件可以分为两大类：批处理排版软件和所见即所得排版软件。

=== 批处理排版软件

TeX/LaTeX/Typst都属于批处理排版软件。所谓批处理是指作者写作过程中面向手稿，主要考虑文字和逻辑结构，而不关心视觉样式。当手稿写作完成后，排版软件一次性将手稿转换为可印刷文件。

批处理排版软件尤其适合处理规模大、结构性强的手稿。首先写作过程中专注内容和结构，排除视觉元素干扰，更能集中注意力；其次批处理生成可应刷文件能够保证视觉样式的一致性。另外批处理排版本质上是一种面向文字的编程，手稿是源代码，排版软件是编译器，可印刷文件是编译后的结果。通过编程可以很快速完成大量重复的文字编辑工作。

=== 所见即所得排版软件

微软的Word是典型的所见即所得排版软件。所见即所得的写作过程中，不但能编辑文字，还能同时编辑文字的字体、颜色等各种视觉样式。这样的好处首先是直观，符合一般用户直觉，容易上手；其次可以随时观察和修改最终排版效果，灵活性强，适合用于少量视觉性、探索性强的排版工作，如海报等。

== 批处理排版软件发展历程

Typst软件可以看作对TeX/LaTeX设计思想的继承和发展。TeX/LaTeX开创性的提出了*排版就是编程*这个概念，具有划时代的意义。但由于当时技术条件的局限性，软件的设计实现存在不少问题。例如：
- 70年代计算内存紧张，往往以k为单位。为了节省内存TeX被设计为一种*宏语言*。但后续计算机科学领域的研究和实践证明，宏语言存在各种缺陷，不适合作为主力语言。一个直接的后果就是LaTeX下脆弱的宏包。
- 70年代很少有人考虑非英语世界的用户，更没有Unicode标准。因此TeX一开始只支持英文，后续才扩展到其他欧洲文字，最后才是中日韩等非欧洲文字。由于初始设计的限制，这些扩展直到今天任然存在各种小问题。
- 70年代主力编程语言是C，而TeX的源代码采用的CWEB语言是高德纳教授基于C开发的一种扩展。CWEB后续没能流行起来，除了TeX开发者外基本上没人用。因此TeX的代码很少有人能够理解、维护、扩展。

#h(2em)基于以上原因，过去半个世纪里有各种改进TeX/LaTeX系统的尝试，分为两条技术路线。一是在保证与TeX兼容的前提下进行扩展。主要的工作有eTeX增加英语外的欧洲语言支持；pdfTeX支持输出pdf格式的文件；XeTeX增加Unicode编码以及ttf、otf字体技术支持。最有雄心的计划应该是LuaTeX，准备用Lua语言尽可能替换TeX宏语言，降低复杂宏包的开发难度。

另外一条路线是放弃和TeX兼容，推倒重来，用现在的技术重新设计排版软件。这条路线上多数项目都是浅尝则止，没能流行起来。毕竟绝大多数用户已经习惯了TeX，新系统必须有很强的吸引力才能让用户愿意学习一种新的系统。这条路线上之前最成功的案例是SILE，现在是Typst，走到了一个新高度。

与TeX相比，Typst的吸引力来自以下方面：
- Typst虽然与TeX不直接兼容，但是完整继承了“排版就是编程”的精神，和对排版细节质量的追求。实际上Typst里的核心算法，如分词、断行等，直接来自于TeX。
- Typst抛弃了TeX的宏语言设计，采用了当前最先进的*不可变函数式编程*（immutable functional programing）语言设计。这种设计极大的提高了语言的严密性、表达力、运行效率。
- Typst开发中采用当前最新的软件技术与工具。例如用Rust语言开发，基于WASM的插件机制，基于freetype库的字体管理，基于LSP协议的编辑器整合，基于Web技术的在线编辑器，等等。通过这些技术不但降低了使用难度，也降低了开发难度。

== 小结

本节对排版软件的一般概念和方法进行综述，说明Typst系统的特性非常适合排版学位论文这类结构化的复杂文档。下一章我们将描述具体排版方法。

= 排版方法

本章介绍如何使用Typst软件，结合模板排版西南交通大学学位论文。

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

#示例("[
    排版是一门艺术，讲究说学逗唱。

    #let a = 10
    #lorem(a)

    #{
        let b = 20
        lorem(b)
    }
]")

对于最终用户，绝大多数时候在默认的文字模式中工作，因此_最外层的方括号可以省略_。

== 普通文字排版

论文中绝大部分是普通文字，最重要的逻辑结构是_章节、段落、列表、强调_等。
Typst用不同数量的_等号`=`表示章节结构_，例如

#示例("[
    = 绪论
    排版很重要，有研究的必要性和可行性。
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
    我们的结论是：使用合适的工具排版事半功倍。
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

Typst用_减号`- `表示无顺序列别，加号`+ `表示有顺序列别，下划线`_ _`表示强调，星号`* *`表示着重强调_。示例如下：
#示例("[
    排版者，_毕业生_之大事，死生之地，存亡之道，*不可不察*也。

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
== 图、表排版
== 内部交叉引用
== 文献管理和引用
== 手稿版本管理
#show: 正文结束
= 结论

== 结论一
== 结论二

= 致谢

#bibliography("reference.bib", style: "gb-7714-2005-numeric")

#show: 附录

= 英文翻译
== 翻译一
== 翻译二
= 公式推导
== 公式一
== 公式二