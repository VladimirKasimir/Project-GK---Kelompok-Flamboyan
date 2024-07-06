float angleX = 0;
float angleY = 0;
float colorOffset = 0;

void setup() {
  size(400, 400, P3D);
}

void draw() {
  // Menghitung warna latar belakang berdasarkan waktu atau frame count
  color from = color(255, 192, 203);  // Pink
  color to = color(128, 0, 0);        // Merah maroon
  color interColor = lerpColor(from, to, map(sin(colorOffset), -1, 1, 0, 1));
  background(interColor);
  
  translate(width/2, height/2);
  rotateY(angleY);
  rotateX(angleX);
  
  fill(255, 210, 10);
  drawTorus(100, 30);
  
  angleX += 0.02;
  angleY += 0.01;
  colorOffset += 0.02;  // Atur kecepatan perubahan warna di sini
}

void drawTorus(float r1, float r2) {
  float detail = 0.1;
  beginShape(QUAD_STRIP);
  for (float theta = 0; theta <= TWO_PI; theta += detail) {
    for (float phi = 0; phi <= TWO_PI; phi += detail) {
      float x = (r1 + r2 * cos(theta)) * cos(phi);
      float y = (r1 + r2 * cos(theta)) * sin(phi);
      float z = r2 * sin(theta);
      vertex(x, y, z);
      x = (r1 + r2 * cos(theta + detail)) * cos(phi);
      y = (r1 + r2 * cos(theta + detail)) * sin(phi);
      z = r2 * sin(theta + detail);
      vertex(x, y, z);
    }
  }
  endShape();
}
