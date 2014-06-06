# -------------------------------------- #
####            Multiplot             ####
#### -------------------------------- ####
#### 1.Global Active Power   vs Time  ####
#### 2.            Voltage   vs Time  ####
#### 3.Energy sub metering   vs Time  ####
#### 4.Global Reactive Power vs Time  ####
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
par(mfrow=c(2, 2))

# Plot 1
with(DFs, plot(Time, Global_active_power, 
	       type="l", 
	       xlab="", 
	       ylab="Global Active Power"))

# Plot 2
with(DFs, plot(Time, Voltage, 
	       type="l", 
	       xlab="datetime"))

# Plot 3
with(DFs, plot(Time, Sub_metering_1, 
	       type="l", 
	       col="black", 
	       xlab="", 
	       ylab="Energy sub metering"))
with(DFs, lines(Time, Sub_metering_2, 
		type="l", 
		col="red"))
with(DFs, lines(Time, Sub_metering_3, 
		type="l", 
		col="blue"))
leg_txt <- grep("Sub_", names(DFs), value=TRUE)
legend("topright", legend=leg_txt, 
       col=c("black", "red", "blue"), 
       lty=1, 
       bty="n",
       cex=0.8)

# Plot 4
with(DFs, plot(Time, Global_reactive_power, 
	       type="l", 
	       xlab="datetime"))

# Save to png (480px x 480px produced by default)
dev.copy(png, file="plot4.png", pointsize=10)
dev.off()

# ------------ END OF FILE ------------- #
