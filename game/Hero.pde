class Hero {

    PVector pos = new PVector();
    PVector vel = new PVector();

    float d = 20;
    float frict = 0.90;

    boolean isLeft, isRight, isUp, isDown, isShooting = false;

    Hero (PVector position) {
        pos.set(position);
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

    void addBullet() {
        PVector bs = new PVector(mouseX, mouseY);
        PVector rand = new PVector();

        rand.set(PVector.random2D());
        rand.mult(10);

        bs.add(rand);
        bs.sub(pos);
        bs.normalize();
        bs.mult(Bullet.VEL);

        bullets.add(new Bullet(pos, bs));
    }

    void update() {
        pos.x = constrain(pos.x + vel.x, 0, width - d);
        pos.y = constrain(pos.y + vel.y, 0, height - d);

        if (isLeft) vel.x = vel.x - frict;
        if (isRight) vel.x = vel.x + frict;
        if (isDown) vel.y = vel.y + frict;
        if (isUp) vel.y = vel.y - frict;

        vel.mult(frict);

        if (isShooting) addBullet();
    }

    void display() {
        noStroke();
        fill(255);
        rect(pos.x, pos.y, d, d);
    }
}