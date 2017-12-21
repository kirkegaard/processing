float n = 75;
float nx = 500/n;

void setup() {
  size(500, 500);
  frameRate(60);
  background(0);
  stroke(255);
  noFill();
}

ArrayList poly(float x, float y, float sides, float r) {
  ArrayList <PVector> points = new ArrayList <PVector> ();

  for (int i = 0; i < sides; ++i) {
    float xx = x + cos(TWO_PI / sides * i) * (r);
    float yy = y + sin(TWO_PI / sides * i) * (r);
    points.add(new PVector(xx, yy));
  }

  return points;
}

void drawPoly(ArrayList ply) {
  for (int i = 0 ; i< ply.size() - 1; i++) {
    PVector s = (PVector) ply.get(i);
    PVector e = (PVector) ply.get(i+1);
    line(s.x, s.y, e.x, e.y);
  }
  PVector s = (PVector) ply.get(ply.size()-1);
  PVector e = (PVector) ply.get(0);
  line(s.x, s.y, e.x, e.y);
}

void draw() {
  background(0);

  for (int i = 0; i < n; ++i) {
    float wo = sin((frameCount / 60.0) + i);
    float awo = abs(wo);
    float yv = wo * width/3;
    float r = map(awo, 0, 1, 5, 20);
    float s = map(awo, 0, 1, 3, 8);
    float y = height/2 + yv;
    PVector p = new PVector(i*nx, y);

    ArrayList <PVector> ply = poly(p.x, p.y, s, r);
    drawPoly(ply);
  }
}