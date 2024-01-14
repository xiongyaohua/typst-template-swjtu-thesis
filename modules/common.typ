#let 附录开始 = state("附录开始", false)

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
    show raw.where(block: true): it => {
      set block(width: 100%)
      it
    }
    show figure: set block(breakable: false)
    //show table: set block(breakable: true)
    figure(numbering: none, table(
        columns: (1fr,1fr), align: left,
        [#h(1fr)源码#h(1fr)], [#h(1fr)排版结果#h(1fr)],
        box(width: 100%, raw(code, lang: "typ", block: true)),
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
    set heading(supplement: none)
    
    show strong: set text(font: 字体.黑体)
    show emph: set text(font: 字体.楷体)
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
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
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
    show raw.where(block: false): it => {
        set text(font: "Noto Sans Mono CJK SC")
        box(
            fill: luma(200),
            outset: 1pt, 
            inset: 2pt,
            radius: 2pt,
            baseline: 1pt,
            it.text
        )
    }
    show raw.where(block: true): it => {
        set text(font: "Noto Sans Mono CJK SC")
        set block(fill: luma(230), width: 90%, radius: 3pt, inset:5pt)
        set align(center)
        it
    }


    show ref: it => {
        let el = it.element
        if el != none and el.func() == heading {
            it
            if el.level == 1 []
            else if el.level == 2 [节]
            else [小节]
        } else if el != none and el.func() == figure {
            let fig_counter = el.caption.counter
            let supplement = el.caption.supplement
            
            let chapter = counter(heading).at(el.location()).at(0)
            let fig_num = fig_counter.at(el.location()).at(0)

            let f = if 附录开始.at(el.location()) { "A" } else { "1"}            

            link(el.location(), {
                supplement
                numbering(f, chapter)
                [--]
                numbering("1", fig_num)
            })
        } else if el != none and el.func() == math.equation {
            let eq_counter = counter(math.equation)
            let supplement = el.supplement
            
            let chapter = counter(heading).at(el.location()).at(0)
            let eq_num = eq_counter.at(el.location()).at(0)
            
            let f = if 附录开始.at(el.location()) { "A" } else { "1"}            
            
            link(el.location(), {
                supplement
                [ (#{numbering(f, chapter)}--#{numbering("1", eq_num)})]
            })
        }
        else {
            it
        }
    }
    rest
}
