library(dplyr)
library(ggplot2)
library(RColorBrewer)

# Read data
NEI <- readRDS("./Datasets/summarySCC_PM25.rds")
SCC <- readRDS("./Datasets/Source_Classification_Code.rds")


# Subset data for Baltimore City & LA ON-ROAD sources (vehicle emissions)
bal_la_mv <- subset(NEI, (fips == "24510" |  fips == "06037") & type == 'ON-ROAD')

# Get total emissions grouped by year and type
mv_totals <- bal_la_mv %>% 
  group_by(year, fips) %>% 
  summarise(total = sum(Emissions))


# Plot...

# Open PNG device
png("ba_la_vehicle_emmisions_by_year.png", width = 480, height = 480)


# Construct plot
ggplot(mv_totals, aes(year, total)) + 
  geom_line(aes(color = fips)) +
  labs(x = "Year", y = "Total Emissions (tons)", title = "Total PM25 Vehicle Emissions (tons), LA and Baltimore") +
  scale_color_brewer(palette = "Dark2", name = "City", labels = c("LA","Baltimore"))
 

# Device off
dev.off()