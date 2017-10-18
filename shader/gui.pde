void setupGui() {
  cp5 = new ControlP5(this);
  cp5.begin(10, 10);

  cp5.addSlider("triangles")
    .setRange(1,triangles_max)
    .linebreak();

  cp5.addSlider("time")
    .setRange(0,1)
    .linebreak();

  cp5.addSlider("amount")
    .setRange(0,5)
    .linebreak();

  cp5.addSlider("weight")
    .setRange(0,20)
    .linebreak();

  cp5.addSlider("delayer")
    .setRange(-.1,.1)
    .setWidth(200)
    .linebreak();

  cp5.addSlider("spacer")
    .setRange(0,200)
    .setWidth(200)
    .linebreak();

  cp5.addSlider("size")
    .setRange(0,300)
    .setWidth(200)
    .linebreak();

  cp5.addToggle("isFlipped")
    .setSize(50, 20);

  cp5.addToggle("isFilled")
    .setSize(50, 20)
    .linebreak();

  cp5.addKnob("rotation")
    .setRange(0, 3.6);

  fill = cp5.addColorPicker("fill")
    .setPosition(10, 250);

  stroke = cp5.addColorPicker("stroke")
    .setPosition(10, 350);


  cp5.end();
}