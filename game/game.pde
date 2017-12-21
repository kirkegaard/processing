Hero hero;

void setup() {
    size(600, 600);
    frameRate(60);
    hero = new Hero(width>>1, height>>1);
}

void draw() {
    background(0);
    hero.update();
    hero.draw();
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

class Hero {

    float x;
    float y;
    float d = 20;
    float xvel = 0;
    float yvel = 0;
    float frict = 0.90;
    float vel = 0.2;

    boolean isLeft, isRight, isUp, isDown, isShooting = false;

    Hero (float posX, float posY) {
        x = posX;
        y = posY;
    }

    boolean setMove(int key, boolean bool) {
        switch (key) {
            case 'W':
            case UP:
                return isUp = bool;
            case 'S':
            case DOWN:
                return isDown = bool;
            case 'A':
            case LEFT:
                return isLeft = bool;
            case 'D':
            case RIGHT:
                return isRight = bool;
            case 32:
                return isShooting = bool;
            default:
                return bool;
        }
    }

    void update() {
        x = constrain(x + xvel, 0, width - d);
        y = constrain(y + yvel, 0, height - d);

        if (isLeft) xvel = xvel - frict;
        if (isRight) xvel = xvel + frict;
        if (isDown) yvel = yvel + frict;
        if (isUp) yvel = yvel - frict;

        yvel = yvel * frict;
        xvel = xvel * frict;

        println(isLeft, isRight, isUp, isDown, isShooting);
    }

    void draw() {
        stroke(0);
        fill(255);
        rect(x, y, d, d);
    }
}


class Bullet {

    float x;
    float y;
    float d = 5;

    Bullet (float posX, float posY) {
        x = posX;
        y = posY;
    }

    void update() {}
    void draw() {
        stroke(0);
        fill(255);
        ellipse(x, y, d, d);
    }
}