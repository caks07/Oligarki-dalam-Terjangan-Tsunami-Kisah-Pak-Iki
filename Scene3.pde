class Scene3 {
  PApplet parent;
  float fish1X, fish2X, fish3X, fish4X, fish5X, fish6X;
  Bubble[] bubbles;
  int numBubbles = 10;

  Scene3(PApplet p) {
    parent = p;
    fish1X = 150;
    fish2X = parent.width - 150;
    fish3X = 200;
    fish4X = 350;
    fish5X = 500;
    fish6X = 650;

    bubbles = new Bubble[numBubbles];
    for (int i = 0; i < numBubbles; i++) {
      bubbles[i] = new Bubble(parent.random(parent.width), parent.random(parent.height), parent.random(10, 30));
    }
  }

  void drawScene() {
    parent.background(0, 105, 148);

    // Dasar laut
    parent.fill(28, 53, 45);
    parent.noStroke();
    parent.rect(0, 500, parent.width, 100);

    // Terumbu karang
    drawCoral(100, 480);
    drawCoral(200, 500);
    drawCoral(700, 490);
    drawCoral(600, 520);

    // Rumput laut
    drawSeaweed(50, 480);
    drawSeaweed(750, 500);

    // Bintang laut
    drawStarfish(300, 550);
    drawStarfish(500, 530);

    // Ikan
    drawBeautifulFish(fish1X, 300, true);
    drawBeautifulFish(fish2X, 300, false);

    drawSmallFish(fish3X, 200);
    drawSmallFish(fish4X, 250);
    drawSmallFish(fish5X, 150);
    drawSmallFish(fish6X, 220);

    // Gelembung
    for (int i = 0; i < numBubbles; i++) {
      bubbles[i].move();
      bubbles[i].display();
    }

    animateObjects();
  }

  void animateObjects() {
    fish1X += 1;
    fish2X -= 1;
    if (fish1X > parent.width + 50) fish1X = -50;
    if (fish2X < -50) fish2X = parent.width + 50;

    fish3X += 1;
    fish4X += 1;
    fish5X += 1;
    fish6X += 1;
    if (fish3X > parent.width) fish3X = -50;
    if (fish4X > parent.width) fish4X = -50;
    if (fish5X > parent.width) fish5X = -50;
    if (fish6X > parent.width) fish6X = -50;
  }

  void drawBeautifulFish(float x, float y, boolean facingRight) {
    parent.pushMatrix();
    parent.translate(x, y);
    if (!facingRight) parent.scale(-1, 1);
    parent.fill(255, 102, 102); // Warna badan ikan
    parent.ellipse(0, 0, 60, 40);
    parent.fill(255, 255, 255);
    parent.ellipse(15, -10, 10, 10);
    parent.fill(0, 0, 0);
    parent.ellipse(15, -10, 5, 5);
    parent.fill(255, 102, 102);
    parent.triangle(-30, 0, -50, -15, -50, 15);
    parent.stroke(0);
    parent.line(-15, -20, -15, 20);
    parent.line(0, -20, 0, 20);
    parent.line(15, -20, 15, 20);
    parent.noStroke();
    parent.fill(0);
    parent.arc(20, 5, 10, 10, 0, parent.PI);
    parent.popMatrix();
  }

  void drawSmallFish(float x, float y) {
    parent.fill(0, 255, 204);
    parent.ellipse(x, y, 40, 20);
    parent.fill(255);
    parent.ellipse(x + 15, y - 5, 5, 5);
    parent.fill(0);
    parent.ellipse(x + 15, y - 5, 2, 2);
    parent.fill(0, 255, 204);
    parent.triangle(x - 20, y, x - 30, y - 10, x - 30, y + 10);
  }

  void drawCoral(float x, float y) {
    parent.fill(255, 99, 71);
    parent.noStroke();
    parent.rect(x - 10, y - 40, 20, 40);
    parent.ellipse(x - 10, y - 40, 20, 20);
    parent.ellipse(x + 10, y - 40, 20, 20);
    parent.ellipse(x, y - 30, 30, 30);
    parent.fill(60, 179, 113);
    parent.rect(x - 30, y - 30, 10, 30);
    parent.rect(x + 20, y - 50, 10, 50);
    parent.ellipse(x - 25, y - 30, 15, 15);
    parent.ellipse(x + 25, y - 50, 15, 15);
  }

  void drawSeaweed(float x, float y) {
    parent.fill(34, 139, 34);
    parent.noStroke();
    parent.beginShape();
    parent.vertex(x, y);
    parent.bezierVertex(x - 20, y - 40, x + 10, y - 70, x - 10, y - 100);
    parent.bezierVertex(x + 10, y - 70, x - 20, y - 40, x, y);
    parent.endShape(PApplet.CLOSE);
  }

  void drawStarfish(float x, float y) {
    parent.fill(255, 215, 0); // Warna bintang laut
    parent.beginShape();
    for (int i = 0; i < 5; i++) {
      parent.vertex(x + 15 * parent.cos(PApplet.radians(72 * i)), y + 15 * parent.sin(PApplet.radians(72 * i)));
      parent.vertex(x + 6 * parent.cos(PApplet.radians(72 * i + 36)), y + 6 * parent.sin(PApplet.radians(72 * i + 36)));
    }
    parent.endShape(PApplet.CLOSE);
  }

  class Bubble {
    float x, y, diameter;
    float speed;

    Bubble(float tempX, float tempY, float tempDiameter) {
      x = tempX;
      y = tempY;
      diameter = tempDiameter;
      speed = parent.random(1, 3);
    }

    void move() {
      y -= speed;
      if (y + diameter / 2 < 0) {
        y = parent.height;
        x = parent.random(parent.width);
      }
    }

    void display() {
      parent.fill(255, 255, 255, 150);
      parent.noStroke();
      parent.ellipse(x, y, diameter, diameter);
    }
  }
}
