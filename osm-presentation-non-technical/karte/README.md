Daten für die Karte runterladen:

1. Auf osm.org gehen
2. Zu Bereich gehen, den man gerne für die Karte nutzen möchte
3. Oben in der Menüleiste auf "Export" und genauen Bereich auswählen
4. Daten herunterladen, was eine `.osm` Datei ist
5. Datei als `data.osm` hier in den Ordner legen und mit `osmtogeojson data.osm > data.geojson` in eine GeoJSON-Datei umwandeln
6. Mit `ogr2ogr data.gpkg data.geojson` in eine GeoPackage-Datei umwandeln

Nun kann man QGIS öffnen und alle Layer rendern den heruntergeladenen Ausschnitt.
