import controlP5.*;

PShader flip;
PShader grain;

ControlP5 cp5;

int triangles = 2;
int triangles_max = 40;
Triangle[] t = new Triangle[triangles_max];

boolean isFilled = true;
boolean isFlipped = true;
ColorPicker fill;
ColorPicker stroke;
float spacer = 110;
float time = .01;
float amount = 1;
float delayer = 0;
float size = 75;
float weight = 0;
float rotation = 0;

void setup() {
  frameRate(60);
  size(1050, 576, P2D);
  smooth(4);
  setupGui();

  flip = loadShader("data/shaders/flip.glsl");

  for (int i = 0; i < triangles_max; ++i) {
    float angle = (i * TWO_PI / triangles);
    float x = (width / 2) + spacer * cos(angle);
    float y = (height / 2) + spacer * sin(angle);

    t[i] = new Triangle(x, y);
    t[i].isFilled = isFilled;
    t[i].fill = fill.getColorValue();
    t[i].stroke = stroke.getColorValue();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < triangles; ++i) {
    float angle = (i * TWO_PI / triangles);
    angle += rotation;
    t[i].x = (width / 2) + spacer * cos(angle);
    t[i].y = (height / 2) + spacer * sin(angle);
    t[i].rotate = (sin(frameCount * time) * amount) + (delayer * i);
    t[i].size = size;
    t[i].isFilled = isFilled;
    t[i].weight = weight;
    t[i].fill = fill.getColorValue();
    t[i].stroke = stroke.getColorValue();

    t[i].draw();
  }

  if (isFlipped) {
    filter(flip);
  }
}