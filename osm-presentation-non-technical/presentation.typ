#import "theme.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [OpenStreetMap],
    subtitle: [Eine kleine Einführung],
    author: [Hauke Stieler],
    date: datetime.today(),
    contact: [OSM: #link("https://www.openstreetmap.org/user/hauke-stieler")[hauke-stieler]],
    logo: image("osm-logo.svg", height: 1.25em),
  ),
  footer-right: none,
)

#set figure(numbering: none)

#let diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#set quote(block: true, quotes: true)

#title-slide()

== Kurz vorneweg ...

Zu mir:

- Hauke Stieler
- Softwareentwickler
- Seit 2019 bei OpenStreetMap
  - 770443 Änderungen vorgenommen

#pause

*Hinweis:* Erwähnungen von Apps / Anwendungen / Websites sind rein beispielhaft und keine Werbung oder Empfehlung.

== Mal angenommen ...

#focus-slide[
  *Mal angenommen*

  wir würden kein Google Maps mehr nutzen ... was dann?
]

== ÖPNV?

#figure(
  align(center)[#image("images/hvv-switch.png", height: 90%)],
  caption: [HVV Switch App],
)

== Radfahren?

#figure(
  align(center)[#image("images/bikemap.png", height: 90%)],
  caption: [Bikemap.org],
)

== Wandern?

#figure(
  align(center)[#image("images/komoot.png", height: 90%)],
  caption: [Komoot],
)

== Autofahren?

#grid(
  columns: 2,
  grid.cell(
    figure(
      align(center)[#image("images/magic-earth.png", width: 60%)],
      caption: [Magic Earth],
    )
  ),
  grid.cell(
    figure(
      align(center)[#image("images/osmand.png", height: 90%)],
      caption: [OsmAnd],
    )
  )
)

== Momentchen mal ...

#focus-slide[
  *Momentchen mal*

  wenn wir kein Google Maps nutzen, wo kommen die Karten her?
]

== OpenStreetMap

#focus-slide[
  *OpenStreetMap*
]

= Also, wat is en Dampfmaschin?

== Kurz und nüchtern

#quote(attribution: [#link("https://www.openstreetmap.de/")[openstreetmap.de]])[OpenStreetMap (OSM) ist ein internationales Projekt mit dem Ziel, eine freie Weltkarte zu erschaffen.]

#pause

Konkret:

- *Community-Projekt und Datenbank für Geodaten*
- Frei zugänglich
- 2004 gegründet
- Community getrieben
- Rein über Spenden finanziert
- OpenStreetMap Foundation
  - Verwaltet Spenden
  - Übernimmt Hosting

== Wie Wikipedia, nur für Karten

#align(center)[
  #diagram(
    //debug: 2,

    only("1", node((0cm,0cm), [#image("images/wikipedia.svg", width: 3cm) #v(-1em) Artikel], name: <osm>)),
    pause,

    only("2", node((0cm,0cm), [#image("images/wikipedia.svg", width: 3cm) #v(-1em) Artikel], name: <osm>)),
    node((-7cm,2.5cm), [#image("images/person.png", width: 1.5cm)], name: <personIn>),
    node((-9cm,0cm), [#image("images/group.png", width: 2.5cm)], name: <groupIn>),
    node((-7cm,-2.5cm), [#image("images/company.png", width: 1.5cm)], name: <companyIn>),
    edge(<personIn>, <osm>, "-stealth", bend: 12deg),
    edge(<groupIn>, <osm>, "-stealth"),
    edge(<companyIn>, <osm>, "-stealth", bend: -12deg),
    pause,

    only("3", node((0cm,0cm), [#image("images/wikipedia.svg", width: 3cm) #v(-1em) Artikel], name: <osm>)),
    node((6cm,0cm), [#image("images/earth.png", height: 2cm)], name: <earth>),
    edge(<osm>, <earth>, "-stealth"),
    pause,

    only("4", node((0cm,0cm), [#image("osm-logo.svg", width: 3cm) #v(-1em) Geodaten], name: <osm>)),
    pause,

    only("5", node((0cm,0cm), [#image("osm-logo.svg", width: 3cm) #v(-1em) Geodaten], name: <osm>)),
    node((7.5cm,4.5cm), [#image("images/osmand.png", width: 1.15cm)], name: <appA>),
    node((9cm,2cm), [#image("images/bikemap.png", height: 1.5cm)], name: <appB>),
    node((9cm,0cm), [#image("images/person.png", width: 1cm)], name: <personOut>),
    node((9cm,-1.5cm), [#image("images/group.png", width: 1.65cm)], name: <groupOut>),
    node((8cm,-3cm), [#image("images/company.png", width: 1cm)], name: <companyOut>),
  )
]

== Und was sind "Geodaten" genau?

*Kurzum:* Alles mit einer Koordinate.

#v(2cm)

#pause

Verschiedene Arten von Geometrien sind möglich:

- Punkte (Bäume, Ampeln, Geschäfte, ...)
- Linien (Straßen, Wanderwege, Flüsse, ...)
- Flächen (Gebäude, Seen, Wälder, Wohngebiete, ...)
- Relationen (Busrouten, komplexe Geometrien)

== Und warum ist OSM jetzt so toll?

#only(1, align(center)[#image("karte/layout_roads.jpg", height: 100% - 2em) Straßen])
#only(2, align(center)[#image("karte/layout_paths.jpg", height: 100% - 2em) Fuß- und Radwege])
#only(3, align(center)[#image("karte/layout_bus-routes.jpg", height: 100% - 2em) Buslinien])
#only(4, align(center)[#image("karte/layout_crossings.jpg", height: 100% - 2em) Querungsmöglichkeiten für Fußgänger])
#only(5, align(center)[#image("karte/layout_railway-signals.jpg", height: 100% - 2em) Signale für Züge])
#only(6, align(center)[#image("karte/layout_green-areas.jpg", height: 100% - 2em) Grünflächen])
#only(7, align(center)[#image("karte/layout_wheel.jpg", height: 100% - 2em) Barrierefreie Geschäfte/Angebote])

= Wie kann ich OSM nutzen?

== Wir nutzen das alle ganz automatisch

Wahrscheinlich nutzt du OSM bereits:

- HVV
- Deutsche Bahn
- DHL
- Facebook
- Amazon
- Wikipedia / Wikimedia
- Diverse (die meisten?) Webseiten und Apps
- Indirekte Nutzungen

== Aktiv OSM nutzen

App Beispiele:

- OsmAnd #side-note[alles mögliche)]
- OrganicMaps / CoMaps #side-note[POIs und Routing)]
- Komoot #side-note[Outdoor-Aktivitäten)]
- uvm.

#pagebreak()

Website Beispiele:

- openstreetmap.org
- osmapp.org #side-note[POIs]
- maps.openrouteservice.org #side-note[Routing]
- wheelmap.org #side-note[Barrierefreiheit]
- uvm.

#pagebreak()

#align(center)[Katalog diverser Apps und Webseiten:\ #link("https://osm-apps.org")[osm-apps.org]]

// TODO switch to osm website

== Rohdaten verarbeiten

Wie kann ich die Rohdaten herunterladen?

- planet.openstreetmap.org #side-note[sämtliche Daten]
- openstreetmap.org #side-note[kleinere Gebiete]
- Geofabrik #side-note[große Datenbank Dumps]
- Overpass #side-note[Abfragen]

// TODO Tools

= Wie kann ich selbst beitragen?

TODO