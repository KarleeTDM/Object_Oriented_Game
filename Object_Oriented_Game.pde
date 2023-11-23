Enemy enemy = new Enemy();
ArrayList<Particle> particles;
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
   particles = new ArrayList<Particle>();
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
    // Drawing the enemy
    enemy.display();
    // Drawing the gun
    fill(125, 125, 125);
    rectMode(CORNERS);
    quad(mouseX + 20, mouseY + 50, mouseX - 20, mouseY + 50, width / 2 - 30, 400, width / 2 + 30, 400);
    // Drawing the particles
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle part = particles.get(i);
      particles.get(i).update();
      particles.get(i).display();
      if (part.finished()) {
        particles.remove(i);
      }
    }
    if (mousePressed == true) {
      if (mouseX >= enemy.enemyX - 25 && mouseX <= enemy.enemyX + 25 && mouseY >= enemy.enemyY - 25 && mouseY <= enemy.enemyY + 25) {
        points = points + 1;
        enemy.relocate();
      }
      fill(255, 188, 0);
      circle(mouseX, mouseY, 40);
      fill(255, 255, 0);
      circle(mouseX, mouseY, 20);
      particles.add(new Particle(mouseX, mouseY));
    }
    // Drawing the timer
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
    text(points, width / 2, height / 2);
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
  points = 0;
  enemy.relocate();
  gamePlaying = true;
  println("The game is starting!");
}

void gameOver() {
  isGameOver = true;
  println("The game is over!");
}
