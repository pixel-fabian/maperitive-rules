#!/bin/sh
# A simple shell script to reduce osm files with osmosis (https://github.com/openstreetmap/osmosis)

./bin/osmosis \
--read-pbf ../maps/mapname.osm.pbf \
--log-progress \
--tf accept-nodes highway=motorway,primary,trunk water=* natural=* landuse=* \
--tf reject-ways \
--tf reject-relations \
--sort \
\
--read-pbf ../maps/mapname.osm.pbf \
--log-progress \
--tf accept-ways highway=motorway,primary,trunk water=* natural=* landuse=* \
--tf reject-relations \
--used-node \
--sort \
\
--read-pbf ../maps/mapname.osm.pbf \
--log-progress \
--tf accept-relations highway=motorway,primary,trunk water=* natural=* landuse=* \
--used-way \
--used-node \
--sort \
\
--merge --merge \
--write-xml mapname-reduced.osm