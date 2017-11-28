library(stlData)      # st louis data

library(leaflet)
library(sf)           # tools for GIS
library(htmltools)

library(dplyr)        # data wrangling

# load data from package into global environment
lead <- stlLead

# prepare for join
lead <- lead %>%
  mutate(geoID = as.character(geoID)) %>%
  mutate(PCTELE = pctElevated*.01) %>%
  select(geoID, PCTELE)

# load shapefiles
tracts <- st_read("Data/DEMOS_Tracts10.shp", stringsAsFactors = FALSE)

# join tabular and geometric data
leadMap <- left_join(tracts, lead, by = c("GEOID" = "geoID"))

# remove tabular data frame
rm(lead)
rm(tracts)

# define popup text
tract_popup <- paste0("Percent Elevated in ",
                      leadMap$NAMELSAD, ": ",
                      leadMap$PCTELE*100, "%")

# leaflet object
leaflet(leadMap) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              fillColor = ~colorQuantile("Purples", PCTELE)(PCTELE),
              popup = ~htmlEscape(tract_popup), 
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))
