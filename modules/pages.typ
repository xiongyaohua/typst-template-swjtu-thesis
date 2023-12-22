#import "common.typ": 字号, 字体, 全局样式

// 附页
#let 扉页(..信息) = {
  let 信息 = 信息.named()
  set align(center)

  [
    #v(1cm)
    #text(font: 字体.黑体, size: 字号.小二)[
        西#h(0.5em)南#h(0.5em)交#h(0.5em)通#h(0.5em)大#h(0.5em)学\ 
        本科毕业设计（论文）
    ]

    #v(2cm)
    #text(font: 字体.黑体, size: 字号.二号)[
        #信息.题目
    ]

    #v(4cm)

    #text(font: 字体.黑体, size: 字号.小四)[
      #box[
        #set align(left)
        #grid(columns: 2, row-gutter: 0.5em,
        column-gutter: 1em,
          [年#h(2em)级：], [#信息.年级],
          [学#h(2em)号：], [#信息.学号],
          [姓#h(2em)名：], [#信息.姓名],
          [专#h(2em)业：], [#信息.专业],
          [指导教师：], [#信息.指导教师],
      )
      ]
    ]
    
    #v(1fr)
    #text(font: 字体.宋体, size: 字号.小四)[
        #信息.完成日期.display("[year] 年 [month] 月")
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
    #par(leading: 1.5em)[#h(2em)本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。]

    #v(4cm)
    #set align(right)
    #box(width:10cm)[
      作者签名：#h(1fr)
      #v(1cm)
      #repeat[.]
      #v(0.5cm)
      日期：#h(2.5cm)年#h(1.5cm)月#h(1.5cm)日
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
        #par(leading: 1.5em)[#h(2em)本毕业设计（论文）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权西南交通大学可以将本毕业设计（论文）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业设计（论文）。]
        
        #box[
            #grid(
              columns: 2,
              row-gutter: 1.5em, column-gutter: 2em,
                [#h(2em)本论文属于:#hide(sym.ballot)],
                [不保密 #sym.ballot],
                [],
                [保密 #sym.ballot，在#box(width: 2em, repeat[.])年解密后适用本授权书。]
            )
        ]

        #v(5cm)
    #set align(right)
    #box(width:10cm)[
      作者签名：#h(1fr)
      #v(1cm)
      #repeat[.]
      #v(0.5cm)
      日期：#h(2.5cm)年#h(1.5cm)月#h(1.5cm)日
    ]
    ]
    pagebreak(weak: true)
}

#let 任务书(..信息) = {
  let 信息 = 信息.named()
  [
    #set align(center)
    #text(font: 字体.黑体, size: 字号.三号, weight: "bold")[
        毕业设计（论文）任务书
    ]
    #v(1cm)
    #set text(size: 字号.小四)

    班#h(2em)级：#underline(信息.专业)
    #h(1fr)
    学生姓名：#underline(信息.姓名)
    #h(1fr)
    学#h(2em)号：#underline(信息.学号)

    发题日期：#underline(信息.发题日期.display("[year] 年 [month] 月 [day] 日"))
    #h(1fr)
    完成日期：#underline(信息.完成日期.display("[year] 年 [month] 月 [day] 日"))

    题#h(2em)目：#underline[#信息.题目]#h(1fr)

    #set align(left)
    1. 本设计（论文）的目的、意义：
    #underline([#h(2em)#信息.目的意义])

    2. 学生应完成的任务：\
    #underline([#h(2em)#信息.任务])

    3. 本设计（论文）与本专业的毕业要求达成度如何？（如在知识结构、能力结构、素质结构等方面有哪些有效的训练。）：\
    #underline([#h(2em)#信息.达成度])

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
        #信息.时间分配
    ]}
    
    #v(1cm)
    备#h(2em)注：#underline(信息.备注)

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

// 测试
#show: 全局样式
#let 信息 = arguments(
  题目: [如何用Typst写论文],
  年级: [2016],
  学号: [123456],
  姓名: [张三],
  专业: [交通工程],
  指导教师: [李四],
  发题日期: datetime.today(),
  完成日期: datetime.today()
)

#扉页(
  ..信息
)
#诚信声明()
#授权书()
#任务书(
  ..信息,
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
    - 第一周
    - 第二周
    - 第三周
  ],
  备注:[
    无
  ]
)
