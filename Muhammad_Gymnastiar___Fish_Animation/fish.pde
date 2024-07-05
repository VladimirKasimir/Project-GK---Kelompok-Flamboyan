class Fish {
  PImage[] frames = new PImage[8];
  int noFrames = 0;
  float x = random(-200, 1200);
  float y = random(100, 300);
  int direction = 1; // Default direction to right
  
  Fish() {
    noFrames = 0;
    if (random(1) > 0.5) {
      direction = -1; // Set direction to left randomly
    }
  }
  
  void addFrame(PImage frame) {
    frames[noFrames] = frame;
    noFrames++;
  }
  
  void move() {
    x = x + 5 * direction;
    if (x > width + 100 && direction == 1) {
      x = -250;
      y = random (100, 300);
    } else if (x < -250 && direction == -1) {
      x = width + 100;
      y = random (100, 300);
    }
    y = y + random(-2, 2);
  }
  
  void draw() {
    pushMatrix();
    translate(x + frames[frameCount % noFrames].width / 2, y + frames[frameCount % noFrames].height / 2); // Translate to the center of the image
    scale(-direction, 1); // Flip horizontally if direction is -1
    image(frames[frameCount % noFrames], -frames[frameCount % noFrames].width / 2, -frames[frameCount % noFrames].height / 2); // Draw image
    popMatrix();
  }
}
