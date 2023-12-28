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

#let 论文(..信息, body) = {
    show: 全局样式

    扉页(
    ..信息
    )

    pagebreak(to: "odd")

    诚信声明()
    授权书()
    
    添加页眉({
        set page(numbering: "第 I 页")
        counter(page).update(1)

        任务书(
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
            / 第一部分: 绪论（3周）
            / 第二部分: 文献综述（3周）
            / 第三部分: 方法（3周）
            / 第四部分: 实验（3周）
            / 第五部分: 结论（3周）
            / 评阅及答辩: 答辩（2周）
        ],
        备注:[
            无
        ]
        )

        摘要(
        英文: false,
        关键词: [论文、排版]
        )[
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
        ]

        pagebreak()

        摘要(
        英文: true,
        关键词: [Thesis, Typesetting]
        )[
        This thesis studies how to typeset thesis in Typst. #lorem(30)

        #lorem(40)

        #lorem(50)
        ]

        pagebreak()
        
        outline(
            title: [
                aaa
                #emph([aaa])
            ]
        )
    })

    pagebreak(to: "odd",)

    show: 添加页眉
    set page(numbering: "第 1 页")
    counter(page).update(1)
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
  完成日期: datetime.today()
)

= 绪论
== 背景
== 研究问题
== 计划

= 文献综述
== 国内
== 国外
= 方法
== 方法一
== 方法二
== 方法二

= 实验
== 实验一
=== 数据
== 实验二
=== 数据
== 结果分析
= 结论

= 致谢

#bibliography("reference.bib", style: "gb-7714-2005-numeric")

= 附录
