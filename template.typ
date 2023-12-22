// 状态
#let state_任务书 = state("任务书", 
    (
        目的意义: none,
        任务: none,
        达成度: none,
        时间分配: none,
        备注: none
    )
)
#let state_中文摘要 = state("中文摘要",
    (
        内容: none,
        关键词: none,
    )
)

#let state_英文摘要 = state("英文摘要",
    (
        内容: none,
        关键词: none,
    )
)



#let 任务书(
    目的意义: none,
    任务: none,
    达成度: none,
    时间分配: none,
    备注: none
) = {
    let state = (
        目的意义: 目的意义,
        任务: 任务,
        达成度: 达成度,
        时间分配: 时间分配,
        备注: 备注
    )
    
    state_任务书.update(state)
}


#let 中文摘要(
    关键词: none,
    内容: none
) = {
    let state = (
        关键词: 关键词,
        内容: 内容
    )

    state_中文摘要.update(state)
}

#let 英文摘要(
    关键词: none,
    内容: none
) = {
    let state = (
        关键词: 关键词,
        内容: 内容
    )

    state_英文摘要.update(state)
}

#let show_摘要(关键词: none, 英文: false, 内容: none) = {
    [
        #let title = if 英文 {
            [Abstract]
        } else {
            [摘#h(3em)要]
        }
        
        #let keywords = if 英文 {
            [Key words:]
        } else {
            [关键词：]
        }

        #set align(center)
        #text(font: 字体.黑体, size: 字号.小二, weight: "bold")[#title]
        #v(1em)
        
        #set align(left)
        #set text(font: 字体.宋体, size: 字号.五号)
        #内容
        #v(1cm)
        #text(font: 字体.黑体)[#keywords]#关键词
    ]
    pagebreak(weak: true)
}

// 论文格式
#let 论文(
    题目: "",
    年级: 2016,
    学号: 123456,
    姓名: "熊耀华",
    专业: "交通工程",
    指导教师: "熊耀华",
    发题日期: datetime.today(),
    完成日期: datetime.today(),
    正文
) = {
    扉页(
        题目: 题目,
        年级: 年级,
        学号: 学号,
        姓名: 姓名,
        专业: 专业,
        指导教师: 指导教师,
        发题日期: 发题日期,
        完成日期: 完成日期,
    )
    诚信声明()
    授权书()

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

    set page(numbering: "第 I 页")
    counter(page).update(1)
    locate(loc => {
        let state = state_任务书.final(loc)
        show_任务书(
            题目: 题目,
            年级: 年级,
            学号: 学号,
            姓名: 姓名,
            专业: 专业,
            指导教师: 指导教师,
            发题日期: 发题日期,
            完成日期: 完成日期,
            ..state
        )

        let state = state_中文摘要.final(loc)
        show_摘要(
            英文: false,
            ..state
        )

        let state = state_英文摘要.final(loc)
        show_摘要(
            英文: true,
            ..state
        )
    })


    // 判断是否还在正文
    let in_mainbody(loc) = {
        // "结论"之后不属于正文
        let headings = query(heading.where(level: 1).before(loc), loc)
        let headings = headings.map(heading => heading.body)
        [结论] not in headings
    }

    // 生成目录
    show outline.entry: it => {
        let font = 字体.宋体
        if it.level == 1 { font = 字体.黑体 }
        set text(font: font)
        it.body
        box(width: 1fr)[#it.fill]
        it.page
    }
    outline(
        target: heading,
        title: [
            #set text(font: 字体.黑体, size: 字号.小三)
            #h(1fr)
            目#h(1em)录
            #h(1fr)
            #v(1cm)
        ],
        depth: 3,
        indent: n => calc.max(n - 1, 0)*2em
    )
    pagebreak(weak: true)
    
    set page(numbering: "1", footer: [
        #h(1fr)
        #counter(page).display("第 1 页")
        #h(1fr)
    ])
    counter(page).update(1)

    let custom_numbering = (..nums) => {
        if(nums.pos().len() == 1) [
            #numbering("第一章", nums.pos().at(0))#h(0.3em)
        ] else [
            #nums.pos().map(str).join(".")#h(0.3em)
        ]
    }

    set heading(numbering: custom_numbering)

    show heading: it => {
        locate(loc => {
            let idx = counter(heading).at(loc)
            
            if it.level == 1 and idx.at(0) > 1 {
                pagebreak(weak: true)
            }

            if it.level == 1 [
                #set text(font: 字体.黑体, size: 字号.小三)
                #h(1fr)
                #if it.outlined [
                    #numbering(custom_numbering, ..idx)
                ]
                #it.body
                #h(1fr)
                #v(1cm)
                #parbreak()
            ] else if it.level == 2 [
                #set text(font: 字体.黑体, size: 字号.四号)
                #set par(first-line-indent: 0em)
                #v(0.5em)
                #numbering(custom_numbering, ..idx) #it.body#h(1fr)
                #v(0.5em)
                #parbreak()
            ] else [
                #set text(font: 字体.黑体, size: 字号.小四)
                #set par(first-line-indent: 0em)
                #v(0.5em)
                #numbering(custom_numbering, ..idx) #it.body#h(1fr)
                #v(0.5em)
                #parbreak()
            ]
        })
    }
    set math.equation(numbering: "1.")

    正文
}

