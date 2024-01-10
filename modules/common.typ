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

// 全局样式
#let 全局样式(rest) = {
  set page(paper:"a4", margin: (
      x: 2.6cm, y:2.7cm
  ))
  set text(font: 字体.宋体, size: 字号.小四, lang: "zh")
  set par(justify: true, linebreaks: "optimized")
  set underline(offset: 2pt, extent: 1pt)

  rest
}