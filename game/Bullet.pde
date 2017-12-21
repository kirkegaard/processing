class Bullet {

    PVector pos = new PVector();
    PVector spd = new PVector();

    static final float VEL = 5;
    float LIFE = 10;
    float DECAY = 0.2;

    float d = 5;

    Bullet (PVector loc, PVector vel) {
        pos.set(loc);
        spd.set(vel);
    }

    void update() {
        pos.add(spd);
        LIFE = LIFE - DECAY;
    }

    void display() {
        noStroke();
        fill(255);
        ellipse(pos.x, pos.y, d, d);
    }
}