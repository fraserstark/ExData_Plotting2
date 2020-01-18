
# Read data
NEI <- readRDS("./Datasets/summarySCC_PM25.rds")
SCC <- readRDS("./Datasets/Source_Classification_Code.rds")


# Subset data for Baltimore City, Maryland

b_NEI <- subset(NEI, fips == 24510)
  
# Get total emissions for each year
b_totals <- tapply(b_NEI$Emissions, b_NEI$year, FUN = sum)

  
# Plot...

# Open PNG device
png("ba_emissions_by_year.png", width = 480, height = 480)


# Construct plot
barplot(b_totals, xlab = "Year", ylab = "Emissions (Tons)", main = "Total PM25 Emissions for Baltimore City, by year")

# Device off
dev.off()