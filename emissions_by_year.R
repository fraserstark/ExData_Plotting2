

# Read data
NEI <- readRDS("./Datasets/summarySCC_PM25.rds")
SCC <- readRDS("./Datasets/Source_Classification_Code.rds")


# Get total emissions for each year
totals <- tapply(NEI$Emissions, NEI$year, FUN = sum)

# Plot...

# Open PNG device
png("emissions_by_year.png", width = 480, height = 480)


# Construct plot
barplot(totals, xlab = "Year", ylab = "Emissions (Tons)", main = "Total PM25 Emissions in tons, by year")

# Device off
dev.off()