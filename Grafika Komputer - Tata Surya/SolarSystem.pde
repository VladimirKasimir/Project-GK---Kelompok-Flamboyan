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

  // Tells camera to look at center of world from 400 units away
  cam = new PeasyCam(this, 400); 
  sun = new Planet(50, 0, 0, sunTexture);
  spawnPlanets();
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

void spawnPlanets() {
  for (int i = 0; i < textures.length; i++) {
    float r = 20;
    float d = (i + 1) * 100; // Distance from the sun
    float o = random(-0.02, 0.02); // Orbit speed
    Planet planet = new Planet(r, d, o, textures[i]);
    sun.addPlanet(planet);
  }
}

class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets;
  float orbitSpeed;
  PShape globe;

  Planet(float r, float d, float o, PImage img) {
    radius = r;
    distance = d;
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

  void addPlanet(Planet planet) {
    if (planets == null) {
      planets = new Planet[1];
      planets[0] = planet;
    } else {
      Planet[] temp = new Planet[planets.length + 1];
      arrayCopy(planets, temp);
      temp[planets.length] = planet;
      planets = temp;
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    fill(200, 220, 255);
    PVector position = new PVector(cos(angle) * distance, sin(angle) * distance, 0); // Update position based on angle
    translate(position.x, position.y, position.z);
    shape(globe);
    popMatrix();

    // Show orbit paths
    noFill();
    stroke(255, 50); // Set the orbit path color
    pushMatrix();
    rotateX(CENTER); // Rotate the ellipse to make it horizontal
    ellipse(0, 0, distance * 2, distance * 2);
    popMatrix();
    
    // Show child planets
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
  }
}
