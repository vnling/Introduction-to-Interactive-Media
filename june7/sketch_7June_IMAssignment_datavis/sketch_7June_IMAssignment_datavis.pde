/* 
  Concept: A "bubble plot" from randomly generated data laid over an image 
  of Bubbles, the Powerpuff Girl, to create an artwork. (For clarity, 
  "bubbles" hereon refers to the circles of the bubble plot, while "the character" 
  refers to the cartoon character.) The data input was 250 sets of 3 integers per set,
  with the bubbles' x and y positions determined by the first and second integers in each set, 
  and the radius determined by the third integer divided by 10. The opacity of each bubble
  is a function of the width and height, meaning that the bubbles are the most opaque in the
  top left corner and most transparent in the bottom right.
  
  Name: Vee Nis Ling
  Assignment Due: 7 June 2020
  Data Source: Randomly generated integer sequences (random.org)
*/

//initializing array to contain individual sets of data
int[] individualData;

//initializing array of colors (to later be randomly assigned to bubbles)
color cottonCandy = color(254, 200, 216); 
color pastelViolet = color(210, 145, 188); 
color lavenderPurple = color(149, 125, 173); 
color thistle = color(224, 187, 228); 
color[] colors = {cottonCandy, pastelViolet, lavenderPurple, thistle};

void setup() {
  //drawing background and canvas
  background(255);
  size(800, 963);
  
  //loading image and resizing as necessary to fit canvas
  PImage img;
  img = loadImage("bubbles_img.jpg");
  img.resize(800,0);
  image(img, 0, 0);
  
  //loading in data from the .csv file
  String[] data = loadStrings("data.csv");
  cleanAndDrawData(data); 
}

//function to draw all circles
void cleanAndDrawData(String[] data) { //takes the array of data as input
   for (int i = 1; i < data.length; i++) { //for each element in the dataset
     individualData = int(split(data[i], ',')); //splitting each line using commas as dividers
     int xPos = individualData[0];
     int yPos = individualData[1];
     float radius = individualData[2]/10; 
     
     //if condition ensures no bubbles are drawn over character's face
     if (xPos < 220 || xPos > 850 || yPos < 220 || yPos > 500) {
       int opacity = (width-individualData[0])/7 + (height-individualData[1])/7; //opacity is determined as a function of x and y coordinates
       fill(colors[(int)random(4)], opacity); //fill color selected randomly from array above
       strokeWeight(3);
       circle(xPos, yPos, radius); //circle is drawn!
     }
   }
}
