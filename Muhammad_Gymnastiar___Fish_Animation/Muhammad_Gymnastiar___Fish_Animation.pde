PImage bg;
PImage[] fish = new PImage[8]; // Changed array size to match the number of frames
Fish[] fishArray;
int maxNoFish = 5;

void setup() {
  size(1000, 600);
  smooth();
  bg = loadImage("Lautan.jpg");

  // Load frames
  fish[0] = loadImage("fish0.gif");
  fish[1] = loadImage("fish1.gif");
  fish[2] = loadImage("fish2.gif");
  fish[3] = loadImage("fish3.gif");
  fish[4] = loadImage("fish4.gif");
  fish[5] = loadImage("fish5.gif");
  fish[6] = loadImage("fish6.gif");
  fish[7] = loadImage("fish7.gif");

  // Initialize the Fish array
  fishArray = new Fish[maxNoFish];
  for (int i = 0; i < maxNoFish; i++) {
    fishArray[i] = new Fish();
    for (int j = 0; j < fish.length; j++) {
      fishArray[i].addFrame(fish[j]);
    }
  }

  frameRate(10);
}

void draw() {
  image(bg, 0, 0, width, height);
  for (Fish fishInstance : fishArray) {
    fishInstance.move(); // Change method name from moveP to move
    fishInstance.draw();
  }
}
