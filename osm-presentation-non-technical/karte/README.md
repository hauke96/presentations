# Daten für die Karte runterladen

Ich habe mit XML angefangen und bin später zu PBF gewechselt, deswegen ist der Prozess umständlicher als er sein müsste, aber ich hatte keine Lust das QGIS-Projekt umzubauen.

1. Datenbereich als `data.osm.pbf` runterladen, z.B. https://download.geofabrik.de/europe/germany/hamburg.html
2. In XML konvertieren: `osmconvert data.osm.pbf > data.osm`
3. Datei als `data.osm` hier in den Ordner legen und mit `osmtogeojson data.osm > data.geojson` in eine GeoJSON-Datei umwandeln
4. Mit `ogr2ogr data.gpkg data.geojson -select "name,id,type,highway,landuse,amenity,natural,shop,wheelchair,waterway,leisure"` in eine GeoPackage-Datei umwandeln (Dauert richtig lange, ~1h)

Nun kann man QGIS öffnen und alle Layer rendern den heruntergeladenen Ausschnitt.

# Bilder rendern

Das Script `export-all` ausführen oder über QGIS manuell das Layout öffnen und exportieren.
