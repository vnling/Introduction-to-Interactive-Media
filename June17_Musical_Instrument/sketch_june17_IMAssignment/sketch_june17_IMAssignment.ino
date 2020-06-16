/*
  Concept: A modified theremin. Since we discussed theremins in class today, I 
  thought it would be interesting to try and create one myself. Much like a 
  traditional theremin, mine produces higher pitches when the player brings 
  their hand closer to the sensor (in this case, I used a photoresistor). However, 
  in order to produce sound, the player must also press the momentary switch 
  (and hold it as long as they want sound to be produced). 

  Name: Vee Nis Ling
  Due date: 17 June 2020
*/

//setting up variables for input and output devices
int photoresistor = A0;
int redSwitch = A2;
int speakerPort = 8;

void setup() {
  Serial.begin(9600);

  //setting up pins as necessary
  pinMode(photoresistor, INPUT);
  pinMode(redSwitch, INPUT);
  pinMode(speakerPort, OUTPUT);
}

void loop() {

  //taking photoresistor input as an int variable
  int note = analogRead(photoresistor);

  //mapping from range of photoresistor input to range of frequencies in pitches
  note = map(note, 0, 1023, 1047, 31); 

  //play note at frequency given by input and map() if switch is pressed
  if (digitalRead(redSwitch) == HIGH) {  
    tone(speakerPort, note);
  }

  //otherwise don't play 
  else {
    noTone(speakerPort);
  }
}
