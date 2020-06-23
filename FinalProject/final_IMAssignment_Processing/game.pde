//-----------------------------------------------------------------------------------------------------------
// preGame() FUNCTION
//-----------------------------------------------------------------------------------------------------------

void preGame() {
  background(0);

  fill(253,255,0);

  textFont(crackman);
  textAlign(CENTER, CENTER);
  textSize(100);
  text("PAC-MAN", 410, 300);

  fill(219,133,28);
  textFont(pressStart);
  textSize(13);
  if (frameCount%20 < 10) {
    text("Rotate potentiometer to select difficulty", 410, 420);
  }

  fill(255);
  textSize(30);

  if (potInput == 0) {
    fill(70,191,238);
    gameLevel = "easy";
  } else {
    fill(255);
  }
  text("EASY", 210, 500);
  if (potInput == 1) {
    fill(208,62,25);
    gameLevel = "medium";
  } else {
    fill(255);
  }
  text("MEDIUM", 410, 500);
  if (potInput == 2) {
    fill(234,130,229);
    gameLevel = "hard";
  } else {
    fill(255);
  }
  text("HARD", 610, 500);
  if (potInput == 3) {
    fill(33, 33, 222);
    gameLevel = "expert";
  } else {
    fill(255);
  }
  text("EXPERT", 240, 580);
  if (potInput == 4) {
    fill(0,255,0);
    gameLevel = "impossible";
  } else {
    fill(255);
  }
  text("IMPOSSIBLE", 520, 580);
  
  if (switchInput != 0) {
    gameHasStarted = true;
  }
  
}

//-----------------------------------------------------------------------------------------------------------
// gameLoop() FUNCTION
//-----------------------------------------------------------------------------------------------------------

void gameLoop() {
  //background wiped every iteration of draw() so no duplicate images
  background(0); 

  if (gameLevel == "easy" && ghosts.size() > 2) {
    ghosts.remove(2);
  }
  
  if (gameLevel == "hard" && ghosts.size() < 5) {
    ghosts.add(new Ghost(9, 9));
    ghosts.add(new Ghost(9, 10));
  }
  
  if (gameLevel == "expert" && ghosts.size() < 5) {
    ghosts.add(new Ghost(9, 8));
    ghosts.add(new Ghost(9, 9));
    ghosts.add(new Ghost(10, 9));
    ghosts.add(new Ghost(10, 8));
  }
  
  if (gameLevel == "impossible" && ghosts.size() < 5) {
    ghosts.add(new Ghost(9, 8));
    ghosts.add(new Ghost(9, 9));
    ghosts.add(new Ghost(10, 9));
    ghosts.add(new Ghost(10, 8));
    ghosts.add(new Ghost(1, 1));
    ghosts.add(new Ghost(8, 1));
    ghosts.add(new Ghost(11, 1));
    ghosts.add(new Ghost(18, 1));
    ghosts.add(new Ghost(5, 5));
    ghosts.add(new Ghost(14, 5));
    ghosts.add(new Ghost(3, 10));
    ghosts.add(new Ghost(15, 10));
    ghosts.add(new Ghost(1, 18));
    ghosts.add(new Ghost(7, 18));
    ghosts.add(new Ghost(12, 18));
    ghosts.add(new Ghost(18, 18));
    
  }
  
  //hub at the bottom displays lives and score
  fill(255);
  textAlign(LEFT);
  textSize(25);
  text("LIVES: " + LIVES, 20, 840);
  text("SCORE: " + SCORE, 400, 840);

  for (int i = 0; i < walls.size(); i++) {
    walls.get(i).drawWall();
  }

  //if powerups are eaten make ghosts vulnerable
  for (int i = 0; i < powerup.size(); i++) {
    if (powerup.get(i).checkEaten(i)) {
      freezeFrame = makeGhostsVulnerable();
    }
    powerup.get(i).drawPowerup();
  }

  //after certain amount of time ghosts are not vulnerable anymore
  makeGhostsNotVulnerable(freezeFrame);

  //drawing food if food has not been eaten
  for (int i = 0; i < food.size(); i++) { 
    food.get(i).checkEaten(i);
    food.get(i).drawFood();
  }

  //drawing and moving pacman
  pacman.drawPacman(); 
  pacman.pacmanMoves();

  switch(switchInput) {
  case 1:
    pacman.pacmanChangeDirection("left");
    break;
  case 2:
    pacman.pacmanChangeDirection("up");
    break;
  case 3:
    pacman.pacmanChangeDirection("down");
    break;
  case 4:
    pacman.pacmanChangeDirection("right");
    break;
  }

  //drawing and moving ghosts
  for (int i = 0; i < ghosts.size(); i++) { 
    ghosts.get(i).drawGhost(i);
    ghosts.get(i).ghostMoves();
  }

  //ghosts change direction 5% of the time
  for (int i = 0; i < ghosts.size(); i++) { 
    if (ghosts.get(i).currentDirection == "none" || random(1) < 0.05) {
      ghosts.get(i).ghostChangeDirection();
    }
    if ((ghosts.get(i).xGrid == 9 || ghosts.get(i).xGrid == 10) && ghosts.get(i).yGrid == 10) {
      ghosts.get(i).ghostChangeDirection("up");
    }
  }

  scoring(); //updates score

  //checks for collision, instantiates new pacman if yes
  if (checkCollision() == 1 && (pacman.xGrid != 10 || pacman.yGrid != 12)) { 
    pacman = new Pacman(10, 12);
    LIVES--;
  }

  //checking lose condition (all lives gone) and loading end screen if true
  if (LIVES <= 0) { 
    final int endScore = SCORE;
    background(0);
    textSize(50);
    fill(255);
    text("YOU LOST", 200, 300);
    text("BETTER LUCK\n NEXT TIME!", 130, 400);
    textSize(30);
    text("SCORE: " + endScore, 245, 550);
    LIVES = 0;
    ghosts.get(0).drawGhost(0);
  }

  //checking win condition (all food eaten and lives > 0) and loading end screen if true
  if (checkWin()) { 
    background(0);
    ghosts.get(1).drawGhost(1);
    textSize(40);
    fill(255);
    text("CONGRATULATIONS!", 100, 300);
    text("YOU DEFEATED\n THE GHOSTS", 160, 400);
  }
}
