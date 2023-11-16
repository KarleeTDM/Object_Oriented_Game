boolean gamePlaying = false;
boolean isGameOver = false;
boolean tick = false;
int points = 0;
int t;
int interval = 60;
int secondsPassed = 0;
String time = "60";

void setup() {
   size(400, 400);
   background(150, 225, 255);
   fill(0);
   textAlign(CENTER);
   textSize(30);
}

void draw() {
  if (gamePlaying) { 
    background(150, 225, 255);
    fill(0);
    t = interval - secondsPassed;
    secondsPassed = secondsPassed + 1;
    time = nf(t, 2);
    text(time, width / 2, 50);
    delay(1000);
    if (t == 0) {
      gamePlaying = false;
      gameOver();
    }
  } else if (isGameOver) {
    background(0);
    fill(255);
    text("GAME OVER", width / 2, height / 2);
  } if (gamePlaying == false && isGameOver == false) {
    text("Press SPACEBAR to start", width / 2, height / 2);
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

void gameStart() {
  isGameOver = false;
  gamePlaying = true;
}

void gameOver() {
  isGameOver = true;
}
