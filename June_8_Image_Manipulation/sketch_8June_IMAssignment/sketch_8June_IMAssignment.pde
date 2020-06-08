/*
  Concept: This project distorts any given image, turning individual pixels into distorted 11x11 blocks.
  I later also altered the rValue, gValue, and bValue to produce color effects inspired by some of 
  Andy Warhol's work.
  
  Name: Vee Nis Ling
  Due Date: 8 June 2020
  Image Source: Daniel Shiffman's Twitter (@shiffman)
  
*/

PImage img;
float rValue;
float gValue;
float bValue;

void setup() {
  size(512, 512); //initialized based on image, processing won't take variables
  img = loadImage("shiffman.jpg");
}

void draw() {
  loadPixels(); //loads canvas pixels
  img.loadPixels(); //loads image pixels
  
  //iterates over each pixel in the image
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      int pixelLocation = i + j*img.width;
      
      //registers rgb values of all pixels in image
      rValue = red(int(img.pixels[pixelLocation]));
      gValue = green(int(img.pixels[pixelLocation]));
      bValue = blue(int(img.pixels[pixelLocation]));
      
      //create blocks of 11 pixels all the same color
      //if the pixel's x-value mod 11 is smaller than 5, set rgb values to the rgb values of the 6th pixel in a group of 11
      if (i%11 < 5 && pixelLocation + 1 < img.width) {
        int subtractionFactor = i%11; //used to calculate distance from 6th pixel
        rValue = red(int(img.pixels[pixelLocation + 6 - subtractionFactor])); //hence 6 is not "magic", just the center pixel
        gValue = green(int(img.pixels[pixelLocation + 6 - subtractionFactor]));
        bValue = blue(int(img.pixels[pixelLocation + 6 - subtractionFactor]));
      } 
      
      //if the pixel's x-value mod 11 is greater than 5, set rgb values to the rgb values of the 6th pixel in a group of 11
      else if (i%11 > 5) {
        int subtractionFactor = 11 - i%11;
        rValue = red(int(img.pixels[pixelLocation - subtractionFactor]));
        gValue = green(int(img.pixels[pixelLocation - subtractionFactor]));
        bValue = blue(int(img.pixels[pixelLocation - subtractionFactor]));
      } 
      
      //y-values adjusted the same way as x-values
      if (j%11 < 5 && pixelLocation + 1 < img.height) {
        int subtractionFactor = j%11; 
        rValue = red(int(img.pixels[pixelLocation + 6 - subtractionFactor]));
        gValue = green(int(img.pixels[pixelLocation + 6 - subtractionFactor]));
        bValue = blue(int(img.pixels[pixelLocation + 6 - subtractionFactor]));
      } 
      
      if (j%11 > 5) {
        int subtractionFactor = 11 - j%11;
        rValue = red(int(img.pixels[pixelLocation - subtractionFactor]));
        gValue = green(int(img.pixels[pixelLocation - subtractionFactor]));
        bValue = blue(int(img.pixels[pixelLocation - subtractionFactor]));
      }
      
      //pixel colors are set
      pixels[pixelLocation] = color(gValue, bValue, rValue);
    }
  }
  
  //pixels drawn
  updatePixels();
}
