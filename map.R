library(sf)
library(leaflet)
library(leaflet.extras)
library(leaflet.extras2)
library(htmlwidgets)
study_area <- st_read("C:/Users/admin/Downloads/WAMSI/Shapefile/sat_boundary_MultiPolygon.shp")
study_area1 <- st_read("C:/Users/admin/Downloads/WAMSI/Shapefile/Zone_11/zones_11_MultiPolygon.shp")
study_area2 <- st_read("C:/Users/admin/Downloads/WAMSI/Shapefile/Zone_11/Polygons_MultiPolygon.shp")
point <- read.csv("C:/Users/admin/Downloads/WAMSI/points.csv")

# Convert the CSV data to an sf object
point_sf <- st_as_sf(point, coords = c("longitude", "latitude"), crs = 4326)
map<-leaflet() %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap, group = "National Geographic") %>%
  addProviderTiles(providers$Esri.OceanBasemap, group = "Ocean Basemap") %>%
  addProviderTiles(providers$CartoDB.DarkMatter, group = "Dark Matter") %>%
  addProviderTiles(providers$OpenStreetMap, group = "OpenStreetMap") %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>%
  addLayersControl(
    position = "topright",
    baseGroups = c("National Geographic", "Ocean Basemap", "Dark Matter", "OpenStreetMap", "World Imagery"),
    overlayGroups = c("Cockburn Sound", "NS_Polygon", "Offshore", "Points"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addPolygons(data = study_area, fillOpacity = 0, group = 'Cockburn Sound',) %>%
  addPolygons(data = study_area1, fillOpacity = 0, group = 'NS_Polygon') %>%
  addPolygons(data = study_area2, fillOpacity = 0, group = "Offshore") %>%
  addMarkers(data = point, group = "Points",
             lng = ~point$longitude, lat = ~point$latitude,
             popup = paste("Point: ", point$Points, "<br>Latitude: ", 
                           point$latitude, "<br>Longitude: ", point$longitude, 
                           "<br>Location: ", point$label)) %>%
  addScaleBar(position = "bottomleft") %>%
  addDrawToolbar() %>%
  hideGroup("Offshore")%>%
  showGroup(c("Cockburn Sound", "NS_Polygon","Points"))

map
saveWidget(map, "index.html", selfcontained = TRUE)

