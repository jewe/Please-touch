import processing.opengl.*;


Ball[] ball;
CollisionDetection collisionDetection;
Boolean willBeInside;
PVector segment;
int NUM_BALLS = 20;

void setup() {
  size(800, 600, OPENGL);
  smooth();
  
  // create balls
  ball = new Ball[NUM_BALLS];
  for (int i=0;i<NUM_BALLS;i++) ball[i] = new Ball();
  
  // init collision detection
  collisionDetection = new CollisionDetection();
  
  // add polygone with multiple points
  CDPolygone polygone1 = collisionDetection.addPolygone();
  polygone1.addPoint(100,100);
  polygone1.addPoint(200,60);
  polygone1.addPoint(400,50);
  polygone1.addPoint(300,300);
  polygone1.addPoint(80,300);
 
  // add another polygone with multiple points 
  CDPolygone polygone2 = collisionDetection.addPolygone(); 
  polygone2.addPoint(500,30);
  polygone2.addPoint(600,50);
  polygone2.addPoint(680,80);
  polygone2.addPoint(700,150);
  
  // add another polygone with multiple points  
  CDPolygone polygone3 = collisionDetection.addPolygone(); 
  polygone3.addPoint(400,400); 
  polygone3.addPoint(600,430);
  polygone3.addPoint(600,550);
  polygone3.addPoint(550,600);
}

void draw() {
  fill(0, 20);
  rect(0,0,screen.width, screen.height);
  
  // draw polygones
  collisionDetection.draw();
  
  // for all balls: check for collision with all polygones
  for (int i=0;i<NUM_BALLS;i++) {
    willBeInside = collisionDetection.isInside(ball[i].nextPos());
    if (willBeInside){
      segment = collisionDetection.reflection(ball[i].pos, ball[i].vel);
      if (segment.x != 0 && segment.y != 0)
        ball[i].vel = segment;
    }
    
    // draw ball
    ball[i].draw(willBeInside ? 100 : 200);  
  }
}



