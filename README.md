# Simple Features Tutorial

### Repository Contents
This repository contains files for:
  - `/Data` - shapefiles measuring:
     - `BOUNDARY_City.shp` - St. Louis City Boundary
     - `DEMOS_Tracts10.shp` - 2010 U.S. Census Tracts for St. Louis
     - `HYDO_AreaWater.shp` - Mississippi River and River Des Peres
  - `/Output` 
     - `HEALTH_leadTestByTract.shp` - shapefile of cleaned data
     - `stlLeadMap.png` - map of data
  - `simpleFeatures.R` - R script with sample functions for creating output
  - `simpleFeatures.Rproj` - RStudio project
  - `.gitignore` 
  - `LICENSE`
  - `README.md`
 
### Introduction
This tutorial introduces a number of skills related to mapping data in `R`: data cleaning, table joins, and map production. `R` is not a replacement for a GIS like ArcGIS or QGIS. However, its mapping tools are useful for previewing data and creating quick maps, particularly of quantitative data. `R` is also particularly useful for its spatial statistics tools. This tutorial uses a relatively new package called `sf` that is capable of creating both sophisticated maps and a number of key geoprocessing techniques.

### `ggplot2` Note
The CRAN release of `ggplot2` does not include the `geom_sf()` geom for plotting simple features. This tutorial therefore requires the [development version](https://github.com/tidyverse/ggplot2), which you can install from GitHub using the `devtools` package. 

### Sample Output
The included code demonstrates the production of the following plot:

![leadMap](https://raw.githubusercontent.com/chris-prener/simpleFeatures/master/Output/stlLeadMap.png)
