boolean gamePlaying = false;
boolean isGameOver = false;
boolean tick = false;
int points = 0;
int t;
int interval = 60;
int ms = 1;
int secondsPassed = 0;
String time = "60";

void setup() {
   size(400, 400);
   background(0);
   fill(255);
   noStroke();
   textAlign(CENTER);
   textSize(30);
}

void draw() {
  if (gamePlaying) { 
    background(150, 225, 255);
    fill(200, 255, 100);
    rectMode(CORNERS);
    rect(0, 251, 400, 400);
    fill(125, 125, 125);
    quad(mouseX + 20, mouseY + 50, mouseX - 20, mouseY + 50, width / 2 - 30, 400, width / 2 + 30, 400);
    fill(0);
    time = nf(t, 2);
    text(time, width / 2, 50);
    if (ms == 100) {
      t = interval - secondsPassed;
      secondsPassed = secondsPassed + 1;
      ms = 1;
    }
    ms = ms + 1;
    delay(1);
    if (t == 0) {
      gamePlaying = false;
      gameOver();
    }
  } else if (isGameOver) {
    background(0);
    fill(255);
    text("GAME OVER", width / 2, height / 2 - 50);
    text("Press SPACEBAR to play again", width / 2, height / 2 + 50);
  } if (gamePlaying == false && isGameOver == false) {
    text("Click & Press SPACEBAR to start", width / 2, height / 2);
  }
}

void keyPressed() {
  if (gamePlaying == false) {
    if (keyCode == 32) {
      t = interval;
      secondsPassed = 0;
      gameStart();
    }
  }
}

void mousePressed() {
  fill(255, 188, 0);
  circle(mouseX, mouseY, 40);
  fill(255, 255, 0);
  circle(mouseX, mouseY, 20);
}

void gameStart() {
  isGameOver = false;
  gamePlaying = true;
}

void gameOver() {
  isGameOver = true;
}
