class Scene1 {
  PApplet parent;
  float boatX;
  float cloudX1, cloudX2, cloudX3;
  float[] waveOffsets;
  float palmLeavesAngle;

  Scene1(PApplet p) {
    parent = p;
    boatX = parent.width / 2;
    cloudX1 = 100;
    cloudX2 = 300;
    cloudX3 = 500;
    waveOffsets = new float[parent.width / 20 + 1];
    palmLeavesAngle = 0;
  }

  void drawScene() {
    drawSky();
    drawOcean();
    drawSand();
    drawSandParticles();
    drawPalmTree(150, 350);
    drawPalmTree(650, 350);
    drawBeachItems();
    drawBoat(boatX, 250);
    drawSun();
    drawCloud(cloudX1, 100);
    drawCloud(cloudX2, 150);
    drawCloud(cloudX3, 120);
    animateObjects();
  }

  void drawSky() {
    parent.background(135, 206, 250);
  }

  void drawOcean() {
    parent.fill(0, 105, 148);
    parent.noStroke();
    parent.rect(0, 300, parent.width, 300);
    parent.fill(0, 150, 200);
    parent.beginShape();
    parent.vertex(0, 300);
    for (int x = 0; x <= parent.width; x += 20) {
      float y = 300 + 20 * parent.sin(PApplet.TWO_PI * (x / 100.0 + waveOffsets[x / 20]));
      parent.vertex(x, y);
    }
    parent.vertex(parent.width, 300);
    parent.endShape(PApplet.CLOSE);
  }

  void drawSand() {
    parent.fill(237, 201, 175);
    parent.rect(0, 400, parent.width, 200);
  }

  void drawSandParticles() {
    parent.fill(255, 228, 181);
    parent.noStroke();
    for (int i = 0; i < 500; i++) {
      float x = parent.random(parent.width);
      float y = parent.random(400, parent.height);
      parent.ellipse(x, y, 3, 3);
    }
  }

  void drawPalmTree(int x, int y) {
    parent.stroke(139, 69, 19);
    parent.strokeWeight(10);
    parent.line(x, y + 100, x, y - 25);
    parent.strokeWeight(2);
    parent.fill(34, 139, 34);
    for (float i = -PApplet.PI / 3; i <= PApplet.PI / 3; i += PApplet.PI / 6) {
      parent.pushMatrix();
      parent.translate(x, y - 25);
      parent.rotate(i + parent.sin(palmLeavesAngle) * 0.1);
      parent.ellipse(0, 0, 100, 20);
      parent.popMatrix();
    }
  }

  void drawBeachItems() {
    drawUmbrella(200, 450);
    drawUmbrella(600, 450);
    drawLoungeChair(100, 480);
    drawStarfish(300, 500);
    drawBeachBall(500, 500);
  }

  void drawUmbrella(int x, int y) {
    parent.stroke(169, 169, 169);
    parent.strokeWeight(5);
    parent.line(x, y, x, y - 50);
    parent.fill(255, 69, 0);
    parent.noStroke();
    parent.arc(x, y - 50, 80, 80, PApplet.PI, PApplet.TWO_PI);
  }

  void drawLoungeChair(int x, int y) {
    parent.stroke(160, 82, 45);
    parent.strokeWeight(3);
    parent.line(x, y, x + 50, y - 20);
    parent.line(x + 50, y - 20, x + 80, y - 10);
    parent.line(x, y, x + 30, y - 10);
    parent.line(x + 30, y - 10, x + 50, y - 20);
  }

  void drawStarfish(int x, int y) {
    parent.fill(255, 255, 0);
    parent.noStroke();
    parent.beginShape();
    for (int i = 0; i < 5; i++) {
      float angle = PApplet.TWO_PI / 5 * i;
      float nextAngle = angle + PApplet.TWO_PI / 10;
      parent.vertex(x + parent.cos(angle) * 20, y + parent.sin(angle) * 20);
      parent.vertex(x + parent.cos(nextAngle) * 10, y + parent.sin(nextAngle) * 10);
    }
    parent.endShape(PApplet.CLOSE);
  }

  void drawBeachBall(int x, int y) {
    parent.fill(255, 0, 0);
    parent.ellipse(x, y, 30, 30);
    parent.fill(0, 255, 0);
    parent.arc(x, y, 30, 30, 0, PApplet.PI / 2);
    parent.fill(0, 0, 255);
    parent.arc(x, y, 30, 30, PApplet.PI / 2, PApplet.PI);
  }

  void drawBoat(float x, float y) {
    parent.fill(160, 82, 45);
    parent.beginShape();
    parent.vertex(x - 60, y);
    parent.vertex(x + 60, y);
    parent.vertex(x + 40, y + 40);
    parent.vertex(x - 40, y + 40);
    parent.endShape(PApplet.CLOSE);
    parent.fill(255, 255, 255);
    parent.triangle(x, y, x, y - 60, x + 40, y - 20);
  }

  void drawSun() {
    parent.fill(255, 165, 0);
    parent.ellipse(700, 100, 50, 50);
  }

  void drawCloud(float x, float y) {
    parent.fill(255, 255, 255);
    parent.noStroke();
    parent.ellipse(x, y, 50, 30);
    parent.ellipse(x + 20, y, 50, 30);
    parent.ellipse(x + 10, y - 10, 50, 30);
  }

  void animateObjects() {
    boatX += 1;
    if (boatX > parent.width + 60) {
      boatX = -60;
    }
    cloudX1 += 0.5;
    cloudX2 += 0.3;
    cloudX3 += 0.4;
    if (cloudX1 > parent.width + 50) cloudX1 = -50;
    if (cloudX2 > parent.width + 50) cloudX2 = -50;
    if (cloudX3 > parent.width + 50) cloudX3 = -50;
    for (int i = 0; i < waveOffsets.length; i++) {
      waveOffsets[i] += 0.01;
    }
    palmLeavesAngle += 0.01;
  }
}
