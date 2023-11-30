class Enemy {
  
  float enemyX;
  float enemyY;
  
  void relocate() {
    enemyX = random(0, width);
    enemyY = 251;
  }
  
  void display() {
    noStroke();
    fill(0);
    rectMode(CENTER);
    // Head
    rect(enemyX, enemyY - 35, 35, 35);
    // Eyes
    fill(255, 0, 0);
    rect(enemyX - 5, enemyY - 35, 5, 5);
    rect(enemyX + 5, enemyY - 35, 5, 5);
    // Torso
    fill(0);
    rect(enemyX, enemyY - 10, 25, 25);
    // Arms
    rect(enemyX - 20, enemyY - 15, 20, 5);
    rect(enemyX + 20, enemyY - 15, 20, 5);
    // Legs
    rect(enemyX - 7, enemyY + 15, 10, 25);
    rect(enemyX + 7, enemyY + 15, 10, 25);
  }
}
