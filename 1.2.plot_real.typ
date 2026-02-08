#import "@preview/lilaq:0.5.0" as lq
#let (time, volt, _, inv1, _, _) = lq.load-txt(read("assets/5.2.2.txt"), delimiter: "\t", skip-rows: 1)
// #let (freq2, _, gain2, phase2) = lq.load-txt(read("assets/4.2.2.inf.txt"), delimiter: "\t", skip-rows: 0)

#let time = time.map(x => (x + 0.2 * 1e-5) * 1e6)

#show: lq.theme.skyline

#figure(
  caption: [analogue and digital signal course of _Inv1_ over $2.2 dot tau_i = 2.2 dot 13.62 space mu"s" =#{ 29.96 }space mu$s],
)[
  #lq.diagram(
    width: 100%,
    height: 29%,
    // title: [],
    xlabel: [*time* [$mu$s]],
    ylabel: [*analogue signal voltage* [V]],
    legend: (position: right + bottom, dx: -46pt, dy: -2pt, stroke: none),
    xlim: (0, 29.96),
    // ylim: (-40, 25),

    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),

    cycle: (
      it => {
        set lq.style(fill: blue.darken(-20%).transparentize(0%), stroke: (thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(fill: red.darken(-0%).transparentize(10%), stroke: (thickness: 1pt, dash: "solid"))
        it
      },
    ),

    lq.yaxis(
      position: right,
      label: [*digital signal value* $[0; 1]$],
      lq.plot(time, inv1, mark: ".", label: [digital], mark-size: 0pt),
      ticks: (
        (0, "0"),
        (1, "1"),
      ),
      subticks: 0,

      // lim: (-325, 200),
    ),

    lq.plot(time, volt, mark: ".", label: [analogue], mark-size: 0pt),
  )
] <plot>
