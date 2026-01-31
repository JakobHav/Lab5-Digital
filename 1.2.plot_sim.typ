#import "@preview/lilaq:0.5.0" as lq

// beta = ic/ib
#show: lq.theme.skyline

#figure(caption: [Simulated base current over base-emitter voltage])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    // title: [],
    xlabel: [*$V_(B E)$* [V]],
    ylabel: [*$I_B$* [$mu$A]],
    legend: (position: left + top),
    xlim: (-0.01, 0.8),
    ylim: (-0, 110),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), dash: "solid", thickness: 2pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(20%), dash: "dashed", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: 1pt))
        it
      },
    ),


    // lq.plot(vb, ib, mark: ".", mark-size: 0pt),
  )
] <fig2>
