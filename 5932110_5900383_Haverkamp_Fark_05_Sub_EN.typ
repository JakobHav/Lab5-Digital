#import "@preview/lilaq:0.5.0" as lq

#set page(background: image("assets/frontpage.jpg"))
#v(210pt)
#h(105pt)
Jakob Haverkamp
#h(155pt)
5932110

#h(105pt)
Milan Fark
#h(186pt)
5900383

#set page(background: [])

#import "@local/ufr-sheet-universal:0.1.0": conf

#show: doc => conf(
  doc,
  subject: "Electronics Laboratory",
  date: "31.01.2026",
  prof: "Prof. Dr. Hans Zappe",
  semester: "WS 25/26",
  title: "Lab 5 - Bipolars",
  header_start: 2,
  name: "jh1444, mf643",
  left_header: [Jakob Haverkamp \ Milan Fark \ jh1444, #h(5pt)mf643],
)
#counter(page).update(1)
#set text(
  lang: "en",
  size: 11pt,
)

#set figure(numbering: "1")
#show ref: set text(fill: blue)

= 5.2 Ring oscilator

== 5.2.1. Simulation

=== Introduction

This section is about simulating an inverter, built from an N-Channel MOSFET and then simulating a chain made out of three of those inverters. As seen in @fig1, the source of each transistor is connected to _GND_, while the drain is connected to a _pull-up_ resistor. The gate of the first transistor is connected to the input, in this case a _LogiSim_ _PIN_ element, while the gate of the other transistors is connected to the output of the previous one.

#v(10pt)
=== Circuit diagrams

#figure(
  caption: [LogiSim circuit diagrams with _input = 0_ (left) and _input = 1_ (right)#footnote[I am on M1 Mac and therefore could not use original LogiSim, I had to download and compile LogiSim-evolution from GitHub instead, but I could follow all the Lab instructions the same, but thats the reason the table and circuit diagram may look different than expected. Also, in LogiSim-evolution i was unable to name the input `"input"` and so had to name it` "input0"`.]],
)[
  #stack(dir: ltr, spacing: 50pt, image("assets/5.2.1.circuit_0.png", width: 19%), image(
    "assets/5.2.1.circuit_1.png",
    width: 19%,
  ))
] <fig1>


// === Plots

// #include "1.2.plot_sim.typ"

#v(10pt)
=== Text Questions:
#figure(caption: [Screenshot of the truth table from _LogiSim_])[
  #table()
  #image("assets/5.2.1.png", width: 30%)
]
#pagebreak()

When the input is 0, the output is just connected to the _pull-up_ resistor and is therefore 1, when the input is 1, the MOSFET opens and connects the output to _GND_. In the logic table, we can therefore see an alternating pattern between 0 and 1 for input and output respectively.

=== Conclusion

We successfully simulated the inverter and inverter chain in LogiSim #footnote[Quite a cool program in our opinion!!] and generated the truth table, which showed an alternating sequence of 0 and 1 due to its inverting nature.

== 5.2.2. Measurement

=== Introduction

=== Circuit diagrams:

#figure(
  caption: [Schematic of the _MOSFET characteristics_ circuit (left)\ and the _MOSFET logic gates_ circuit (right)],
)[
  #stack(
    dir: ltr,
    image("assets/5.2.2.circuit.png", width: 30%),
    h(5%),
    line(angle: 90deg, length: 220pt, stroke: .25pt),
    h(5%),
    image("assets/5.2.2.circuit1.png", width: 60%),
  )
] <fig5>

=== Plots

#include "1.2.plot_real.typ"

=== Text questions:

=== Conclusion

= 5.3 NMOS logic

== 5.3.1. Simulation

=== Introduction

This section is about simulating three different logic gates, which can all be seen in @fig3.

_Logic circuit 1_ has all diode sources connected to _GND_ and all drains connected together, with a _pull-up_ resistor and the output pin attatched.

