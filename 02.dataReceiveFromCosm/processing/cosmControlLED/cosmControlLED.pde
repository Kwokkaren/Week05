/*
  Retrieving data from COSM

  Originally Written by   

*/


import cosm.*;
import processing.serial.*;
DataIn feed;
Serial myPort;


String apiKey = "YOUR_API_KEY"; //COSM API Key
String feedId = "YOUR_FEED_ID"; //COSM Feed ID

float feedValue;

int count = 0;
int currentTime;
int prevTime;
int retrieveInterval = 1000; // data retrieving interval in microsecond(1000ms = 1s);


void setup() {
  size(400, 400);
  frameRate(10);
  smooth();

  feed = new DataIn(this, apiKey, feedId); //setup COSM feed input.

 //for Windows
  String portName = "COM11"; //change this port the same name as Arduino->Tool->Serial Port
  //for Mac OSX
  //String portName = Serial.list()[0]; //the first port

  myPort = new Serial(this, portName, 9600);
}

void draw() {
background(255);
fill(0);
text("current value = " + feedValue, 10, 20);

  currentTime = millis();
  
  if((currentTime - prevTime) > retrieveInterval){
     requestData();
     prevTime = currentTime;
  }
  
  fill(feedValue,255,255);
  rect(100,100,200,200);
  
  int writeValue = (int)map(feedValue,0,1023,0,255);
  myPort.write(writeValue);
  
}

void requestData() {
   feed.connect();
   feedValue = feed.getValue(0);

}

