#import "modules/common.typ": 占位
#import "modules/pages.typ": *

#let 添加页眉(body) = {
    set page(
        header: [
            #move(
                dy: 8pt,
                text(
                    font: 字体.黑体,
                    size: 字号.小四
                )[#h(1fr)西南交通大学本科毕业设计（论文）#h(1fr)]
            )

            #box(
                width: 100%,
                line(length: 100%)
            )
        ]
    )

    body
}

#let 正文开始(body) = {
    set page(footer: [
        #set align(center)
        #counter(page).display(
            "第 1 页",
            both: false,
        )
    ])
    set heading(numbering: (..nums) => {
        if nums.pos().len() == 1 {
            numbering("第 1 章  ", ..nums)
        } else {
            numbering("1. 1 ", ..nums)
        }
    })
    show heading: it => {
        set text(font: "SimHei")
        let loc = it.location()
        let num = counter(heading).at(loc)
        
        if it.level == 1 {
            pagebreak(weak: true)
            set text(size: 字号.小三)
            v(1em)
            block[
                #h(1fr)
                #numbering("第1章", ..num)
                #h(1em)
                #it.body
                #h(1fr)
            ]
            par(leading: 0em, hide(text(size: 10pt)[aa]))
        } else {
            set text(size: 字号.四号)
            block[
                #numbering("1.1", ..num)
                #it.body
            ]
            par(leading: 0em, hide(text(size: 5pt)[aa]))
        }

    }
    set par(first-line-indent: 2em)
    
    counter(page).update(1)
    body
}


#let 正文结束(body) = {
    set heading(numbering: none)

    show heading: it => {
        set text(font: "SimHei")
        let loc = it.location()
        let num = counter(heading).at(loc)
        
        if it.level == 1 {
            pagebreak(weak: true)
            set text(size: 字号.小三)
            v(1em)
            block[
                #h(1fr)
                #it.body
                #h(1fr)
            ]
            par(leading: 0em, hide(text(size: 10pt)[aa]))
        } else {
            set text(size: 字号.四好)
            block[
                #it.body
            ]
            par(leading: 0em, hide(text(size: 5pt)[aa]))
        }

    }

    body
}

#let 附录(body) = {
    set heading(numbering: (..nums) => {
        if nums.pos().len() == 1 {
            numbering("附录A ", ..nums)
        } else {
            numbering("A. 1 ", ..nums)
        }
    })
    show heading: it => {
        set text(font: "SimHei")
        let loc = it.location()
        let num = counter(heading).at(loc)
        
        if it.level == 1 {
            pagebreak(weak: true)
            set text(size: 字号.小三)
            v(1em)
            block[
                #h(1fr)
                #numbering("附录A", ..num)
                #h(1em)
                #it.body
                #h(1fr)
            ]
            par(leading: 0em, hide(text(size: 10pt)[aa]))
        } else {
            set text(size: 字号.四号)
            block[
                #numbering("A.1", ..num)
                #it.body
            ]
            par(leading: 0em, hide(text(size: 5pt)[aa]))
        }

    }

    counter(heading).update(0)
    body
}

