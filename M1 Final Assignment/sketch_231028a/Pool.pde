/*
The "Pool" class maintains water level and provides a method to display a pool
Pond water level rises as water drops fall
*/
class Pool {
  float waterLevel = height;  // Initial water level at the canvas height 

  // Display method to draw the pool with a blue color
  void display() {
    fill(#3495eb);  // Blue color fill
    rect(0, waterLevel - move, width, height - waterLevel);  // Draw the pool Pool 
  }
}
