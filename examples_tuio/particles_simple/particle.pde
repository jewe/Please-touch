class Particle {

  // location and velocity
  PVector pos, vel, acc;
  float damp = 0.99;
  float mass;
  boolean isOutside;

  Particle(PVector _pos, PVector _vel, PVector _acc, float _m) {
    pos = _pos;
    vel = _vel;
    acc = _acc;
    mass = _m;
    isOutside = true;
  }
  
  void step() {
    vel.add(acc);
    vel.mult(damp);
    
    // set position
    pos.add(vel);
  }
  
  Boolean isDead(){
    // set dead if very slow or outside the screen
    return (vel.mag() < 10 || pos.x < 0 || pos.x > SCREENWIDTH || pos.y < 0 || pos.y > SCREENHEIGHT);
  } 
   
  void draw() { 
     vertex(pos.x, pos.y, pos.z);
     vertex(pos.x+vel.x/2, pos.y+vel.y/2, pos.z+vel.z/2);
  }
}
