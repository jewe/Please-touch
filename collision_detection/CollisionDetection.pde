class CollisionDetection{
  
  ArrayList polygones;
  CDPolygone lastCollision;
  
  CollisionDetection(){
    polygones = new ArrayList();
  }
  
  // add new polygone to screen
  CDPolygone addPolygone(){
    CDPolygone polygone = new CDPolygone();
    polygones.add(polygone);
    return polygone;
  }
  
  // draw all polygones
  void draw(){
    for (int i = 0; i < polygones.size(); i++) { 
      CDPolygone polygone = (CDPolygone) polygones.get(i);
      polygone.draw();
    }
  }
  
  // for all polygones: check if p in polygone
  Boolean isInside(PVector p){
    lastCollision = null;
    for (int i = 0; i < polygones.size(); i++) { 
      CDPolygone polygone = (CDPolygone) polygones.get(i);
      Boolean isInside = polygone.isInside(p);
      if (isInside) {
        lastCollision = polygone;
        return true;
      }
    }    
    return false;
  }
  
  // calculate reflection on last collision segment for pos with vel
  // pos is outside the polygone, pos+vel is inside
  PVector reflection(PVector pos, PVector vel){
    PVector segment = new PVector();
    if (lastCollision != null){
      if (!lastCollision.isInside(pos)){
        
        // mark segment of polygone
        stroke(255,0,0);
        strokeWeight(5);
        line(lastCollision.lastCollisionP1.x, lastCollision.lastCollisionP1.y, lastCollision.lastCollisionP2.x, lastCollision.lastCollisionP2.y);
        strokeWeight(1);
        segment = PVector.sub(lastCollision.lastCollisionP2, lastCollision.lastCollisionP1);
 
        PVector nextPos = PVector.add(pos,vel);
        
        // show perpendicular-line
        stroke(0,0,200);
        PVector l = PVector.add(nextPos, invert(segment)); // perpendicular-line: nextPos-l
        line(nextPos.x, nextPos.y, l.x, l.y);
        PVector r = reflect(pos, nextPos, l); // pos reflected on perpendicular-line
        
        PVector ret = PVector.sub(r, nextPos);
        
        // show first reflection path
        stroke(0,100,0);
        line(nextPos.x, nextPos.y, r.x, r.y);
        
        return ret;
      }
      return new PVector();
    }
    return new PVector();
  }
  
  // perpendicular-line of a
  PVector invert(PVector a){
    return new PVector(a.y, -a.x);
  }
  
  // reflect p on line
  PVector reflect(PVector p, PVector lineStart, PVector lineEnd){
    
    PVector diff = PVector.sub(lineEnd, lineStart);
    PVector diff2 = PVector.sub(lineEnd, p);
    
    diff.normalize();
    diff.mult(PVector.dot(diff2,diff));
    
    PVector perp = PVector.sub(diff2, diff);
    perp.mult(2);
    return PVector.add(p, perp);
  }
  
}
