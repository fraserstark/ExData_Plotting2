library(dplyr)
library(ggplot2)

# Read data
NEI <- readRDS("./Datasets/summarySCC_PM25.rds")
SCC <- readRDS("./Datasets/Source_Classification_Code.rds")


# Merge with classifcation codes, taking SCCCode and Short.Name columns only
mrg_NEI <- merge(NEI, SCC[,c(1,3)], by="SCC")


# Get total 'Coal' emissions grouped by year and type
total_coal <- mrg_NEI %>% 
  filter(grepl("coal", Short.Name, ignore.case = TRUE)) %>%
  group_by(year) %>% 
  summarise(total = sum(Emissions))

# Plot...

# Open PNG device
png("total_coal_emissions_by_year.png", width = 480, height = 480)


# Construct plot
ggplot(total_coal, aes(as.factor(year), total)) + 
  geom_bar(stat="identity") +
  labs(x = "Year", y = "Total Emissions (tons)", title = "Total Coal Emissions (tons) by year")

# Device off
dev.off()