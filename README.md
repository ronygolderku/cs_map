# R Leaflet Map Visualization

This project contains R code to visualize geographic data using the `leaflet` package. The code reads a shapefile and a CSV file containing points, converts the CSV data to an `sf` object, and then creates an interactive map with various base layers and overlays.

## Libraries Used
- `sf`: Simple Features for R
- `leaflet`: Create Interactive Web Maps with the JavaScript 'Leaflet' Library
- `htmlwidgets`: HTML Widgets for R

## Data
- Shapefile: `sat_boundary_MultiPolygon.shp`
- Points: `points.csv`

## Map Features
- Base layers from various providers including National Geographic, Ocean Basemap, World Physical, Dark Matter, OpenStreetMap, and World Imagery.
- Overlay groups for the study area and points.
- Interactive layers control to switch between different map layers.
- Polygons representing the study area.
- Markers for each point with popups displaying additional information.

## Output
The map is saved as an HTML file `index.html`, which can be opened in any web browser to view the interactive map.
