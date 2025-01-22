public class Circuit {
   // Function to draw diagram of a 4-bus system
  public void drawLineCircuit(int numBuses) {
    if (numBuses < 1) return;

    float busSpacing = mainWindowWidth / (numBuses + 1);
    int offset = 100;
    
    // Draw buses as circles
    fill(150, 255, 150);
    for (int i = 0; i < numBuses; i++) {
        float x = (i + 1) * busSpacing;
        float y;
        if (i==1) y = mainWindowHeight / 3 - offset;
        else y = mainWindowHeight / 3 + offset;
        ellipse(x, y, 40, 40);
    }
    
    // Write bus number in bus circles
    fill(5);
    for (int i = 0; i < numBuses; i++) {
        float x = (i + 1) * busSpacing;
        float y;
        if (i==1) y = mainWindowHeight / 3 - offset;
        else y = mainWindowHeight / 3 + offset;
        text((i==0)?2:(i==1)?1:3, x-2 ,y+3);      
    }

    // Draw connecting lines between buses
    stroke(0);
    strokeWeight(2);
    for (int i = 0; i < numBuses - 1; i++) {
        float x1 = (i + 1) * busSpacing + 20;         
        float x2 = (i + 2) * busSpacing - 20;         
        float y = mainWindowHeight / 3;
        if (i==1)
          line(x1, y-offset, x2, y+offset); 
        else
          line(x1, y+offset, x2, y-offset); 
    }
}

  public void drawRingCircuit(float x, float y, int sides, float radius) {
    if (sides < 3) return;  
    
    float angle = TWO_PI / sides;
    
    // Draw connecting lines between buses
    noFill(); 
    stroke(0); 
    strokeWeight(2);
    beginShape();
    for (int i = 0; i < sides; i++) {
      float px = x + cos(angle * i) * radius;
      float py = y + sin(angle * i) * radius;
      
      vertex(px, py);
    }
    endShape(CLOSE);
    
    // Draw buses as circles
    fill(150, 255, 150); 
    stroke(0); 
    strokeWeight(2);      
    for (int i = 0; i < sides; i++) {
      float px = x + cos(angle * i) * radius;
      float py = y + sin(angle * i) * radius;
      ellipse(px, py, 40, 40); 
    }
  }
};
