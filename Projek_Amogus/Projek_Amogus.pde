PImage bg;
PImage[] amogus = new PImage[12];
Amogus[] amogusArray;
int maxNoAmogus = 5;

void setup() {
  size(1000, 600);
  smooth();
  bg = loadImage("cafetaria.jpeg");

  // Load frames
  amogus[0] = loadImage("giphy0.gif");
  amogus[1] = loadImage("giphy1.gif");
  amogus[2] = loadImage("giphy2.gif");
  amogus[3] = loadImage("giphy3.gif");
  amogus[4] = loadImage("giphy4.gif");
  amogus[5] = loadImage("giphy5.gif");
  amogus[6] = loadImage("giphy6.gif");
  amogus[7] = loadImage("giphy7.gif");
  amogus[8] = loadImage("giphy8.gif");
  amogus[9] = loadImage("giphy9.gif");
  amogus[10] = loadImage("giphy10.gif");
  amogus[11] = loadImage("giphy11.gif");

  // Initialize the Amogus array
  amogusArray = new Amogus[maxNoAmogus];
  for (int i = 0; i < maxNoAmogus; i++) {
    amogusArray[i] = new Amogus(amogus);
  }

  frameRate(10);
}

void draw() {
  image(bg, 0, 0, width, height);
  for (Amogus amogusInstance : amogusArray) {
    amogusInstance.move();
    amogusInstance.draw();
  }
}
