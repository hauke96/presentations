#!/usr/bin/env bash

set -eou


# For osmtogeojson to not run out of memory. The value works for the hamburg-latest.osm.pbf file.
export NODE_OPTIONS=--max_old_space_size=8192

DATA_OSM_PBF=data.osm.pbf
DATA_OSM=data.osm
DATA_GEOJSON=data.geojson
DATA_GPKG=data.gpkg

if [ -f $DATA_OSM_PBF ]
then
    echo "File $DATA_OSM_PBF already exists. I'll skip the download."
else
    # Change the URL to some other PBF file but the downloaded file must be named like $DATA_OSM_PBF
    URL="https://download.geofabrik.de/europe/germany/hamburg-latest.osm.pbf"
    echo "Download PBF file from $URL"
    wget $URL -O $DATA_OSM_PBF
fi

if [ -f $DATA_OSM ]
then
    echo "File $DATA_OSM already exists. I'll skip the conversion."
else
    echo "Convert $DATA_OSM_PBF to $DATA_OSM"
    osmconvert $DATA_OSM_PBF > $DATA_OSM
fi

if [ -f $DATA_GEOJSON ]
then
    echo "File $DATA_GEOJSON already exists. I'll skip the conversion."
else
    echo "Convert $DATA_OSM to $DATA_GEOJSON. This might take a while."
    osmtogeojson $DATA_OSM > $DATA_GEOJSON

    echo "Filter GeoJSON file"
    # Contains all relevant keys (except name, id and type) from the "select" expression below
    jq '.features |= map(select(.properties.highway != null or .properties.landuse != null or .properties.amenity != null or .properties.natural != null or .properties.shop != null or .properties.wheelchair != null or .properties.waterway != null or .properties.leisure != null or .properties.railway != null))' --indent 4 data.geojson > data-filtered.geojson
    mv data-filtered.geojson $DATA_GEOJSON
fi

if [ -f $DATA_GPKG ]
then
    echo "File $DATA_GPKG already exists. I'll skip the conversion."
else
    echo "Convert $DATA_GEOJSON to $DATA_GPKG. This might take a long time."
    ogr2ogr $DATA_GPKG $DATA_GEOJSON -select "name,id,type,highway,landuse,amenity,natural,shop,wheelchair,waterway,leisure,railway"
fi