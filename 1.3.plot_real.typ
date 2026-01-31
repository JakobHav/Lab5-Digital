#import "@preview/lilaq:0.5.0" as lq
// #let (t, vi, vo) = lq.load-txt(read("assets/2.3.2.CEA_C1.out_R51.txt"), delimiter: "\t", skip-rows: 24)

#show: lq.theme.skyline

#figure(
  caption: [Phase and amplification of the common emitter amplifier for  1Hz-100kHz on a $"log"_2$ scale. $R_48= 220 space Omega space$ and $space R_51 = 680 space Omega$ ],
)[
  #lq.diagram(
    width: 100%,
    height: 26%,
    // title: [],
    xlabel: [*Frequency* [kHz]],
    ylabel: [*Amplification* [dB]],
    legend: (position: center + bottom, dx: -0pt, dy: -0pt, stroke: none),
    xlim: (0.5 / 1000, 100 * 1.4),
    xscale: lq.scale.log(base: 2),

    xaxis: (
      exponent: 0,
      // subticks: 10,
      ticks: (
        (.001, ".001"),
        (.0021, ".0021"),
        (.005, ".005"),
        (.01, ".01"),
        (.021, ".021"),
        (.05, ".05"),
        (.1, ".1"),
        (.21, ".21"),
        (.5, ".5"),
        (1, "1"),
        (2.1, "2.1"),
        (5, "5"),
        (10, "10"),
        (21, "21"),
        (50, "50"),
        (100, "100"),
      ),
    ),
    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),

    cycle: (
      it => {
        set lq.style(fill: blue.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
      it => {
        set lq.style(fill: red.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
      it => {
        set lq.style(fill: blue.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: red.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
    ),


    // lq.plot(freq, amp, mark: ".", label: [Amp. $R_48$], mark-size: 0pt),
  )
]
