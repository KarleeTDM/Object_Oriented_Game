class Particle {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-2, 2), random(-2, 2));
    acceleration = new PVector(0, 0.5);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  void display() {
    fill(255, 188, 0);
    ellipse(position.x, position.y, 10, 10);
  }
  
  boolean finished() {
    if (position.y > height) {
      return true;
    } else {
      return false;
    }
  }
}
