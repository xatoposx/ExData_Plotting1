# -------------------------------------- #
#### Histogram of Global Active Power ####
# -------------------------------------- #

#-
# FOR PEERS!!! 
# See file 'reproduce.R' to create the tidy subset
# Repeating the code in all plot*.R files would be 
# a really bad and discouraged practice.
#-

# -------------------------------------- #
# Assume: 
# * tidy set variable name: DFs
# * variables in DFs: 
# [1] "Date"                  "Time"           "Global_active_power"  
# [4] "Global_reactive_power" "Voltage"        "Global_intensity"     
# [7] "Sub_metering_1"        "Sub_metering_2" "Sub_metering_3"
# -------------------------------------- #
# Source raw->tidy work
source("reproduce.R")

# Layout
# Transparent background might be incorrectly rendered 
# by some apps (see ?png)
# We must set it at global level to make effect later on. 
par(bg="white")

# Plot
hist(DFs$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Save to png (480px x 480px produced by default)
dev.copy(png, file="plot1.png", pointsize=10)
dev.off()

# ------------ END OF FILE ------------- #