#let 论文(
    题目: 占位[如何用Typst排版论文],
    年级: 占位[2024],
    学号: 占位[123456],
    姓名: 占位[张三],
    专业: 占位[交通工程],
    指导教师: 占位[李四],
    发题日期: datetime.today(),
    完成日期: datetime.today(),
    目的意义: 占位[
        写论文是大学毕业的必要条件，有重要的的意义。使用有效的工具排版论文可以减少工作量，提高结果质量。传统的工具中，微软Word所见即所得、容易上手，但编辑论文这样的复杂文档时难以保证格式统一；LaTeX是学术论文写作的事实标准，但开发时间久远，易用性不好，安装、配置、定制都很繁琐。

        本研究探索一种新型排版工具Typst在本科论文排版中的潜力，为快速高质量排版本科论文提供技术支持。
    ],
    任务: 占位[
        本研究中学生应完成以下任务：
        - 阅读论文排版相关文献；
        - 尝试用Word排版论文；
        - 尝试用LaTeX排版论文；
        - 结合本文学习Typst排版，与前两个排版流程进行对比；
        - 总结Typst排版论文的优势和不足，为未来改进提供建议。
    ],
    达成度: 占位[
        通过本研究，学生实现以下专业培养目标：
        - 知识结构上了解排版的基本原理；
        - 能力结构上掌握结构化排版技能；
        - 素质结构上提升主动学习探索精神。
    ],
    时间分配: 占位[
        / 文献阅读: 阅读学术论文写作技巧、排版理论相关文献（3周）
        / Word排版试验: 用Word尝试排版两万字的学位论文。完整包括目录、章节、索引、引用等学术论文组成元素。（2周）
        / LaTeX排版试验: 用LaTeX排版同一内容，要求与上一条相同。（3周）
        / Typst排版试验: 用Typst排版同一内容，要求与上一条相同。（3周）
        / 撰写报告: 比较不同软件排版的体验，撰写报告。从安装难度、定制丰富性、排版效果等方面比较三种软件的优劣。（3周）
        / 评阅及答辩: 提交报告，准备答辩（2周）
    ],
    备注: 占位[
        无
    ],
    中文关键词: 占位[论文、排版、Typst],
    中文摘要: 占位[
        #lorem(100)
    ],
    英文关键词: 占位[Thesis, Typesetting],
    英文摘要: 占位[
        #lorem(100)
    ],
    body
) = {
    let 信息 = arguments(
        题目: 题目,
        年级: 年级,
        学号: 学号,
        姓名: 姓名,
        专业: 专业,
        指导教师: 指导教师,
        发题日期: 发题日期,
        完成日期: 完成日期,
        目的意义: 目的意义,
        任务: 任务,
        达成度: 达成度,
        时间分配: 时间分配,
        备注:备注,
        中文关键词: 中文关键词,
        中文摘要: 中文摘要,
        英文关键词: 英文关键词,
        英文摘要: 英文摘要
    )

    show: 全局样式

    扉页(
    ..信息
    )
    pagebreak(to: "odd")

    诚信声明()
    授权书()
    
    show: 添加页眉
    {
        set page(numbering: "第 I 页")
        counter(page).update(1)

        任务书(
        ..信息,
        )

        摘要(
            英文: false,
            关键词: 信息.named().中文关键词,
            信息.named().中文摘要
        )

        摘要(
            英文: true,
            关键词: 信息.named().英文关键词,
            信息.named().英文摘要
        )


        show outline.entry: it => {
            let font = 字体.宋体
            if it.level == 1 {
                font = 字体.黑体
            }
            set text(font: font)
            it.body
            h(1em)
            box(width: 1fr, it.fill)
            h(1em)
            link(it.element.location(), it.page)
            box(width: 0em, height: 1.5em) // Gutter
        }

        outline(
            title: [
                #set text(
                    font: 字体.黑体,
                    size: 字号.小二
                )
                #v(1em)
                #h(1fr)
                目#h(1em)录
                #h(1fr)
                #v(2em)
            ],
            depth: 3,
            indent: n => {
                if n < 2 {
                    0em
                } else {
                    2em * (n - 1)
                }
            }
        )
        pagebreak(weak: true)
    }

    show: 正文开始
    body
}

#show: 论文.with(
    题目: [如何用Typst排版论文],
    年级: [2024],
    学号: [123456],
    姓名: [张三],
    专业: [交通工程],
    指导教师: [李四],
    发题日期: datetime.today(),
    完成日期: datetime.today(),
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
        #lorem(100)
    ]
)

#page(header: none, footer: none)[] //FIXME: 自动插入空白页
= 绪论
#lorem(50)

== 背景
#lorem(50)
== 研究问题
== 计划

= 文献综述
== 国内
== 国外
= 方法

#lorem(50)

#lorem(50)
== 方法一
== 方法二
== 方法二
lakjdfl
= 实验
== 实验一
#lorem(50)
#lorem(50)
=== 数据
== 实验二
=== 数据
== 结果分析

#show: 正文结束
= 结论

= 致谢

#bibliography("reference.bib", style: "gb-7714-2005-numeric")

#show: 附录

= 英文翻译
== 翻译一
== 翻译二
= 公式推导
== 公式一
== 公式二