_Logic circuit 2_ has all diodes connected in series, so drain to source for each of them, with the first source connected to _GND_ and the last drain connected to a _pull-up_ resistor and the output pin.

_Logic circuit 3_ has two transistors connected in series as seen in gate 2, and the third transistor standing alone, again connected to _GND_ at the source and both drains connected to the same _pull-up_ resistor and output pin.

All three truth tables and logical formula can be seen in @table2.

=== Circuit diagrams:

#align(center)[
  #block(width: 95%)[
    #figure(
      caption: [LogiSim circuit diagrams of the three logic circuits],
    )[
      #stack(
        dir: ltr,
        image("assets/5.3.1.1.svg", width: 30%),
        h(5%),
        line(angle: 90deg, length: 15%, stroke: .25pt),
        image("assets/5.3.1.2.svg", width: 41%),
        line(angle: 90deg, length: 15%, stroke: .25pt),
        image("assets/5.3.1.3.svg", width: 30%),
      )
      #stack(dir: ltr, spacing: 150pt, [(1)], [(2)], [(3)])
      #v(5pt)
    ] <fig3>
  ]
]
=== Text questions:

#figure(caption: [Truth tables for all three logic circuits])[
  #table(
    columns: (30%, 33%, 30%),
    inset: 5pt,
    align: horizon + center,
    stroke: 0pt,
    [#image("assets/5.3.1.1.png")], [#image("assets/5.3.1.2.png", width: 90%)], [#image("assets/5.3.1.3.png")],
    [Logic circuit 1], [Logic circuit 2], [Logic circuit 3],
    [`NOR(A, B. C)`], [`NAND(A, B, C)`], [$overline(A) dot overline((B dot C))$],
  )
] <table2>

_Logic circuit 1_ is a standard logic gate, `NOR` to be specific, and *D* is 1 when neither `A` nor `B` nor `C` is active (hence the name), so when even one of them is 1, the output is 0.

_Logic circuit 2_ is also a standard logic gate, `NAND`, and *D* is 1 when all three inputs are 1 and 0 in all other cases.

_Logic circuit 3_ is not a standard gate, but its output can be described as $D =overline(A) dot overline((B dot C))$ or in words as `NOT A AND NOT (B AND C)` and as seen in the table *D* is *0* for all inputs with *A*=1 and *1* for all inputs with *A=0* except *ABC=011*.

=== Conclusion

We successfully built, simulated and evaluated all three logic circuits and found that circuit 1 and 2 were standard logic gates, namely `NOR` and `NAND`, while the third one was not a standard one, but could be described with the logic formula $D =overline(A) dot overline((B dot C))$.

== 5.3.2. Measurement

=== Introduction

=== Circuit diagrams:

#figure(
  caption: [Schematic of the _MOSFET characteristics_ circuit (left)\ and the _MOSFET logic gates_ circuit (right)],
)[
  #stack(
    dir: ltr,
    image("assets/5.2.2.circuit.png", width: 30%),
    h(5%),
    line(angle: 90deg, length: 220pt, stroke: .25pt),
    h(5%),
    image("assets/5.2.2.circuit1.png", width: 60%),
  )
] <5.3.2.circuit>


=== Truth tables

#figure()[
  #stack(
    dir: ltr,
    spacing: 30pt,
    table(
      columns: 4,
      inset: 5pt,
      align: horizon,
      table.header([$D space 0$], [$D space 1$], [$D space 2$], [$D I 8$]),
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
    ),
    table(
      columns: 4,
      inset: 5pt,
      align: horizon,
      table.header([$D space 0$], [$D space 1$], [$D space 2$], [$D space 8$]),
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
    ),
    table(
      columns: 4,
      inset: 5pt,
      align: horizon,
      table.header([$D space 0$], [$D space 1$], [$D space 2$], [$D space 8$]),
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
      [0], [0], [0], [0],
    ),
  )
  #stack(dir: ltr, spacing: 76pt, [Logic circuit 1], [Logic circuit 2], [Logic circuit 3])
]


=== Text questions:

=== Conclusion

