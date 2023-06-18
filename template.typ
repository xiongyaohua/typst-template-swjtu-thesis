// 字体
#let 黑体 = "Noto Sans CJK SC"
#let 仿宋体 = "Noto Serif CJK SC"
// 字号
#let 二号 = 22pt
#let 小二 = 18pt
#let 小三 = 15pt
#let 四号 = 14pt
#let 小四 = 12pt

#let cover(
    title,
    author,
    enroll_year,
    enroll_number,
    subject,
    supervisor
) = {
    set align(center)
    set text(font: 黑体)
    {
        set text(size: 小二)
        v(2cm)
        [
            西 南 交 通 大 学\ 
            本科毕业设计（论文）
        ]

    }

    {
        v(2cm)
        [
            #set text(size: 二号, weight: "bold")
            #title
        ]

    }

    {
        v(4cm)
        set text(size: 小四)
        
        let empty = hide([字])
        
        // '/**/'用于在parse中打断'empty'和后面的汉字。此处不能用空格，否则排版后的文档中会多一个额外的空格。
        box[
            #set align(left)
            年#empty#empty/**/级：#enroll_year 级\ 
            学#empty#empty/**/号：#enroll_number\ 
            姓#empty#empty/**/名：#author\ 
            指导老师：#supervisor
        ]
    }

    {
        set text(font: 仿宋体)
        v(8cm)
        [2023年5月]
    }
    pagebreak()
    pagebreak()
}

#let integrity() = {
    {
        set align(center)
        set text(font: 黑体, size: 小二, weight: "bold")
        [西南交通大学\ 本科毕业设计（论文）学术诚信声明]
    }

    set text(font: 仿宋体, size: 四号)
    [
        本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
    ]
}

#let thesis(
    title: "此处为论文题目",
    author: "张三",
    enroll_year: 1800,
    enroll_number: 1800123456,
    subject: "交通工程",
    supervisor: "李四",
    body
) = {
    // 基本设置
    set page(
        paper: "a4",
        margin: (
            top: 2.6cm,
            bottom: 2.6cm,
            left: 2.7cm,
            right: 2.7cm
        )
    )
    set text(font: "仿宋体", size: 四号)
    set par(leading: 1em, justify: true, first-line-indent: 2em)

    // 封面
    cover(
        title,
        author,
        enroll_year,
        enroll_number,
        subject,
        supervisor,
    )
    // 诚信声明
    integrity()
    // 授权书
    // 任务书
    // 中文摘要
    // 英文摘要
    // 目录

    // 正文从奇数页开始
    body    
}


#show: thesis.with()

== test