////////////////////////////////////

#show: 论文.with(
    题目: "如何用 Typst 写论文",
    年级: 2016,
    学号: 123456,
    姓名: "熊耀华",
    专业: "交通工程",
    指导教师: "熊耀华",
    发题日期: datetime.today(),
    完成日期: datetime.today(),
)

#任务书(
    目的意义: [
        #lorem(30)

        #lorem(30)
    ],
    任务: [#lorem(50)],
    达成度: [
        #lorem(20)

        #lorem(30)
    ],
    时间分配: [
        / 第一部分: #lorem(20)（3周）
        / 第二部分: #lorem(20)（3周）
        / 第三部分: #lorem(20)（3周）
        / 第四部分: #lorem(20)（3周）
        / 第五部分: #lorem(20)（3周）
        / 评阅及答辩: #lorem(20)（3周）
    ],
    备注: [#lorem(50)]
)

#中文摘要(
    关键词: [asdf, adf, asdj],
    内容: [
        #lorem(50)
        
        #lorem(30)
        
        #lorem(30)
    ]
)

#英文摘要(
    关键词: [asdf, adf, asdj],
    内容: [
        #lorem(50)
        
        #lorem(30)
        
        #lorem(30)
    ]
)

= 绪论
#lorem(30)
== 问题的提出
#lorem(30)
== 国内外研究现状
#lorem(30)

= 可持续发展的城市交通
#lorem(30)
== 可持续发展
#lorem(30)
- 第一
- 第二
- 第三

测试一下编号队列
+ 第一
+ 第二
+ 第三

#figure(
    rect(width:5cm, height: 4cm)[a,b,c,d],
    caption: [这是一张图]
)

测试一下表格

#figure(
    table(columns:4,
    [姓名], [年龄], [职业], [收入],
    [张三], [35], [小偷], [4000元]
    ),
    caption: [这是一张表]
) <工资表>

这是一个公式
$ integral_a^b sin(x) \dx $ <积分公式>
=== 可持续发展思想的形成
#lorem(30)
=== 可持续发展的内包含
#lorem(30)

@积分公式 告诉我们如何计算面积。@工资表 包含所有人的工资，是
一片空白。 #lorem(20)

这是一个引用@gu2012lao，这是另外一个引用@chen2001hao。
接下来是一堆引用 @liuxf2006, @wang1999sanwei。

#lorem(30)

= 结论

#heading(outlined: false)[致谢]

#heading(outlined: false)[参考文献]
#bibliography("reference.bib", style: "gb-7114-2015-numeric", title: none)

#heading(outlined: false)[附录]
