import processing.serial.*;

int deg=0; // This is my degree of servo rotation
int flag = 1; // We don't need it anymore

// Data from Ardunio
String serialData;
String serialDataP;

// Data processed for drawing
int serialDistance;
int serialDeg;

// This is object for Serial Communication
Serial Port;

int[] x = new int[180];
int[] y = new int[180];

void setup() {
  background(255); // White
  size(900,550);
  //printArray(Serial.list());
  Port = new Serial(this, Serial.list()[1], 9600);
  
  
  // Setting everything to Zero
  for(int i=0; i<180;i++){
    x[i] = 0;
    y[i] = 0;
  }
  
  
}

void draw(){
  background(0);
  translate(450,500);
  drawBackground();
  
  strokeWeight(4);
  stroke(255,26,5);
  line(0,0,450*cos(radians(serialDeg)),-450*sin(radians(serialDeg)));
  
  // This is new 
  for(int i=0;i<180;i++){
    stroke(34,255,15);
    strokeWeight(5);
    point(x[i],y[i]);
  }
  
  if(0 < Port.available()){
    serialData = Port.readStringUntil('#');
    
    try {
      
      serialDeg = int(float(serialData.split("\\*")[0])); // This is where my error is
 
      serialDistance = Integer.parseInt(serialData.split("\\*")[1].split("\\#")[0]);
      serialDistance = int(map(serialDistance, 2,30,0,450));
      
      
      x[serialDeg] = int(serialDistance*cos(radians(serialDeg)));
      
      // Add -ve sign
      y[serialDeg] = int(-serialDistance*sin(radians(serialDeg)));
      println("I am here");  
  } catch (Exception e){
    }
  }
}

void drawBackground(){
  strokeWeight(1);
  stroke(255);// White
  fill(0);
  arc(0,0,800,800,PI,TWO_PI);
  arc(0,0,600,600,PI,TWO_PI);
  arc(0,0,400,400,PI,TWO_PI);
  arc(0,0,200,200,PI,TWO_PI);
  
  line(0,0,450,0);
  line(0,0,-450*cos(radians(30)),-450*sin(radians(30))); 
  line(0,0,-450*cos(radians(60)),-450*sin(radians(60))); 
  line(0,0,-450*cos(radians(90)),-450*sin(radians(90))); 
  line(0,0,-450*cos(radians(120)),-450*sin(radians(120))); 
  line(0,0,-450*cos(radians(150)),-450*sin(radians(150)));
  line(0,0,-450,0);
}
