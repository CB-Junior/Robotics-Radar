int deg=0; // This is my degree of servo rotation
int flag = 1; 


void setup() {
  background(255); // White
  size(900,550); 
}

void draw(){
  background(255);
  translate(450,500);
  drawBackground();
  
  strokeWeight(3);
  line(0,0,-450*cos(radians(deg)),-450*sin(radians(deg)));
  if(deg == 180) {flag = -1;}
  if(deg == 0) {flag = +1;}
  
  deg = deg + flag;
}

void drawBackground(){
  strokeWeight(1);
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
