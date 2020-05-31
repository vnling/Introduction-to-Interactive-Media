size(800,800);

//code for hair
fill(0);
beginShape();
vertex(400, 100); //starts at centre of head
bezierVertex(550, 30, 750, 175, 680, 700); //right side curve
bezierVertex(500, 750, 300, 750, 120, 700); //bottom curve
bezierVertex(50, 175, 250, 30, 400, 100); //left side curve
endShape();

//code for face base
fill(255, 217, 194);
beginShape();
vertex(200, 600); //left jaw as start point
bezierVertex(200, 600, 400, 700, 600, 600); //jawline
vertex(620, 300); //right side of face
bezierVertex(450, 310, 350, 250, 333, 175); //right hairline curve
bezierVertex(300, 280, 220, 310, 180, 300); //left hairline curve
vertex(200, 600); //close shape, left side of face
endShape();

//code for left eye
stroke(72, 55, 40); //changing "eyeliner"
strokeWeight(3);
fill(255);
beginShape();
vertex(220, 350); //top left corner of eye
bezierVertex(280, 340, 350, 350, 350, 450); //inner curve of eye (closer to nose bridge)
bezierVertex(290, 460, 220, 450, 220, 350); //outer curve
endShape();

//left pupil
fill(72, 55, 40);
circle(300, 405, 80);
fill(38, 29, 21);
circle(310, 410, 50); //skewed to the right slightly to give impression of looking sideways

//code for right eye
stroke(72, 55, 40);
strokeWeight(3);
fill(255);
beginShape();
vertex(580, 350);
bezierVertex(520, 340, 450, 350, 450, 450); //inner curve
bezierVertex(510, 460, 580, 450, 580, 350); //outer curve
endShape();

//right pupil
fill(72, 55, 40);
circle(525, 400, 80);
fill(38, 29, 21);
circle(535, 405, 50);

//code for nose
noStroke();
fill(252, 159, 159);
ellipse(400, 480, 50, 20);

//code for smile
noFill();
strokeWeight(5);
stroke(72, 55, 40);
bezier(350, 520, 375, 550, 425, 550, 450, 520);
