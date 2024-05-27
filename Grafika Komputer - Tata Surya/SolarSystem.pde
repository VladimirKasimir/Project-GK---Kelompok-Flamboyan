import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

// PeasyCam automatically adds mouse interaction to your 3D image
Planet sun;

PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[6];
PImage galaxyBackground;

void setup() {
  // Renders animation in Processing's 3D generating software
  size(600, 600, P3D);
  galaxyBackground = loadImage("galaxy.jpg");  
  if (galaxyBackground == null) {
    println("Error loading galaxy.jpg");
    exit();
  }
  galaxyBackground.resize(width, height);
  
  sunTexture = loadImage("sun.jpg");
  if (sunTexture == null) {
    println("Error loading sun.jpg");
    exit();
  }
  textures[0] = loadImage("neptune.jpg");
  textures[1] = loadImage("earth.jpg");
  textures[2] = loadImage("mars.jpg");
  textures[3] = loadImage("planet.jpeg");
  textures[4] = loadImage("bright.jpeg");
  textures[5] = loadImage("tyedye.jpeg");

  // Tells camera to look at center of world from 100 units away
  cam = new PeasyCam(this, 400); 
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(4, 1);
}

void draw() {
  background(galaxyBackground);
  spotLight(100, 102, 126, 80, 80, 40, -1, 0, 0, PI / 2, -10);
  ambientLight(15, 15, 15);
  spotLight(100, 102, 126, 80, 80, 40, -1, 0, 0, PI / 2, -10);
  lights(); // Helps give 3D look to canvas (adds generic wash of light)
  pointLight(110, 110, 110, 0, 0, 0);
  sun.show();
  sun.orbit();
}

class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets;
  float orbitSpeed;
  PVector v;
  PShape globe;

  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D(); // Make unit vector of length 1 from planet
    radius = r;
    distance = d;
    v.mult(distance); // Scale unit vector
    angle = random(TWO_PI); // Random based on 2pi radians
    orbitSpeed = o;
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }

  void orbit() {
    angle += orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }

  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius / (level + 0.6);
      float d = random((radius + r) * 3, (radius + r) * 6); // Increase distance range
      float o = random(-0.02, 0.02);
      int index = int(random(0, textures.length));
      planets[i] = new Planet(r, d, o, textures[index]);
      if (level < 4) {
        int num = int(random(0, 4));
        planets[i].spawnMoons(num, level + 1);
      }
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    fill(200, 220, 255);
    PVector v2 = new PVector(1, 0, 1); // Arbitrary vector
    PVector p = v.cross(v2); // Cross product to create perpendicular vector
    rotate(angle, p.x, p.y, p.z);
    translate(v.x, v.y, v.z);
    shape(globe);

    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}
