import peasy.*;

PeasyCam cam;

float size = 20;
float spacer = 5;
float dist = 5;
int planes = 6;

void setup() {
    size(800, 800, P3D);
    smooth(4);
    cam = new PeasyCam(this, 150);
    cam.rotateY(radians(45));
    cam.rotateX(radians(35));
}

void draw() {
    background(50);
    fill(50);
    stroke(200);
    strokeWeight(2);

    // pushMatrix();
    // rotateY(radians(sin(frameCount * .08) * 2));
    // rotateX(radians(cos(frameCount * .08) * 2));
    // box(size);
    // popMatrix();

    for (int y = 0; y < 4; ++y) {
        for (int yi = 1; yi <= planes; ++yi) {

            pushMatrix();
            rotateY(radians((y * 90) + (sin(frameCount * .08) * (yi * 2))));
            rotateX(radians(90) + (sin(frameCount * .02) * (yi * 0.2)));

            float pos = dist + (size / 2) + (spacer * yi);
            float anim = sin(frameCount * .05) * (yi*2);

            translate(pos + anim, 0, 0);

            rotateY(radians(90));
            rectMode(CENTER);
            rect(0, 0, size, size);
            popMatrix();
        }
    }

    for (int x = 1; x <= 2; ++x) {
        for (int xi = 1; xi <= planes; ++xi) {
            pushMatrix();
            rotateY(radians(90) + (sin(frameCount * .02) * (xi * 0.2)));
            rotateX(radians((x*180) + (sin(frameCount * .08) * (xi * 2))));

            float pos = dist + (size / 2) + (spacer * xi);
            float anim = sin(frameCount * .05) * (xi*2);

            translate(0, pos + anim, 0);

            rotateX(radians(90));
            rectMode(CENTER);
            rect(0, 0, size, size);
            popMatrix();
        }
    }

}