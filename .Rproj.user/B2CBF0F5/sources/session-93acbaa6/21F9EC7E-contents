library(sf)
library(leaflet)
library(htmlwidgets)
study_area <- st_read("C:/Users/admin/Downloads/WAMSI/Shapefile/sat_boundary_MultiPolygon.shp")

# minimum_longitude <- 115.590368
# maximum_longitude <- 115.590368
# minimum_latitude <- -32.086885
# maximum_latitude <- -32.086885
# 
# point <- data.frame(Longitude = c(minimum_longitude),
#                     Latitude = c(minimum_latitude))
# point <- st_as_sf(point, coords = c("Longitude", "Latitude"), crs = 4326)
point <- read.csv("C:/Users/admin/Downloads/WAMSI/points.csv")

# Convert the CSV data to an sf object
point_sf <- st_as_sf(point, coords = c("longitude", "latitude"), crs = 4326)

map<-leaflet() %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap, group = "National Geographic") %>%
  addProviderTiles(providers$Esri.OceanBasemap, group = "Ocean Basemap") %>%
  addProviderTiles(providers$Esri.WorldPhysical, group = "World Physical") %>%
  addProviderTiles(providers$CartoDB.DarkMatter, group = "Dark Matter") %>%
  addProviderTiles(providers$OpenStreetMap, group = "OpenStreetMap") %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>%
  addLayersControl(
    position = "topright",
    baseGroups = c("National Geographic", "Ocean Basemap", "World Physical", "Dark Matter", "OpenStreetMap", "World Imagery"),
    overlayGroups = c("Cockburn Sound", "Points"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addPolygons(data = study_area, fillOpacity = 0, group = 'Cockburn Sound',) %>%
  addMarkers(data = point, group = "Points",
             lng = ~point$longitude, lat = ~point$latitude,
             popup = paste("Point: ", point$Points, "<br>Latitude: ", 
                           point$latitude, "<br>Longitude: ", point$longitude)) %>%
  addScaleBar(position = "bottomleft") %>%
  showGroup(c("Cockburn Sound", "Points"))


saveWidget(map, "index.html", selfcontained = TRUE)

