#import "@preview/letter-pro:3.0.0": letter-simple

#set text(lang: "de")

#show: letter-simple.with(
  sender: (
    name: "Rosa Luxemburg",
    address: "Karl-Liebknecht-Brücke 1, 10178 Berlin",
    extra: [
      Telefon: #link("tel:+49111222333")[+49 111 222333]\
      E-Mail: #link("mailto:noreply@gmail.com")[noreply\@gmail.com]\
    ],
  ),
  recipient: [
    Friedrich Ebert\
    Wilhelmstraße 140\
    10963 Berlin
  ],
  date: "Berlin, 1. January 1919",
  subject: "Ultimatum",
  font: "Roboto Slab",
)
#lorem(30)

#lorem(60)

#lorem(10)

#v(0.5cm)
Mit freundlichen Grüßen \
O. C. Taskin

#v(1fr)
*Anlagen:*
- Map of Berlin
- Document 1
- Document 2
