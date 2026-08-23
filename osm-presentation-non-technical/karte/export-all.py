#!/usr/bin/env python

import os
from qgis.core import QgsProject, QgsLayoutExporter, QgsApplication, QgsLayoutItemMap

print("Start application")
qgs = QgsApplication([], False)
# qgs.setPrefixPath("/usr/bin/qgis", True)
qgs.initQgis()

print("Load project")
project = QgsProject.instance()
project.read("./karte.qgz")
layout_manager = project.layoutManager()
layout = layout_manager.layoutByName("layout") # we assume this layout exists, so there is no "not None" check

print("Search for map item")
map_item = layout.itemById("Map")

print("Load themes")
themes = project.mapThemeCollection().mapThemes() # We assume there are themes, so we have no "not None" check below

print("Prepare exporter")
exporter = QgsLayoutExporter(layout)

print("Export all themes")
for theme_name in themes:
  print(f"Theme '{theme_name}'")

  # Set map item to follow the specific theme
  print(f"Theme '{theme_name}' - prepare map")
  map_item.setFollowVisibilityPreset(True)
  map_item.setFollowVisibilityPresetName(theme_name)

  # Force refresh/render
  print(f"Theme '{theme_name}' - render map")
  map_item.refresh()

  # Export
  print(f"Theme '{theme_name}' - prepare export")
  output_file = f"./layout_{theme_name.replace(" ", "-")}.jpg"
  export_settings = QgsLayoutExporter.ImageExportSettings()
  export_settings.dpi = 300

  print(f"Theme '{theme_name}' - export")
  exporter.exportToImage(output_file, export_settings)

print("All themes exported successfully!")
qgs.exitQgis()