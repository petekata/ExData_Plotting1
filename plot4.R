#########################################################################
# draws plot4 and saves as png gile
# expects file "household_power_consumption.txt" in the current directory
# expects plot1.R, plot2,R and Plot3.R in the same directory
############################################################################

source("plot1.R");
source("plot2.R");  
source("plot3.R");

draw_plot4 = function(){
  
    
  new_ele <- get_two_day_data_with_datetime();

  
  png(file = "plot4.png");

  #par(bg = "transparent")
  par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0));
  
  # first tile
  draw_plot2(FALSE);
  
  #second tile
  with(new_ele,plot(date_time,Voltage, type="l",ylab="Voltage", xlab="datetime"));


  #third tile
  draw_plot3(FALSE);
  # fourth tile
  with(new_ele,plot(date_time,Global_reactive_power, type="l",xlab="datetime"));

  
  dev.off();
  
}


