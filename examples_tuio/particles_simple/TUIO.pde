// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  println("add object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  
  flowSources[0] = new FlowSource(new PVector(tobj.getX()*SCREENWIDTH, tobj.getY()*SCREENHEIGHT, 0), tobj.getAngle());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
  
  flowSources[0].destroy();
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  println("update object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  
  flowSources[0].pos = new PVector(tobj.getX()*SCREENWIDTH, tobj.getY()*SCREENHEIGHT, 0);
  flowSources[0].rot = tobj.getAngle(); 
}

