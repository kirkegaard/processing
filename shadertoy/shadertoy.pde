PShader shader;

void setup() {
    size(1280, 720, P3D);
    shader = loadShader("data/grain.glsl");
    shader.set("iResolution", height, width);
}

void draw() {
    background(0);

    surface.setTitle(nf(frameRate, 2, 2));
    // shader.set("iGlobalTime", millis() / 1000.0);

    translate(width/2, height/2);
    rect(-50, -50, 100, 100);

    filter(shader);
}