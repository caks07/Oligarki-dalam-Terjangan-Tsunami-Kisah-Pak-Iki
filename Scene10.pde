class Scene10 {
  PApplet parent;
  int numBubbles = 200; // Menambah jumlah gelembung menjadi 200
  float seaLevel;
  Bubble[] bubbles;

  Scene10(PApplet p) {
    parent = p;
    seaLevel = parent.height - 100; // Posisi laut
    bubbles = new Bubble[numBubbles];
    for (int i = 0; i < numBubbles; i++) {
      bubbles[i] = new Bubble(parent.random(parent.width), parent.random(parent.height, parent.height + 200), parent.random(30, 50));
    }
  }

  void drawScene() {
    parent.background(135, 206, 235); // Warna langit
    drawSea();

    for (int i = 0; i < numBubbles; i++) {
      bubbles[i].move();
      bubbles[i].display();
    }
  }

  void drawSea() {
    parent.fill(0, 128, 0); // Warna laut hijau
    parent.rect(0, seaLevel, parent.width, parent.height - seaLevel);
  }

  class Bubble {
    float x, y, diameter;
    float speed;

    Bubble(float tempX, float tempY, float tempDiameter) {
      x = tempX + 10;
      y = tempY + 10;
      diameter = tempDiameter;
      speed = parent.random(7, 10); // Meningkatkan kecepatan gelembung
    }

    void move() {
      y -= speed;
      if (y + diameter / 2 < 0) {
        y = parent.random(parent.height, parent.height + 200);
        x = parent.random(parent.width);
      }
    }

    void display() {
      parent.fill(0, 255, 0, 150); // Warna gelembung hijau
      parent.noStroke();
      parent.ellipse(x, y, diameter, diameter);
    }
  }
}
