# -----------------------------------------------------------#
# Get tidy set from raw data for dates 1/2/2007 and 2/2/2007 #
# -----------------------------------------------------------#

#### Download and Decompress ------------------------------- # 
#-
## FOR PEERS !!! Please, uncomment all in this section to
## reproduce the entire process, downloading and decompressing
## upstream archive included. 
## Commented out here for your convenience.
#-
# Download raw data
#message("Downloading raw dataset...")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="HPC.zip", method="curl")

# List files in the archive and obtain info about their size 
#unzip("HPC.zip", list=TRUE)

# Unzip
#message("Decompressing...")
#unzip("HPC.zip")
# ---------------------------------------------------------- #

#### Tidy subset ------------------------------------------- # 
# Load data into a data.frame (about 127M, is not so big even with base R)
message("Loading data...")
DF <- read.table("household_power_consumption.txt", 
		 header=TRUE, sep=";", na.strings="?", colClasses="character")

# Subset for dates of interest
DFs <- DF[DF$Date == "1/2/2007" | DF$Date == "2/2/2007", ]

# Transform $Time to be a datetime variable
DFs <- transform(DFs, Time=paste(Date, Time), stringsAsFactors=FALSE)

# Convert types
date_format <- "%d/%m/%Y"
time_format <- "%H:%M:%S"

DFs$Date <- as.Date(DFs$Date, date_format)
DFs$Time <- strptime(DFs$Time, paste(date_format, time_format), tz="CEST")
DFs[, -(1:2)] <- lapply(DFs[, -(1:2)], as.numeric)

# ---------------- END OF FILE ----------------------------- #

