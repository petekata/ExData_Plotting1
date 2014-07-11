############################################################################
# draws plot1 and saves as png gile
# expects file "household_power_consumption.txt" in the current directory
############################################################################

draw_plot1 = function(dev_flag = TRUE){

  if (dev_flag){
    png(file = "plot1.png");
  }
  
  twodays_data <- get_two_day_data();
  # draw histogram 
  hist(as.numeric(as.character(twodays_data$Global_active_power)),col='red',main = "Global Active Power",xlab="Global Active Power (kilowatts)");
  if (dev_flag){
    dev.off();
  }

}


#helper function to get two day data
get_two_day_data = function(){
  
  # create column classes to speed up load process  
  col_classes=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric");
  # load energy data into variable elec_Data
  elec_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses=col_classes);
  # filter two days data
  twodays_data <- subset(elec_data,Date == '1/2/2007' | Date == '2/2/2007');  
  
}

#helper function to get datetime column with original two day data
get_two_day_data_with_datetime = function(){
  
  twodays_data = get_two_day_data();
  # convert Date and Time to POSIXlt type for easy plotting
  date_time <- strptime(paste(twodays_data$Date,twodays_data$Time),"%d/%m/%Y %H:%M:%S");
  # combine new column
  new_ele <- cbind(date_time,twodays_data);  
  
}

