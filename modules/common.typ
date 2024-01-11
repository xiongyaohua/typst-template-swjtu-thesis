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
  宋体: ("Times New Roman", "NSimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)

#let 占位(body) = {
  set text(fill: red)
  body
}

#let 格式化日期(p_datetime, format) = {
  if type(p_datetime) == datetime {
    set text(font: 字体.宋体, size: 字号.小四)

    p_datetime.display(format)
  } else {
    set text(font: 字体.宋体, size: 字号.小四, fill: red)

    datetime.today().display(format)
  }
}

#let 示例(code) = {
    set heading(outlined: false, numbering: none)
    show heading: it => {
      set text(font: 字体.黑体)
      block[
        #it.body
      ]
    }
    show figure: set block(breakable: false)
    //show table: set block(breakable: true)
    figure(table(
        columns: (1fr,1fr), align: left,
        [#h(1fr)源码#h(1fr)], [#h(1fr)排版结果#h(1fr)],
        box(fill: luma(230), width: 100%, inset:5pt, raw(code, lang: "typ")),
        eval(code)
    ))
    par(leading: 0em, hide(text(size: 0pt)[xx])) // 保证下一段提行
}

// 全局样式
#let 全局样式(rest) = {
  set page(paper:"a4", margin: (
      x: 2.6cm, y:2.7cm
  ))
  set text(font: 字体.宋体, size: 字号.小四, lang: "zh")
  set par(justify: true, linebreaks: "optimized")
  set underline(offset: 2pt, extent: 1pt)
  set math.equation(numbering: num => {
    locate(loc => {
      let chapter = counter(heading).at(loc).at(0)
      [(#chapter]
      [--]
      [#num)]

    })
  })

  set figure(numbering: num => {
    locate(loc => {
      let chapter = counter(heading).at(loc).at(0)
      [#chapter]
      [--]
      [#num]

    })
  })
  show figure.where(kind: table): set figure.caption(position: top)
  show figure: set figure.caption(position: bottom)
  show figure: it => {
    it
    par(leading: 0em, hide(text(size: 0pt)[xx])) // 保证下一段提行
  }

  show heading.where(level: 1): set text(size: 字号.小二)
  show heading.where(level: 1): set align(center)

  show heading.where(level: 2): set text(size: 字号.小三)
  show heading.where(level: 3): set text(size: 字号.四号)
  
  show heading: set text(font: 字体.黑体, size: 字号.小四)
  
  show heading.where(level: 1): it => {
    pagebreak()
    counter(math.equation).update(0)
    it
    par(leading: 0em, hide(text(size: 0pt)[xx])) // 保证下一段提行
  }
  show heading: it => {
    it
    par(leading: 0em, hide(text(size: 0pt)[xx])) // 保证下一段提行
  }
  
  show heading.where(level: 1): set block(inset: (top: 1.5em, bottom: 1em))
  show heading: set block(inset: (top: 0.5em, bottom: 0.5em))
  //show raw: box.with(fill: luma(200), outset: 1pt, inset: 1pt)
  show raw.where(block: false): box.with(fill: luma(200), outset: 1pt, inset: 2pt)
  rest
}
