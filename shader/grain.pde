void grain(int val) {
  noStroke();
  for (int x = 0; x < width-1; x+=2) {
    for (int y = 0; y < width-1; y+=2) {
      fill(random(85-10, 85+10), val);
      rect(x, y, 2, 2);
    }
  }

  for (int i = 0; i < 30; ++i) {
    fill(random(40, 60), random(val * 2.5, val * 3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}