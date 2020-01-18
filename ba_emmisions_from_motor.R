library(dplyr)
library(ggplot2)

# Read data
NEI <- readRDS("./Datasets/summarySCC_PM25.rds")
SCC <- readRDS("./Datasets/Source_Classification_Code.rds")


# Subset data for Baltimore City and ON-ROAD sources (vehicle emissions)

bal_mv <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Get total emissions grouped by year and type
mv_totals <- bal_mv %>% 
  group_by(year) %>% 
  summarise(total = sum(Emissions))


# Plot...

# Open PNG device
png("ba_emmisions_from_motor.png", width = 480, height = 480)


# Construct plot
ggplot(mv_totals, aes(as.factor(year), total)) + 
  geom_bar(stat="identity") +
  labs(x = "Year", y = "Motor Vehicle Emissions (tons)", title = "Total Motor Vehicle Emissions (tons) in Baltimore by year")


# Device off
dev.off()