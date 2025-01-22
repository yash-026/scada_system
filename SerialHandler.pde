public class SerialHandler {
  double[] voltage, realPowers, reactivePowers;
  
  public void serialEvent(Serial myPort) {
    String data = myPort.readStringUntil('\n');
    
    if (data != null) {
      data = trim(data); // Clean up any whitespace
      String[] values = split(data, ';'); // Split the string by semicolon
      
      if (values.length == 3) {  // Ensure we have three values
        String str1 = values[0];
        String str2 = values[1];
        String str3 = values[2];
        
        String[] bus1_str = split(str1, ',');
        String[] bus2_str = split(str2, ',');
        String[] bus3_str = split(str3, ',');
        
        for (int i=0; i<3; i++) {
          voltage[i] = Double.parseDouble(bus1_str[i]);
          realPowers[i] = Double.parseDouble(bus2_str[i]);
          reactivePowers[i] = Double.parseDouble(bus3_str[i]);        
        }
      }
    }
  }
  
};
