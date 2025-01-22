// Processing SCADA Monitoring System UI
import processing.serial.*;

Serial myPort;

// Placeholder data for voltages, real power, and reactive power
double[] voltages = new double[3];
double[] realPower = new double[3];
double[] reactivePower = new double[3];

// Window dimensions
int mainWindowWidth = 820;
int mainWindowHeight = 600;
int dataWindowSize = 200;

Circuit circuit = new Circuit();
DataWindow[] windows = new DataWindow[3];
SerialHandler serialHandle;

void setup() {
  size(mainWindowWidth, mainWindowHeight);
  
  // Set up serial communication
  String portName = "COM9";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');

  // Initialize SerialHandler only once
  serialHandle = new SerialHandler();

  // Initialize DataWindow instances
  for (int i = 0; i < windows.length; i++) {
     windows[i] = new DataWindow();   
  }
}

void draw() {
  // Clear the screen at the start of each draw cycle
  background(200);
  
  // Check for available serial data
  if (myPort.available() > 0) {
      serialHandle.serialEvent(myPort);
      voltages = serialHandle.voltage;
      realPower = serialHandle.realPowers;
      reactivePower = serialHandle.reactivePowers;
  } else {
      line(100, 20, 20, 60); // Draw this line if no data is available
  }
  
  // Draw the main circuit
  circuit.drawLineCircuit(windows.length);
  
  // Draw data windows for each bus
  for (int i = 0; i < windows.length; i++) {
     windows[i].drawDataWindow(i, "Bus ", voltages[i], realPower[i], reactivePower[i], mainWindowWidth / 7 + (i) * dataWindowSize, mainWindowHeight - dataWindowSize); 
  }
}
