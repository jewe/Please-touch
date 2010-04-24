class FlowSource {

  int NUM_PARTICLES  = 8000;
  PVector pos;
  float rot;
  float power; // 0..1
  float spread = .2;
  Particle[] particles;
  Boolean alive = true;
  int counter = 0;
  color c;
  
  FlowSource(PVector _pos, float _rot, float _power){ // rot=0 -> , rot=PI <-
    pos = _pos;
    rot = _rot;
    power = _power;
    // create particles
    particles = new Particle[NUM_PARTICLES];
    for (int i = 0; i < particles.length; i++) {
      particles[i] = initParticle();
    }
    c = color(random(230,245), random(230,245), random(220,255));
  }
  
  void draw(){
    if (alive){
      stroke(c);
      beginShape(LINES);
      for (int i = 0; i < particles.length; i++) {
      if (counter == i || particles[i].isDead()) particles[i] = initParticle();
        particles[i].step();
        particles[i].draw();
      }
      endShape();
    }
  }
  
  void step(){
    counter++;
    if (counter > NUM_PARTICLES) counter = 0;
  }
  
  void destroy(){
    alive = false;
  }
  
  Particle initParticle(){  
    PVector randomPos = pos.get();
    randomPos.add(new PVector( random(-20,20), random(-20,20), random(-20,20) ));
    PVector vel = new PVector( cos(rot)+random(-1*spread, spread), sin(rot)+random(-1*spread, spread), 0);
    vel.mult(power*5*random(1,4));
    PVector acc = new PVector( cos(rot)+random(-1*spread, spread), sin(rot)+random(-1*spread, spread), 0);
    acc.mult(power*1);
    
    return new Particle(randomPos, vel, acc, .5);
  }
}
