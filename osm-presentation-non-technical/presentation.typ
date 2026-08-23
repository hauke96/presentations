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
  - >770.000 Änderungen vorgenommen

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

*Kurzum:* Alles mit Koordinaten.

#v(2cm)

#pause

Vier Objektarten reichen dafür aus:

- Bäume, Ampeln, Geschäfte, ... → Punkte
- Straßen, Wanderwege, Flüsse, ... → Linien
- Gebäude, Seen, Wälder, Wohngebiete, ... → Flächen
- Busrouten, komplexe Geometrien, ... → Relationen

== Und warum ist OSM jetzt so toll?

#align(center)[#image("karte/layout_roads.jpg", height: 100% - 2em) Straßen]
#pagebreak()

#align(center)[#image("karte/layout_paths.jpg", height: 100% - 2em) Fuß- und Radwege]
#pagebreak()

#align(center)[#image("karte/layout_crossings.jpg", height: 100% - 2em) Querungsmöglichkeiten für Fußgänger]
#pagebreak()

#align(center)[#image("karte/layout_green-areas.jpg", height: 100% - 2em) Grünflächen / Parks]
#pagebreak()

#align(center)[#image("karte/layout_water-areas.jpg", height: 100% - 2em) Gewässer]
#pagebreak()

#align(center)[#image("karte/layout_drinking-water.jpg", height: 100% - 2em) Trinkwasserbrunnen / -spender]
#pagebreak()

#align(center)[#image("karte/layout_wheel.jpg", height: 100% - 2em) Barrierefreie Geschäfte/Angebote]
#pagebreak()

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

#align(center)[Katalog diverser Apps und Webseiten:\ \ #link("https://osm-apps.org")[osm-apps.org]]

== Rohdaten verarbeiten

Wo bekomme ich die Daten her?

- planet.openstreetmap.org #side-note[sämtliche Daten]
- openstreetmap.org #side-note[kleinere Gebiete]
- Geofabrik #side-note[große Datenbank Dumps]
- Overpass #side-note[Abfragen]

#pagebreak()

Viele Tools und Frameworks können mit OSM-Daten umgehen:

- osm2pgsql #side-note[Import in eine PostGIS Datenbank]
- Osmosis, Osmium, ogr2ogr #side-note[filtern, analysieren, umwandeln]
- QGIS, GRASS GIS, Geoserver #side-note[GIS-Anwendungen und -Server]
- Geotools, OpenLayers, MapLibre #side-note[Frameworks zur Verarbeitung und Darstellung]

Weitere Infos und Tools auf #link("https://switch2osm.org/")[switch2osm.org]

= Wie kann ich selbst beitragen?

Das geht sogar ohne Account:

- Auf #link("https://osm.org/")[osm.org] gehen → Rechtsklick → "Einen Hinweis/Kartenfehler hier melden"\
  - Wichtig: Möglichst viele Infos mit angeben.
  - Antworten kann man nur mit eigenem Konto.

#pagebreak()

Besser geht es mit Account:

- Auf #link("https://osm.org/")[osm.org] registrieren/anmelden
- Editor/App der Wahl installieren
- Los gehts

*Hinweis:* Alle gespeicherten/hochgeladenen Änderungen sind sofort Live!

#pagebreak()

Aber welchen Editor/welche App soll ich nehmen?

- StreetComplete #side-note[Gut für Einsteiger + made in Hamburg]
- OsmAnd, Go Map!!, Every Door #side-note[benötigen etwas mehr Wissen zu OSM]
- iD #side-note[Web-Editor, direkt auf osm.org nutzbar]
- JOSM #side-note[Profi-Editor]

Mehr Apps und Editoren auf #link("https://osm-apps.org")[osm-apps.org]

#pagebreak()

#align(center)[Weitere Infos, um tiefer einzusteigen:\ \ #link("https://learnosm.org/")[learnosm.org]]

#pagebreak()

Forum:\
#link("https://community.openstreetmap.org/")[community.openstreetmap.org]
\
\
Wiki:\
#link("https://wiki.openstreetmap.org/")[wiki.openstreetmap.org]
\
\
Hamburger Community-Treffen:\
Jeden 2. Dienstag im Monat um 19:00\
#link("https://wiki.openstreetmap.org/wiki/Hamburger_Mappertreffen")[wiki.openstreetmap.org/wiki/Hamburger_Mappertreffen]

#pagebreak()

#image-slide(background: image("karte/overview.jpg"))[
  #highlight(fill: white.transparentize(100%), radius: 2em, extent: 1em)[
    #text(size: 2em)[
      Viel Spaß mit OSM!
    ]
  ]
]