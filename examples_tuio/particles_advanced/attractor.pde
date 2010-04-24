class Attractor {
  PVector pos;
  float lastF;
  float f; // force
  
  float r = 120;
  Boolean alive = true;
  
  Attractor(PVector _pos, float _f) {
    pos = _pos;
    setForce(_f);
  }
  
  void setForce(float _f){
    f = _f/20;
  }
  
  void draw() {
    if (alive){
      // dynamic (f)
      fill(150,0,0);
      noStroke();
      beginShape();
      float f2 = f*200;
      for (float i = 0; i < TWO_PI; i+=PI/5) {
        vertex(pos.x+cos(i)*(r+f2),  pos.y+sin(i)*(r+f2), pos.z);
      }
      endShape();
      
      
      // static
      fill(250,50);
      noStroke();
      beginShape();
      for (float i = 0; i < TWO_PI; i+=PI/5) {
        vertex(pos.x+cos(i)*r,  pos.y+sin(i)*r, pos.z);
      }
      endShape();
    }
  }
  
  void setF(float _f) {
    if (f != 0) lastF = f;
    f = _f;
  }
  
  void destroy(){
    alive = false;
  }
  
}
