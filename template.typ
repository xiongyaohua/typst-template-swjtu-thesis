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

#let 论文(..信息, body) = {
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

#show: 论文.with(
    题目: [如何用Typst写论文],
    年级: [2016],
    学号: [123456],
    姓名: [张三],
    专业: [交通工程],
    指导教师: [李四],
    发题日期: datetime.today(),
    完成日期: datetime.today(),
    目的意义: [
        减少论文排版工作量，提高格式统一度。
    ],
    任务: [
        对照本文档的Typst源代码和最终pdf输出，通过比较学习如何用Typst排版论文。
    ],
    达成度: [
        培养学习能力。
    ],
    时间分配: [
        / 第一部分: 绪论（3周）
        / 第二部分: 文献综述（3周）
        / 第三部分: 方法（3周）
        / 第四部分: 实验（3周）
        / 第五部分: 结论（3周）
        / 评阅及答辩: 答辩（2周）
    ],
    备注:[
        无
    ],
    中文关键词: [论文、排版],
    中文摘要: [
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
        本文的研究内容是如何用Typst排版论文。
    ],
    英文关键词: [Thesis, Typesetting],
    英文摘要: [
        This thesis studies how to typeset thesis in Typst. #lorem(30)

        #lorem(40)

        #lorem(50)
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