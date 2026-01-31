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

=== Circuit diagrams

#figure(
  caption: [LogiSim circuit diagrams with _input = 0_ (left) and _input = 1_ (right)#footnote[I am on M1 Mac and therefore could not use original LogiSim, I had to download and compile LogiSim-evolution instead, but I could follow all the instructions the same, but thats the reason the table and circuit diagram may look different than expected. Also, in LogiSim-evolution i was unable to name the input `"input"` and so had to name it` "input0"`.]],
)[
  #stack(dir: ltr, spacing: 50pt, image("assets/5.2.1.circuit_0.png", width: 19%), image(
    "assets/5.2.1.circuit_1.png",
    width: 19%,
  ))
] <fig1>


// === Plots

// #include "1.2.plot_sim.typ"

=== Text Questions::

#image("assets/Bildschirmfoto 2026-01-31 um 15.13.45.png", width: 30%)
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

=== Circuit diagrams:

#figure(caption: [LogiSim circuit diagram])[
  // #image("assets/2.2.1.circuit.jpg", width: 39%)
] <5.3.1.circuit>


=== Plots

#include "1.3.plot_sim.typ"

=== Text questions:

=== Conclusion

== 5.3.2. Measurement

=== Introduction

=== Circuit diagrams:



=== Plots

#include "1.3.plot_real.typ"

=== Text questions:

=== Conclusion

