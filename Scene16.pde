class Scene16 {
  PApplet parent;
  float waveOffset = 0;
  float[] waveY;
  int numWaves = 100;
  float cloudX1 = 100, cloudX2 = 300, cloudX3 = 500;
  PImage fishImage;
  float[] buildingX, buildingY;
  float buildingSpeed = 0.7;
  float buildingFallSpeed = 0.1;
  float beachLevel = 300; // Menurunkan posisi pantai sedikit

  Scene16(PApplet p) {
    parent = p;
    waveY = new float[p.width];
    buildingX = new float[10];
    buildingY = new float[10];
    
    for (int i = 0; i < 10; i++) {
      buildingX[i] = i * 100 + 50;
      buildingY[i] = p.height / 2 - p.random(150, 300);
    }
  }

  void drawScene() {
    parent.background(200, 220, 240);
    drawBackground();
    drawBeach();
    drawCity();
    drawWave();

    waveOffset += 0.05;
    if (waveOffset > parent.TWO_PI) {
      waveOffset -= parent.TWO_PI;
    }

    // Animasi awan
    cloudX1 += 0.2;
    if (cloudX1 > parent.width + 50) cloudX1 = -50;
    cloudX2 += 0.15;
    if (cloudX2 > parent.width + 50) cloudX2 = -50;
    cloudX3 += 0.1;
    if (cloudX3 > parent.width + 50) cloudX3 = -50;

    drawCloud(cloudX1, 100);
    drawCloud(cloudX2, 150);
    drawCloud(cloudX3, 120);
  }

  void drawBackground() {
    // Langit
    parent.fill(210, 230, 250);
    parent.rect(0, 0, parent.width, parent.height / 2);

    // Laut
    parent.fill(100, 150, 200);
    parent.rect(0, parent.height / 2, parent.width, parent.height / 2);

    // Matahari
    parent.fill(255, 255, 180);
    parent.ellipse(parent.width - 150, 100, 80, 80);

    // Awan
    parent.fill(255);
    drawCloud(200, 100);
    drawCloud(400, 150);
    drawCloud(600, 80);
  }

  void drawCloud(float x, float y) {
    parent.ellipse(x, y, 80, 60);
    parent.ellipse(x + 30, y + 10, 80, 60);
    parent.ellipse(x - 30, y + 10, 80, 60);
  }

  void drawCity() {
    for (int i = 0; i < 10; i++) {
      buildingX[i] -= buildingSpeed;
      buildingY[i] += buildingFallSpeed;

      if (buildingX[i] < -60) {
        buildingX[i] = parent.width + 60;
        buildingY[i] = parent.height / 2 - parent.random(150, 300);
      }

      drawBuilding(buildingX[i], buildingY[i], 60, parent.height / 2 - buildingY[i], 5, 3, parent.color(60, 60, 100));
    }
  }

  void drawBuilding(float x, float y, float w, float h, int rows, int cols, int c) {
    parent.fill(c);
    parent.rect(x, y, w, h);

    // Pintu
    parent.fill(0);
    parent.rect(x + w / 2 - 10, y + h - 30, 20, 30);

    // Jendela
    parent.fill(255);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float windowX = x + 10 + i * ((w - 20) / cols);
        float windowY = y + 10 + j * ((h - 40) / rows);
        parent.rect(windowX, windowY, (w - 20) / cols - 5, (h - 40) / rows - 5);
      }
    }
  }

  void drawWave() {
    parent.fill(0, 50, 150);
    parent.beginShape();
    for (int x = 0; x < parent.width; x++) {
      waveY[x] = beachLevel - 20 + 200 * parent.sin(parent.TWO_PI * x / 100 + waveOffset) * parent.exp(-0.005 * x);
      parent.vertex(x, waveY[x]);
    }
    parent.vertex(parent.width, parent.height);
    parent.vertex(0, parent.height);
    parent.endShape(parent.CLOSE);

    parent.fill(255, 255, 255, 150);
    for (int i = 0; i < 50; i++) {
      float x = parent.random(parent.width);
      float y = parent.random(beachLevel, parent.height);
      parent.ellipse(x, y, 10, 10); // Buat buih di dasar
    }
  }

  void drawBeach() {
    parent.fill(237, 201, 175);
    parent.rect(0, beachLevel, parent.width / 2, parent.height - beachLevel);

    parent.fill(255, 228, 181);
    for (int i = 0; i < 500; i++) {
      float x = parent.random(parent.width / 2);
      float y = parent.random(beachLevel, parent.height / 2 - 100);
      parent.ellipse(x, y, 3, 3);
    }

    drawPalmTree(150, int(beachLevel + 50));
    drawPalmTree(300, int(beachLevel + 50));

    drawUmbrella(200, int(beachLevel + 100));
    drawUmbrella(400, int(beachLevel + 100));
    drawLoungeChair(100, int(beachLevel + 130));
    drawStarfish(300, int(beachLevel + 150));
    drawBeachBall(500, int(beachLevel + 150));
  }

  void drawPalmTree(int x, int y) {
    parent.stroke(139, 69, 19);
    parent.strokeWeight(10);
    parent.line(x, y + 100, x, y - 25);

    parent.strokeWeight(2);
    parent.fill(34, 139, 34);
    for (float i = -parent.PI / 3; i <= parent.PI / 3; i += parent.PI / 6) {
      parent.pushMatrix();
      parent.translate(x, y - 25);
      parent.rotate(i + parent.sin(0.01 * parent.frameCount) * 0.1);
      parent.ellipse(0, 0, 100, 20);
      parent.popMatrix();
    }
  }

  void drawUmbrella(int x, int y) {
    parent.stroke(169, 169, 169);
    parent.strokeWeight(5);
    parent.line(x, y, x, y - 50);

    parent.fill(255, 69, 0);
    parent.noStroke();
    parent.arc(x, y - 50, 80, 80, parent.PI, parent.TWO_PI);
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
      float angle = parent.TWO_PI / 5 * i;
      float nextAngle = angle + parent.TWO_PI / 10;
      parent.vertex(x + parent.cos(angle) * 20, y + parent.sin(angle) * 20);
      parent.vertex(x + parent.cos(nextAngle) * 10, y + parent.sin(nextAngle) * 10);
    }
    parent.endShape(parent.CLOSE);
  }

  void drawBeachBall(int x, int y) {
    parent.fill(255, 0, 0);
    parent.ellipse(x, y, 30, 30);
    parent.fill(0, 255, 0);
    parent.arc(x, y, 30, 30, 0, parent.PI / 2);
    parent.fill(0, 0, 255);
    parent.arc(x, y, 30, 30, parent.PI / 2, parent.PI);
  }
}
