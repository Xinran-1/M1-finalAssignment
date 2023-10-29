/*
This code defines a class, "Drippingwater," to simulate falling water drops' behavior.
*/
class Drippingwater {
  PVector initialPosition;    // Initial position of the water drop
  PVector waterPosition;       // Current position of the water drop
  float speed = random(1, 10);  // Speed at which the water drop falls
  float diameter = random(1, 20);  // Diameter of the water drop
  boolean drop_trigger = false;  // Indicates if the water drop has reached the bottom

  // Constructor to initialize the Drippingwater object
  Drippingwater(PVector position) {
    initialPosition = position.copy();
    waterPosition = position.copy();
  }
  
  // Display method to draw the water drop
  void display() {
    noStroke();  // No outline for the water drop
    fill(#3495eb);  // Fill color for the water drop
    circle(waterPosition.x, waterPosition.y, diameter);  // Draw the water drop as a circle
  }

  // Move method to update the position of the water drop
  void move() {
    waterPosition.y = waterPosition.y + speed;  // Update the Y position based on the falling speed
    if (waterPosition.y > height) {
      waterPosition = initialPosition.copy();  // Reset the position when the water drop reaches the bottom
      drop_trigger = true;  // Set the drop_trigger flag to indicate the water drop has reached the bottom
    }
  }
}
