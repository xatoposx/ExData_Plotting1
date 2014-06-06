# -------------------------------------- #
#### Histogram of Global Active Power ####
# -------------------------------------- #

# FOR PEERS!!! See file 'reproduce.R' to create the tidy subset

# -------------------------------------- #
# Assume: 
# * tidy set variable name: DFs
# * variables in DFs: 
# [1] "Date"                  "Time"           "Global_active_power"  
# [4] "Global_reactive_power" "Voltage"        "Global_intensity"     
# [7] "Sub_metering_1"        "Sub_metering_2" "Sub_metering_3"
# -------------------------------------- #
source("reproduce.R")

# Plot
hist(DFs$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Save to png (480px x 480px produced by default)
dev.copy(png, file="plot1.png")
dev.off()

# ------------ END OF FILE ------------- #
