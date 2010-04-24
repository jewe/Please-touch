
// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  println("add object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
  
  if (tobj.getSymbolID() > 0 && tobj.getSymbolID() < 4){
    // flowsources 1,2,3
    float power = .3;
    switch (tobj.getSymbolID()) {
      case 1: power = .3;break;
      case 2: power = .5;break;
      case 3: power = .8;break;
    }
    flowSources[tobj.getSymbolID()-1] = new FlowSource(new PVector(tobj.getX()*SCREENWIDTH, tobj.getY()*SCREENHEIGHT, 0), tobj.getAngle(), power);
  } else if (tobj.getSymbolID() > 3 && tobj.getSymbolID() < 7){
    // attractors 4,5,6
    attractors[tobj.getSymbolID()-4] = new Attractor(new PVector(tobj.getX()*SCREENWIDTH, tobj.getY()*SCREENHEIGHT, 0), tobj.getAngle()-PI);
  
  }
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
  
  if (tobj.getSymbolID() > 0 && tobj.getSymbolID() < 4) flowSources[tobj.getSymbolID()-1].destroy();
  else if (tobj.getSymbolID() > 3 && tobj.getSymbolID() < 7) attractors[tobj.getSymbolID()-4].destroy();
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  println("update object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
          +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
  if (tobj.getSymbolID() > 0 && tobj.getSymbolID() < 4){
    // flowsources 1,2,3
    flowSources[tobj.getSymbolID()-1].pos = new PVector(tobj.getX()*SCREENWIDTH, tobj.getY()*SCREENHEIGHT, 0);
    flowSources[tobj.getSymbolID()-1].rot = tobj.getAngle();
  } else if (tobj.getSymbolID() > 3 && tobj.getSymbolID() < 7){
    // attractors 4,5,6
    attractors[tobj.getSymbolID()-4].pos = new PVector(tobj.getX()*SCREENWIDTH, tobj.getY()*SCREENHEIGHT, 0);
    attractors[tobj.getSymbolID()-4].setForce( tobj.getAngle()-PI );
  }  
}

// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
  println("add cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  println("update cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
          +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  println("remove cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
}

// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  redraw();
}
