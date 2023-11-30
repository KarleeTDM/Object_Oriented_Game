import processing.sound.*;

Enemy enemy = new Enemy();
ArrayList<Particle> particles;
boolean gamePlaying = false;
boolean isGameOver = false;
boolean tick = false;
float d;
int b;
int g;
int points = 0;
int t;
int interval = 60;
int ms = 1;
int r;
int secondsPassed = 0;
int y = 0;
PImage img;
PVector enemyPVector;
PVector mousePVector;
SoundFile flame;
SoundFile music;
String time = "60";

void setup() {
   size(400, 400);
   flame = new SoundFile(this, "Flamethrower_Sound_Effect.mp3");
   img = loadImage("Karlee_8bit.png");
   music = new SoundFile(this, "Game_Music.mp3");
   particles = new ArrayList<Particle>();
   background(0);
   fill(255);
   noStroke();
   textAlign(CENTER);
   textSize(30);
}

void draw() {
  y = 0;
  if (gamePlaying) {
    r = 150 + (mouseY / 2);
    b = 255 - (mouseY / 2);
    background(r, g, b);
    // Drawing the sun
    while (y < height) {
      if (mouseY < 1) {
        y = y + 1;
      } else {
        y = y + mouseY;
      }
      fill(255, 255, 100);
      ellipse(width / 2, 250, y / 4, y / 4);
    }
    // Drawing the field
    fill(200, 255, 100);
    rectMode(CORNERS);
    rect(0, 251, 400, 400);
    // Drawing the enemy
    enemy.display();
    // Drawing the PVector enemy
    enemyPVector = new PVector(enemy.enemyX, enemy.enemyY);
    enemyPVector.limit(400);
    noStroke();
    fill(0, 50);
    rectMode(CENTER);
    // Head
    rect(enemyPVector.x, enemyPVector.y - 35, 35, 35);
    // Eyes
    fill(255, 0, 0, 50);
    rect(enemyPVector.x - 5, enemyPVector.y - 35, 5, 5);
    rect(enemyPVector.x + 5, enemyPVector.y - 35, 5, 5);
    // Torso
    fill(0, 50);
    rect(enemyPVector.x, enemyPVector.y - 10, 25, 25);
    // Arms
    rect(enemyPVector.x - 20, enemyPVector.y - 15, 20, 5);
    rect(enemyPVector.x + 20, enemyPVector.y - 15, 20, 5);
    // Legs
    rect(enemyPVector.x - 7, enemyPVector.y + 15, 10, 25);
    rect(enemyPVector.x + 7, enemyPVector.y + 15, 10, 25);
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
    if (mousePressed) {
      mousePVector = new PVector(mouseX, mouseY);
      d = PVector.dist(enemyPVector, mousePVector);
      if (d <= 50) {
        points = points + 1;
        println(enemyPVector);
        enemy.relocate();
      }
      fill(255, 188, 0);
      circle(mouseX, mouseY, 60);
      fill(255, 255, 0);
      circle(mouseX, mouseY, 30);
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
    image(img, -75, 100);
    text("Click & Press SPACEBAR to start", width / 2, height / 2 - 100);
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
  circle(mouseX, mouseY, 60);
  fill(255, 255, 0);
  circle(mouseX, mouseY, 30);
  if (gamePlaying) {
    flame.loop();
  }
}

void mouseReleased() {
  flame.pause();
}

void gameStart() {
  isGameOver = false;
  points = 0;
  enemy.relocate();
  r = 150;
  g = 225;
  b = 255;
  gamePlaying = true;
  println("The game is starting!");
  music.loop();
}

void gameOver() {
  isGameOver = true;
  println("The game is over!");
  music.pause();
}
