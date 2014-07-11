############################################################################
# draws plot2 and saves as png gile
# expects file "household_power_consumption.txt" in the current directory
# expects plot1.R in the same directory
############################################################################

draw_plot2 = function(dev_flag = TRUE){

  source("plot1.R");
  
  # defualtas to 480 x 480
  if (dev_flag){
    png(file = "plot2.png");
  }
  
  new_ele <- get_two_day_data_with_datetime();
  
  # draw plot#2 

  with(new_ele,plot(date_time,Global_active_power, type="l",xlab="", ylab="Global Active Power (Kilowatts)"));


  if (dev_flag){
    dev.off();
  }
  
}


