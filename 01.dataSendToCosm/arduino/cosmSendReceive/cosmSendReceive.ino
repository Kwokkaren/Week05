
// an LED connected on Pin11.
int led = 11;

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);  
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

  // Read the Sensor Input A0 and send a value to the Serial Port.
  int sensorValue = analogRead(A0);
  // print out the value you read:
  Serial.println(sensorValue);

  // Receive data from the Serial Port.
  int illuminance; 
  if(Serial.available() > 0){
    illuminance = Serial.parseFloat();
  }
  
  
  analogWrite(led, illuminance);   // turn the LED on (HIGH is the voltage level)

  delay(100);               // wait for a while

}
