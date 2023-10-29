/*
This class contains the faucet, contour, and closing elements.
Because these elements all belong to the background effect and need to have
a rising effect, they are placed in a class. Because a rising effect needs 
to be created, the y-axis of each pattern needs to be moved.
*/
class Background{
  Background(){
  }
 
  // Faucet method to draw the elements of a faucet
 void Faucet() {
    noStroke();
    fill(0, 104, 139);

    rect(250, 350 - move, 300, 75);    // Middle horizontal pillar
    circle(405, 387 - move, 150);    // Middle circle
    circle(250, 387 - move, 75);
    rect(213, 387 - move, 75, 100);

    rect(360, 290 - move, 90, 20);
    circle(360, 300 - move, 20);
    circle(450, 300 - move, 20);

    rect(395, 200 - move, 20, 80);
    rect(355, 200 - move, 100, 20);
    circle(355, 210 - move, 20);
    circle(455, 210 - move, 20);
  }
 // Contour method to draw the contour and circles
 void contour() {
    fill(0, 104, 139);
    rect(0, 0 - move, width, height);
    noStroke();
    fill(200, 0, 0);
    circle(390, 378 - move, 600);

    noStroke();
    fill(255, 255, 255);
    circle(390, 380 - move, 500);
  }
  // EndingWord method to display a red rectangle and text
  void endingWord() {
    noStroke();
    fill(200, 0, 0);
    rect(100, 328 - move, 580, 100);

    fill(255);
    textSize(40);
    text("BE DRIP NOT DROUGHT!", 180, 390-move);
  }
}
