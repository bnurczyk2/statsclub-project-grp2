## LOAD IN SHAPEFILES
colonies.sf <- st_read("~/EvergladesWadingBird/SiteandMethods/colonies/colonies.shp")
subreg.sf <- read_sf("~/EvergladesWadingBird/SiteandMethods/regions/subregions.shp")
plot(subreg)

##COLONY INFO
colony.inf <- read_csv("EvergladesWadingBird/SiteandMethods/colonies.csv")

## NESTING DATA
nest_checks <- read_csv("EvergladesWadingBird/Nesting/nest_checks.csv")
nest_checks <- nest_checks %>%
  left_join(colony.inf %>% dplyr::select(colony, group_id), by = "colony")

greg_nest_check <- nest_checks %>% 
  filter(species=="greg")

## PULL RELEVANT COLONIES
filtered_colonies.sf <- colonies %>%
  mutate(greg = ifelse(Name %in% greg_nest_check$colony, 1, 0))



library(ggplot2)

# ggplot() +
#   geom_sf(data = subreg.sf) +
#   geom_sf(data = filtered_colonies.sf, aes(fill = factor(greg)), color = "black") +
#   scale_fill_manual(values = c("0" = "red", "1" = "darkgreen"),
#                     labels = c("0" = "No GrEg Nest", "1" = "GrEg Nest")) +
#   labs(title = "Everglade Colonies where Great Egrets are Found",
#        fill = "") +
#   theme_minimal()


## LOAD IN HG


## 