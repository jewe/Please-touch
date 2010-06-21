class CDPolygone{
  
  ArrayList points;
  PVector lastCollisionP1;
  PVector lastCollisionP2;
  
  
  CDPolygone(){
    points = new ArrayList();
  }
  
  void addPoint(int x, int y){
    points.add(new PVector(x,y));
  }
  
  void draw(){
    stroke(100);
    for (int i = 0; i < points.size(); i++) { 
      PVector p1 = (PVector) points.get(i);
      int next = (i < points.size()-1) ? i+1 : 0;
      PVector p2 = (PVector) points.get(next);
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
  
  Boolean isInside(PVector p){
    lastCollisionP1 = null;
    lastCollisionP2 = null;
    
    for (int i = 0; i < points.size(); i++) { 
      PVector p1 = (PVector) points.get(i);
      int next = (i < points.size()-1) ? i+1 : 0;
      PVector p2 = (PVector) points.get(next);
      
      float result = (p.y - p1.y)*(p2.x - p1.x) - (p.x - p1.x)*(p2.y - p1.y);
      if (result < 0) { // on left side
        lastCollisionP1 = p1;
        lastCollisionP2 = p2;
        return false;
      }
    }
    return true;
  }
 
}
