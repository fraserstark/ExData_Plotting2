library(dplyr)
library(ggplot2)
library(RColorBrewer)

# Read data
NEI <- readRDS("./Datasets/summarySCC_PM25.rds")
SCC <- readRDS("./Datasets/Source_Classification_Code.rds")


# Subset data for Baltimore City, Maryland

b_NEI <- subset(NEI, fips == 24510)

# Get total emissions grouped by year and type
b_totals <- b_NEI %>% 
            group_by(type, year) %>% 
            summarise(total = sum(Emissions))


# Plot...

# Open PNG device
png("ba_emissions_by_type.png", width = 480, height = 480)


# Construct plot
ggplot(b_totals, aes(year, total)) +
  geom_line(aes(color = type)) +
  labs(x = "Year", y = "Total Emissions (tons)", title = "Total PM25 Emissions for Baltimore by type") +
  scale_color_brewer(palette = "Dark2")

# Device off
dev.off()