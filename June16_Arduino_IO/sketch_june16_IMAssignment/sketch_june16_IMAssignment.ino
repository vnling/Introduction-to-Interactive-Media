/*
  Concept: Traffic light LEDs. A switch and potentiometer are used as sensors in this circuit, while three LEDs (red, yellow, green), are used as actuators.
  The red LED is connected to port 3, the yellow to port 5, and the green to port 6. When the switch is not pressed, only the green LED lights up.
  When the switch is pressed, only the yellow LED lights up for some time, after which only the red LED lights up. The input from the potentiometer
  is used to determine how long the yellow LED lights up for, before the red LED lights up.

  Name: Vee Nis Ling
  Due date: 16 June 2020
*/

void setup() {
  Serial.begin(9600);
  //initializes pin 6 for digital output (green LED)
  pinMode(6, OUTPUT);
}

void loop() {
  int pot = analogRead(A0);
  //  Serial.println(digitalRead(A2)); (for testing and debugging)
  delay(1);

  // if switch is not pressed, only the green LED lights up
  if (digitalRead(A2) == LOW) {
    analogWrite(3, 0);
    analogWrite(5, 0);
    digitalWrite(6, HIGH);
  }

  else { //when the switch is pressed
    //only the yellow LED lights up
    analogWrite(3, 0);
    analogWrite(5, 255);
    digitalWrite(6, LOW);
    delay(pot * 10); //delay determined by value of potentiometer input

    while (digitalRead(A2) == HIGH) { //while switch is still pressed but delay has passed
      //only the red LED lights up
      analogWrite(3, 255);
      analogWrite(5, 0);
      digitalWrite(6, LOW);
    }
  }
}
