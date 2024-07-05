class Amogus {
  PImage[] frames;
  int noFrames;
  float x;
  float y;
  int direction;  // 1 for right, -1 for left
  
  Amogus(PImage[] frames) {
    this.frames = frames;
    this.noFrames = frames.length;
    this.x = random(-200, 1200);
    this.y = random(150, 300);
    this.direction = random(1) > 0.5 ? 1 : -1;  // Randomly assign direction
  }
  
  void move() {
    x += 5 * direction;
    if (x > width + 100 && direction == 1) {
      x = -250;
      y = random(150, 300);
    } else if (x < -250 && direction == -1) {
      x = width + 100;
      y = random(170, 300);
    }
    y += random(-2, 2);
  }
  
  void draw() {
    if (noFrames > 0) {
      pushMatrix();
      if (direction == -1) {
        scale(-1, 1);  // Flip the image horizontally
        image(frames[frameCount % noFrames], -x - frames[0].width, y);
      } else {
        image(frames[frameCount % noFrames], x, y);
      }
      popMatrix();
    }
  }
}
