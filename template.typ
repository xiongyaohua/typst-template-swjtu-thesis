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
        
        box[
            #set align(left)
            年#box(width: 2em)级：#enroll_year 级\ 
            学#box(width: 2em)号：#enroll_number\ 
            姓#box(width: 2em)名：#author\ 
            指导老师：#supervisor
        ]
    }

    {
        set text(font: 仿宋体, size: 小四)
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
        v(1em)
    }

    [
        #set text(font: 仿宋体, size: 四号)
        #set par(leading: 1.5em)
        本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。

        #v(4cm)

        #h(1fr)
        #box[
            #set align(left)
            作者签名：#box(width:5cm)\
            \
            日期：#box(width: 2cm)年#box(width: 1cm)月#box(width: 1cm)日
        ]
    ]

    pagebreak()
}

#let permission() = {
    {
        set align(center)
        set text(font: 黑体, size: 小二, weight: "bold")
        [西南交通大学\ 本科毕业设计（论文）版权使用授权书]
        v(1em)
    }

    set text(font: 仿宋体, size: 四号)
    set par(leading: 1.5em)
    [
        本毕业设计（论文）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权西南交通大学可以将本毕业设计（论文）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业设计（论文）。
    ]

    v(1em)

    let confidential = grid(columns: 2, column-gutter: 2em, row-gutter: 1em,
            [], [保密□，在#box(width: 1cm)年解密后适用本授权书。],
            [本论文属于], [],
            [], [不保密□。]
        )
    stack(
        dir:ltr, spacing: 1fr,
        [],
        confidential,
        [],
    )
    v(3cm)

    let sign = box(width: 1fr, repeat([.]))
    grid(columns: (50%, 50%), row-gutter: 3em, column-gutter: 2em,
        [作者签名：\ \ #sign], [指导教师签名：\ \ #sign],
        [日期：#sign], [日期：#sign]
    )

    pagebreak()
}

#let assignment(
    班级: none,
    学生: none,
    学号: none,
    发题日期: none,
    完成日期: none,
    题目: none,
    目的意义: none,
    任务: none,
    达成度: none,
    时间分配: none,
    备注: none
) = {
    {
        set align(center)
        set text(font: 黑体, size: 小二, weight: "bold")
        [毕业设计（论文）任务书]
        v(1em)
    }

    set text(font: 仿宋体, size: 小四)
    set par(leading: 1.5em)

    set underline(offset: 2pt, evade: true)
    stack(dir: ltr, spacing: 1fr,
        [班#box(width: 2em)级：#underline(班级)],
        [学生姓名：#underline(学生)],
        [学#box(width: 2em)号：#underline(学号)]
    )

    stack(dir:ltr, spacing: 1fr,
        [发题日期：#发题日期],
        [完成日期：#完成日期]
    )
    [题目：#underline(题目) #parbreak() ]

    [
        #strong[1、本设计（论文）的目的、意义：]#underline(目的意义)

        #strong[2、学生应完成的任务：]#underline(任务)
        
        #strong[3、本设计（论文）与本专业的毕业要求达成度如何？（如在知识结构、能力结构、素质结构等方面有哪些有效的训练。）：]#underline(达成度)
        
        #strong[4、本设计（论文）各部分内容及时间分配（共  17  周）：]#underline(时间分配)
    ]

    v(2em)
    [
        #strong[备注：]#underline(备注)
    ]
    v(1.5cm)
    [
        指导教师：#box(width:4cm, repeat([.]))
        #box(width: 2cm)
        #box(width:2cm, repeat([.]))年
        #box(width:1cm, repeat([.]))月
        #box(width:1cm, repeat([.]))日
    ]
    pagebreak()
}

#let abstract(
    english: false,
    keywords: none,
    body: none
) = {
    let title = "摘要"
    let keyword = "关键词："

    if english {
        title = "Abstract"
        keyword = "Keywords:"
    }

    {
        set align(center)
        set text(font: 黑体, size: 小二, weight: "bold")
        [#title]
        v(1em)
    }
    
    set text(font: 仿宋体, size: 四号)
    [#text(font: 黑体,keyword)#keywords]
    pagebreak()
}

#let thesis(
    title: "此处为论文题目",
    author: "张三",
    enroll_year: 1800,
    enroll_number: 1800123456,
    subject: "交通工程",
    supervisor: "李四",
    任务书: none,
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
    permission()

    set page(header: [
            #set text(font: 黑体, size: 小四)
            #set align(center)

            西南交通大学本科毕业设计（论文）
            #block(height: -0.3cm,line(length: 100%))
        ],
        header-ascent: 0.7cm,
        numbering: "I"
    )
    counter(page).update(1)

    // 任务书
    assignment(..任务书)
    // 中文摘要
    abstract()
    // 英文摘要
    abstract(english: true)
    // 目录
    outline(title: [目录])

    pagebreak()
    // 正文从奇数页开始
    body    
}


#let 任务书 = (
    班级: [2000级交通工程],
    学生: [张三],
    学号: [200012345],
    发题日期: [2000年3月5日],
    完成日期: [2001年4月6日],
    题目: [这是一篇论文题目],
    目的意义: [
        #lorem(100)

        阿萨德发卡觉得浪费空间阿萨德立法局
    ],
    任务: [#lorem(100)],
    达成度: [#lorem(100)],
    时间分配: [
        - aaa
        - bbb
        - ccc
    ],
    备注: [我也不知道我在说啥]
)

#show: thesis.with(任务书: 任务书)

= 绪论

= 文献综述

= 模型设计

= 结果分析

= 结论