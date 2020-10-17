#include <Servo.h>
int trigPin = 9;
int echoPin = 10;

long duration;
int distance;

Servo hand;

void setup() {
  pinMode(trigPin,OUTPUT);
  pinMode(echoPin,INPUT);
  Serial.begin(9600);
  hand.attach(8);
}

void loop() {
  // This will take it from zero to 180
  for(int i=0;i<180;i=i+1){
      hand.write(i);
      delay(50);
      digitalWrite(trigPin,LOW);
      delayMicroseconds(2);
      digitalWrite(trigPin,HIGH);
      delayMicroseconds(10);
      digitalWrite(trigPin,LOW);
      duration = pulseIn(echoPin,HIGH);
      distance = duration*(0.034/2);

      // This is my angle of servo
      Serial.print(i);
      Serial.print("*");
      Serial.print(distance);
      Serial.println("#");
    }
  // This will take it from 180 to zero

  for(int i=180;i>0;i=i-1){
      hand.write(i);
      delay(50);
      digitalWrite(trigPin,LOW);
      delayMicroseconds(2);
      digitalWrite(trigPin,HIGH);
      delayMicroseconds(10);
      digitalWrite(trigPin,LOW);
      duration = pulseIn(echoPin,HIGH);
      distance = duration*(0.034/2);

      // This is my angle of servo
      Serial.print(i);
      Serial.print("*");
      Serial.print(distance);
      Serial.println("#");
    }
}

