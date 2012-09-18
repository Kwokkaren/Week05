/*
  Retrieving data from COSM

  modified by yuta nakayama(didny@nus.edu.sg)
  Originally Written by Tadokoro Atsushi
  http://yoppa.org/tau_bmaw12/4010.html
  https://docs.google.com/open?id=0BzyVHU69QO3mNTJLWThvSi15UDQ  

*/


import cosm.*;
DataIn feed;


String apiKey = "YOUR_API_KEY"; 
String feedId = "YOUR_FEED_ID";

float [] feedValues;
int count = 0;
int currentTime;
int prevTime;
int retrieveInterval = 1000; // data retrieving interval in microsecond(1000ms = 1s);


void setup() {
size(400, 200);
frameRate(10);
feed = new DataIn(this, apiKey, feedId);

smooth();

feedValues = new float[width]; //create an array to store feed values
for(int i = 0; i < width; i++){
 feedValues[i] = 0;
}


}

void draw() {
background(255);
fill(0);
text("current value = " + feedValues[count], 10, 20);

  currentTime = millis();
  
  if((currentTime - prevTime) > retrieveInterval){
     requestData();
     prevTime = currentTime;
  }
  
  
  stroke(255,0,0);
  line(count,0,count,height);
 
  for(int i = 1; i < width; i++){
    
    float y1 = map(feedValues[i-1],0,1024,10,height-10);
    float y2 = map(feedValues[i],0,1024,10,height-10);
   
    stroke(0);
    line(i,y1,i,y2);
    
  }

}

void requestData() {
   feed.connect();
   feedValues[count] = feed.getValue(0);
   println(feedValues[count]);
   count = ++count % width;

}

