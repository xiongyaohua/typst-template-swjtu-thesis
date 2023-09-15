#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let 字体 = (
  仿宋: ("Times New Roman", "FangSong"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)

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

// 全局样式
#set page(paper:"a4", margin: (
    x: 2.6cm, y:2.7cm
))
#set text(font: 字体.宋体, size: 字号.小四)
#set par(leading: 1em, first-line-indent: 2em, justify: true)
#set underline(offset: 2pt, extent: 1pt)

// 附页
#let 扉页(
    题目: "",
    年级: 2016,
    学号: 123456,
    姓名: "熊耀华",
    专业: "交通工程",
    指导教师: "熊耀华",
    发题日期: datetime.today(),
    完成日期: datetime.today()
) = {
    set align(center)
    [
        #v(1cm)
        #text(font: 字体.黑体, size: 字号.小二)[
            西#h(0.5em)南#h(0.5em)交#h(0.5em)通#h(0.5em)大#h(0.5em)学\ 
            本科毕业设计（论文）
        ]

        #v(2cm)
        #text(font: 字体.黑体, size: 字号.二号)[
            #题目
        ]

        #v(4cm)

        #text(font: 字体.黑体, size: 字号.小四)[
            #box[
                #set align(left)
                #grid(columns: 2, row-gutter: 0.5em,
                column-gutter: 1em,
                    [年#h(2em)级：], [#str(年级)],
                    [学#h(2em)号：], [#str(学号)],
                    [姓#h(2em)名：], [#str(姓名)],
                    [专#h(2em)业：], [#str(专业)],
                    [指导教师：], [#str(指导教师)],
            )
            ]
        ]
        
        #v(1fr)
        #text(font: 字体.宋体, size: 字号.小四)[
            #完成日期.display("[year] 年 [month] 月")
        ]
        #v(2cm)
    ]
    pagebreak(weak: true)
}

#let 诚信声明() = {
    [
        #set align(center)
        #v(1cm)
        #text(font: 字体.黑体, size: 字号.小二, weight: "bold")[
            西南交通大学\ 
            本科毕业设计（论文）学术诚信声明
        ]
        #v(1cm)

        #set align(left)
        #set text(font: 字体.宋体, size: 字号.四号)
        #par(leading: 1.5em)[本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。]

        #v(4cm)
        #set align(right)
        #box(width:10cm)[
            作者签名：#h(1fr)
            #v(1cm)
            #box(width: 70%, repeat([.]))#h(1fr)
            #v(0.5cm)
            日期：#h(1fr)年#h(1.2cm)月#h(1.2cm)日#h(2cm)
        ]
    ]
    pagebreak(weak: true)
}

#let 授权书() = {
    [
        #set align(center)
        #v(1cm)
        #text(font: 字体.黑体, size: 字号.小二, weight: "bold")[
            西南交通大学\ 
            本科毕业设计（论文）版权使用授权书
        ]
        #v(1cm)

        #set align(left)
        #set text(font: 字体.宋体, size: 字号.四号)
        #par(leading: 1.5em)[本毕业设计（论文）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权西南交通大学可以将本毕业设计（论文）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业设计（论文）。]
        
        #set align(center)
        #box[
            #set align(left)
            #grid(columns: 2, row-gutter: 1.5em, column-gutter: 2em,
                [], [保密#sym.ballot，在年解密后适用本授权书。],
                [本论文属于], [],
                [], [不保密#sym.ballot]
            )
        ]

        #v(5cm)
        #set align(right)
        #box(width:7cm)[
            作者签名：#h(1fr)
            #v(1cm)
            #repeat([.])
            日期：#h(1fr)年#h(1cm)月#h(1cm)日
        ]
        #h(1fr)
        #box(width:7cm)[
            作者签名：#h(1fr)
            #v(1cm)
            #repeat([.])
            日期：#h(1fr)年#h(1cm)月#h(1cm)日
        ]
    ]
    pagebreak(weak: true)
}

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

