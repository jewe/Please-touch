class Ball{
  PVector pos;
  PVector vel;
  float r;
  
  Ball() {
    this.pos = new PVector();
    this.vel = new PVector(random(1,10), random(1,10));
    this.r = 5;
  }
  
  void draw(int c){
    checkBoundaryCollision(); // screen bounds
    
    pos = nextPos();
    
    // circle
    fill(c,50);
    stroke(100);
    ellipse(pos.x, pos.y, r*2, r*2);
    
    // line to show velocity
    stroke(25);
    PVector np = PVector.add(pos, PVector.mult(vel, 30));
    line(pos.x, pos.y, np.x, np.y);
  }
  
  // calculate next position
  PVector nextPos(){
    return PVector.add(pos,vel);
  }
  
  // reflect ball on screen-boundaries
  void checkBoundaryCollision() {
    if (pos.x > width-r) {
      pos.x = width-r;
      vel.x *= -1;
    } 
    else if (pos.x < r) {
      pos.x = r;
      vel.x *= -1;
    } 
    else if (pos.y > height-r) {
      pos.y = height-r;
      vel.y *= -1;
    } 
    else if (pos.y < r) {
      pos.y = r;
      vel.y *= -1;
    }
  }


}
