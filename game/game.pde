Hero hero;
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();

void setup() {
    size(600, 600);
    frameRate(60);

    hero = new Hero(new PVector(width>>1, height>>1));
}

void draw() {
    background(0);
    hero.update();
    hero.display();

    for (int i = bullets.size() - 1; i >= 0; i--) {
        Bullet b = bullets.get(i);
        b.update();
        b.display();

        if (b.LIFE < 0) {
            bullets.remove(i);
        }
    }
}

void keyPressed() {
    hero.setMove(keyCode, true);
}

void keyReleased() {
    hero.setMove(keyCode, false);
}

void mousePressed() {
    hero.setMove(32, true);
}

void mouseReleased() {
    hero.setMove(32, false);
}