#let show_任务书(
    题目: "如何用 typst 排版论文",
    年级: 2023,
    学号: 202312345,
    姓名: "张三",
    专业: "交通工程",
    指导教师: "李四",
    发题日期: (2022, 6, 1),
    完成日期: (2023, 6, 1),
    目的意义: none,
    任务: none,
    达成度: none,
    时间分配: none,
    备注: none
) = {
        [
            #set align(center)
            #text(font: 字体.黑体, size: 字号.三号, weight: "bold")[
                毕业设计（论文）任务书
            ]
            #v(1cm)
            #set text(size: 字号.小四)

            班#h(2em)级：#underline(专业)
            #h(1fr)
            学生姓名：#underline(姓名)
            #h(1fr)
            学#h(2em)号：#underline([#学号])

            发题日期：#发题日期.display("[year] 年 [month] 月 [day] 日")
            #h(1fr)
            完成日期：#完成日期.display("[year] 年 [month] 月 [day] 日")

            题#h(2em)目：#underline[#题目]#h(1fr)

            #set align(left)
            1. 本设计（论文）的目的、意义：
            #underline([#h(2em)#目的意义])

            2. 学生应完成的任务：\
            #underline([#h(2em)#任务])

            3. 本设计（论文）与本专业的毕业要求达成度如何？（如在知识结构、能力结构、素质结构等方面有哪些有效的训练。）：\
            #underline([#h(2em)#达成度])

            4. 本设计（论文）各部分内容及时间分配（共  17  周）：\
            #{[
                #set par(first-line-indent: 0pt)
                #set terms(indent: 2em, separator: [：])
                #show terms.item: item => {
                    h(2em)
                    item.term
                    [：]
                    underline(item.description)
                    parbreak()
                }
                #时间分配
            ]}
            
            #v(1cm)
            备#h(2em)注：#underline(备注)

            #v(0.5cm)
            #par(first-line-indent: 0em)[
                指导教师：#box(width:4cm, repeat([.]))
                #h(3cm)年
                #h(1cm)月
                #h(1cm)日
            ]

        ]

    pagebreak(weak: true)
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
    outline(
        title: [
            #set text(font: 字体.黑体, size: 字号.小三)
            #h(1fr)
            目#h(1em)录
            #h(1fr)
        ],
        depth: 3
    )
    pagebreak(weak: true)
    
    set page(numbering: "第 1 页")
    counter(page).update(1)

    set heading(numbering: "1.1")
    
    show heading.where(level: 1): it => {
        locate(loc => {
            let idx = counter(heading).at(loc)
            
            // 否则第一章和目录之间多出一个空白页，为什么？
            if idx.at(0) != 1{
                pagebreak(weak: true)
            }

            let number =if in_mainbody(loc) {
                numbering("第 1 章", idx.at(0))
                h(0.5em)
            } else {
                []
            }

            align(center, text(
                font: 字体.黑体, size: 字号.小三,
                [#v(1em) #number #it.body #v(2em)]
            ))

            let state = (
                number: number,
                body: it.body,
                page: loc.page(),
                level: it.level
            )
        })
    }
    show heading.where(level: 2): it => {
        locate(loc => {
            set par(first-line-indent: 0em)
            let idx = counter(heading).at(loc)
            //pagebreak(weak: true)
            let number = numbering(it.numbering, ..idx)
            let number = [#number#h(0.5em)]
            align(left, text(
                font: 字体.黑体, size: 字号.四号,
                [#v(1em) #number #it.body #v(2em)]
            ))

            let state = (
                number: number,
                body: it.body,
                page: loc.page(),
                level: it.level
            )
        })
    }
    show heading.where(level: 3): it => {
        locate(loc => {
            set par(first-line-indent: 0em)
            let idx = counter(heading).at(loc)
            //pagebreak(weak: true)
            let number = numbering(it.numbering, ..idx)
            let number = [#number#h(0.5em)]
            align(left, text(
                font: 字体.黑体, size: 字号.小四,
                [#v(1em) #number #it.body #v(2em)]
            ))

            let state = (
                number: number,
                body: it.body,
                page: loc.page(),
                level: it.level
            )
        })
    }

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
=== 可持续发展思想的形成
#lorem(30)
=== 可持续发展的内包含
#lorem(30)

= 结论

= 致谢

= 参考文献

= 附录
