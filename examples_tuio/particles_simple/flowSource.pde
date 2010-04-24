class FlowSource {

  int NUM_PARTICLES  = 3000;
  PVector pos;
  float rot;
  float spread = .2;
  Particle[] particles;
  Boolean alive;
  
  FlowSource(PVector _pos, float _rot){ // rot=0 -> , rot=PI <-
    pos = _pos;
    rot = _rot;
    alive = true;
    
    // create particles
    particles = new Particle[NUM_PARTICLES];
    for (int i = 0; i < particles.length; i++) {
      particles[i] = initParticle();
    }
  }
  
  void draw(){
    if (alive){
      stroke(200);
      beginShape(LINES);
      for (int i = 0; i < particles.length; i++) {
        if (particles[i].isDead()) particles[i] = initParticle();
        particles[i].step();
        particles[i].draw();
      }
      endShape();
    }
  }
  
  void step(){
    
  }
  
  void destroy(){
    alive = false;
  }
  
  Particle initParticle(){  
    PVector randomPos = pos.get();
    randomPos.add(new PVector( random(-20,20), random(-20,20), random(-20,20) ));
    PVector vel = new PVector( cos(rot)+random(-1*spread, spread), sin(rot)+random(-1*spread, spread), 0);
    vel.mult(5*random(1,4));
    PVector acc = new PVector( cos(rot)+random(-1*spread, spread), sin(rot)+random(-1*spread, spread), 0);
    acc.mult(1);
    
    return new Particle(randomPos, vel, acc, .5);
  }
}
