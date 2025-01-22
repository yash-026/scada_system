public class DataWindow {
    // Function to draw the data window for each bus
    int padding = 20;
    public void drawDataWindow(int busId, String busName, double voltage, double realPower, double imagPower, int x, int y) {
    int offsetX = x + 10;  
    int offsetY = y + 40;
    
    // Draw window background
    fill(50);
    stroke(0);
    rect(x, y, dataWindowSize - padding, dataWindowSize/2);
    
    // Display bus information
    fill(255);    
    textSize(14);
    text(busName+str(busId+1), offsetX, offsetY - 20);
    text("Voltage: " + voltage + " p.u.", offsetX, offsetY);
    text("Real Power: " + realPower + " MW", offsetX, offsetY + 20);
    text("Reactive Power: " + imagPower + " MVAR", offsetX, offsetY + 40);
  } 
  
};
