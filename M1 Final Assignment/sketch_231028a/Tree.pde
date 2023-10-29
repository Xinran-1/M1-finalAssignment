/*
This class is used to grow numbers. This class is called when there is enough water. 
Meaning wasted water could be used to allow many trees to grow better
*/
class Tree {
  // Position
  float posX, posY;
  
  // Current values
  float scale=.1;
  float stemHeight=10;
  
  // Fixed values
  float spread=10;
  int branch=2;
  int maxDepth=10; 

  // Growing targets
  float maxScale=.7;
  float maxStemHeight=500;

  // Growing speed
  float growScale = 1.0 / 60;
  float growStemHeight = 3.0 / 60; 

  float getPosX() {return posX;}
  float getPosY() {return posY;}

  Tree(float x, float y) {
    posX=x;
    posY=y;
  }
  
  void randomInit() {    // Random initialization of tree attributes
    branch=int(random(2,4));
    maxDepth = int(log(2000)/log(branch));
    
    spread = random(5,60);
    
    maxScale = random(.4,.7);
    scale = maxScale/10;
    growScale=maxScale/60/10;
    
    maxStemHeight = random(200,.1*width);
    stemHeight = maxStemHeight/10;
    growStemHeight = maxStemHeight/60/10; 
  }
  
   // Recursive method to draw the tree structure
  void drawTree(PVector pos, PVector heading, int d) {
    if (heading.mag()<5 || d>maxDepth) return;
    
    PVector newPos = pos.copy().add(heading);
    
    color c = lerpColor(#672D00,#00FF00,d*1.0/maxDepth);
    
    stroke(c);
//    strokeWeight(1.5*(maxDepth-d));
    strokeWeight(max(1,.1*heading.mag()));
    line(pos.x,pos.y,newPos.x,newPos.y);
  
    PVector newHeading = heading.copy().mult(scale).rotate(radians(-spread));
    
    for (int i=0; i<branch; ++i) {
      drawTree(newPos,newHeading,d+1);
      newHeading.rotate(radians(2*spread / (branch-1)));
    }
  }
  
  void display() {    // Display method to draw the tree
    drawTree(new PVector(posX,posY),new PVector(0,-stemHeight),0);
  }

  void tick() {    // Tick method to simulate tree growth
    stemHeight = min(stemHeight+growStemHeight, maxStemHeight);
    scale = min(scale+growScale, maxScale);
  }


}
