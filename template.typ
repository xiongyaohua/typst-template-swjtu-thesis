#import "modules/common.typ": 占位, 示例
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
    
    set par(first-line-indent: 2em, leading: 1em)
    show strong: set text(font: 字体.黑体)
    show emph: set text(font: 字体.楷体)
    set list(indent: 2em, tight: false)
    set enum(indent: 2em, tight: false)

    counter(page).update(1)
    body
}


#let 正文结束(body) = {
    set heading(numbering: none)

    body
}

#let 附录(body) = {
    set heading(numbering: (..nums) => {
        if nums.pos().len() == 1 {
            numbering("附录 A ", ..nums)
        } else {
            numbering("A. 1 ", ..nums)
        }
    })
    
    counter(heading).update(0)
    set math.equation(numbering: num => {
        locate(loc => {
        let chapter = counter(heading).at(loc).at(0)
        [(]
        numbering("A", chapter)
        [--]
        [#num)]

        })
    })
    set figure(numbering: num => {
        locate(loc => {
            let chapter = counter(heading).at(loc).at(0)
            numbering("A", chapter)
            [--]
            [#num]
        })
    })
    body
}

#let 论文(
    题目: 占位[XXXXXXXXXXXX],
    年级: 占位[XXXX],
    学号: 占位[XXXXXX],
    姓名: 占位[XXX],
    专业: 占位[XXXX],
    指导教师: 占位[XXX],
    发题日期: auto,
    完成日期: auto,
    目的意义: 占位[
        #lorem(100)
    ],
    任务: 占位[
        #lorem(100)
    ],
    达成度: 占位[
        #lorem(100)
    ],
    时间分配: 占位[
        #lorem(100)
    ],
    备注: 占位[
        #lorem(100)
    ],
    中文关键词: 占位[XXX, XXX],
    中文摘要: 占位[
        #lorem(100)
    ],
    英文关键词: 占位[XXX, XXX],
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
            box(width: 0em, height: 1.4em) // Gutter
        }

        outline(
            title: [目#h(1em)录],
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
