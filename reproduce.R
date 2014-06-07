# -----------------------------------------------------------#
# Get tidy set from raw data for dates 1/2/2007 and 2/2/2007 #
# -----------------------------------------------------------#

#### Download ---------------------------------------------- #
# Download raw data
zip_fname <- "HPC.zip"
message("Downloading raw dataset...")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
	      dest=zip_fname, method="curl")

#### Filter ------------------------------------------------ #
#-
# For PEERS!!! 
# The rationale behind this approach is to use connections for doing
# all the work. This way we save memory and disk space. We read and
# filter the file within the archive over a connection (without 
# decompressing to disk!) and results are redirected to another 
# connection, that is then read into a data.frame. All with base R.
#-
# Get name of the raw data file within the archive
raw_file <- unzip(zip_fname, list=TRUE)$Name

# Open a temporary file connection for collecting output of filtering
filtered <- file()

# Open a connection for reading the target file in the archive without decompressing
zz <- unz(zip_fname, raw_file)

# Filter observations for target dates
message("Filtering raw data...")
cat(grep("(Date)|(^[1|2]/2/2007)", readLines(zz), value=TRUE), sep="\n", file=filtered)

# Load filtered data into a data.frame 
DFs <- read.table(filtered, header=TRUE, sep=";", na.strings="?", colClasses="character")

# Close connections
close(filtered) ; close(zz)

#### Tidy up ----------------------------------------------- # 
# Transform $Time to be a datetime variable
DFs <- transform(DFs, Time=paste(Date, Time), stringsAsFactors=FALSE)

# Convert types
date_format <- "%d/%m/%Y"
time_format <- "%H:%M:%S"

DFs$Date <- as.Date(DFs$Date, date_format)
DFs$Time <- strptime(DFs$Time, paste(date_format, time_format), tz="CEST")
DFs[, -(1:2)] <- lapply(DFs[, -(1:2)], as.numeric)

# ---------------- END OF FILE ----------------------------- #

