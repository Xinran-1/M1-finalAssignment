/*
Xinran Zhi 2874595
Chen 3100464
The canvas shows water drops dripping from a faucet. 
As the water keeps dripping, a small pool appears below and the 
water level gets higher and higher. Finally, when the water level reaches a certain level, the water begins to seep into the ground and grow into trees. 
If you tighten the faucet before the water level reaches a certain level, the end prompt will appear.
*/
import java.util.Arrays;
import processing.sound.*;

SoundFile SF;
Background bg;
Pool pool;
Drippingwater[] drop = new Drippingwater[10];
Tree trees[] = new Tree[15];
boolean isEnd=false;
boolean waterDropping = true;
boolean isMove = true;
float move=0;

void setup() {
  size(800, 800);
  bg = new Background();
  pool=new Pool();
  SF= new SoundFile(this,"../Sound/dripping-water.mp3");
  randomInit();
  for (int i = 0; i < drop.length; i++) {
    drop[i] = new Drippingwater(new PVector(250,387));
  }
  SF.play();
}

void draw() {
  background(#fcfcfc);
  bg.contour();
  bg.Faucet();
  if(isEnd){
    bg.endingWord();
  }else{
      if(pool.waterLevel>630 && waterDropping){
        for (int i = 0; i < drop.length; i++) {
          drop[i].display();
          drop[i].move();
        }
        pool.display();
        pool.waterLevel-=0.1;
      }
      
      if(pool.waterLevel<=630 && move <height-50 ){
        move+=1;
        pool.display();
 
        for (int i = 0; i < drop.length; i++) {
          if (drop[i].drop_trigger) {
          drop[i] = new Drippingwater(new PVector(400, height-move));
          drop[i].drop_trigger = false;  
          }  
        }
        
        for (int i = 0; i < drop.length; i++) {
          drop[i].display();
          drop[i].move();
        }
      }
      
      else if( pool.waterLevel<=630 && move>=height-100 ){
         fill(#3495eb);
         rect(0,0,width,50);
        for (Tree t : trees) {
          t.display();
          t.tick();
        }
      }
  }
      
}
void mousePressed() {
  float distance = dist(mouseX, mouseY, 405, 240);
  isEnd = false;
  if (distance < 50) {
    waterDropping = false;
    isEnd = true;
    SF.stop();
  }
}

void randomInit() {
  for (int i=0;i<trees.length;++i) {
    trees[i] = new Tree(random(width),random(200,height));
    trees[i].randomInit();
  }

  // Sort by y position, such that trees in front are drawn later
  Arrays.sort(trees, (t1,t2) -> Float.compare(t1.getPosY(),t2.getPosY()));
}
