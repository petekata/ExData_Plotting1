#########################################################################
# draws plot3 and saves as png gile
# expects file "household_power_consumption.txt" in the current directory
# expects plot1.R in the same directory
############################################################################

draw_plot3 = function(dev_flag = TRUE){
  
  source("plot1.R");
  
  if (dev_flag){
    png(file = "plot3.png");
  }

  new_ele <- get_two_day_data_with_datetime();
  
  # ploting
  with(new_ele,plot(date_time,Sub_metering_1, type="l",xlab="",ylab="Energy Sub Metering"));
  # add red line 
  with(new_ele,lines(date_time,Sub_metering_2,col="red"))
  # add blue line
  with(new_ele,lines(date_time,Sub_metering_3,col="blue"))
  # adding legend
  if (dev_flag){
    legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
  }else{
    legend("topright", lty=1, lwd=1, bty="n",col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )    
  }

  if (dev_flag){
    dev.off();
  }
  
  
}


