#let tag(body, ratio: 1) = {
  rect(width: calc.abs(60mm * ratio), height: calc.abs(11mm * ratio))[#align(
      center + horizon,
    )[#text(20pt)[#body]]]
}

#let variations(body) = {
  let r = 0.85
  while r < 1.2 {
    tag(ratio: r)[#body]
    v(5pt)
    r += 0.05
  }
}

#set page(columns: 2)

#variations[Doe]
#variations[Mustermann]
#variations[Titius]
#variations[Seius]
