class Triangle {
  float x = 0;
  float y = 0;
  float rotate = 0;
  float size = 200;

  boolean isFilled = false;
  color fill = color(220);

  float weight = 0;
  color stroke = color(220);

  Triangle (float nx, float ny) {
    x = nx;
    y = ny;
  }

  void draw() {
    noStroke();
    noFill();

    if (weight > 0) {
      stroke(stroke);
      strokeWeight(weight);
    }

    if (isFilled) {
      fill(fill);
    }

    pushMatrix();
    translate(x, y);
    rotate(rotate);

    float a = sin(PI / 3) * size;
    float b = cos(PI / 3) * size;

    triangle(0, -size, a, b, -a, b);

    popMatrix();
  }
}