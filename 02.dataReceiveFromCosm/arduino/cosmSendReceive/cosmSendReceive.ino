/*

 */
 
// an LED connected on most Arduino boards.
// give it a name:
int led = 11;


// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);  
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

  // read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  
  // print out the value you read:
  Serial.println(sensorValue);
  int brightness;
  
  if(Serial.available() > 0){
    brightness = Serial.parseFloat();
  }
  
  //brightness = map(sensorValue,0,1023,0,255);
   
  analogWrite(led, brightness);   // turn the LED on (HIGH is the voltage level)

  delay(100);               // wait for a while

}
