library(stlData)      # st louis data

library(sf)           # tools for GIS
library(RColorBrewer) # color palattes 
library(scales)

library(ggplot2)      # plotting
library(dplyr)        # data wrangling

# load data from package into global environment
lead <- stlLead

# prepare for join
lead <- lead %>%
  mutate(geoID = as.character(geoID)) %>%
  select(geoID, pctElevated) %>%
  mutate(pctElevated = pctElevated*.01)

# load shapefiles
boundary <- st_read('BOUNDARY_City.shp', stringsAsFactors = FALSE)
hydro <- st_read('HYDRO_AreaWater.shp', stringsAsFactors = FALSE)
tracts <- st_read('DEMOS_Tracts10.shp', stringsAsFactors = FALSE)

# join tabular and geometric data
leadMap <- left_join(tracts, lead, by = c("GEOID" = "geoID"))

# remove tabular data frame
rm(lead)

# make map
ggplot() +
  geom_sf(data = leadMap, aes(fill = pctElevated), color = NA) + 
  geom_sf(data = hydro, fill = "#72bcd4", color = "#72bcd4") + 
  geom_sf(data = boundary, fill = NA) +
  scale_fill_distiller(palette = "Purples", trans = "reverse") +
  guides(fill = guide_legend(reverse = TRUE)) +
  labs(
    title = "Blood Lead Level Tests",
    subtitle = "St. Louis, MO",
    fill = "% Elevated"
    ) 


