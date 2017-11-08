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

# load shapefile
stlTracts <- st_read('stlTract.shp', stringsAsFactors = FALSE)

# join tabular and geometric data
leadMap <- left_join(stlTracts, lead, by = c("GEOID" = "geoID"))

# remove tabular data frame
rm(lead)

ggplot(data = leadMap) +
  geom_sf(aes(fill = pctElevated), color = NA) + 
  scale_fill_distiller(palette = "Purples", trans = "reverse") +
  guides(fill = guide_legend(reverse = TRUE)) +
  labs(
    title = "Blood Lead Level Tests",
    subtitle = "St. Louis, MO",
    fill = "% Elevated"
    ) 
