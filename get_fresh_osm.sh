#!/bin/bash

# This tool needs https://wiki.openstreetmap.org/wiki/Osmupdate#Download

set -e

# From http://download.geofabrik.de/north-america/us/washington.html
curl -O http://download.geofabrik.de/north-america/us/washington-latest.osm.pbf
osmupdate -v washington-latest.osm.pbf updated_wa.osm.pbf
rm -fv washington-latest.osm.pbf data/input/*.osm
osmconvert updated_wa.osm.pbf -B=data/polygons/huge_seattle.poly --complete-ways -o=data/input/Seattle.osm
rm -fv updated_wa.osm.pbf
# Then delete the individual .osm's desired and run import.sh
