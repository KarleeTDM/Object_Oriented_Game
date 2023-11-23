class Enemy {
  PVector location;
  
  Enemy(PVector l) {
    location = new PVector(l.x, l.y);
  }
  
  void display() {
    noStroke();
    fill(100);
    rectMode(CORNERS);
    rect(location.x - 15, location.y - 35, 35, 25);
    rect(location.x, location.y, 10, 10);
  }
}
