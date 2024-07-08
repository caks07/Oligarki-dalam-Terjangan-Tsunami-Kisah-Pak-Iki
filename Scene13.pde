class Scene13 {
  PApplet parent;
  PImage fishImage;
  float waveOffset = 0;
  float fishPositionX = 500;
  float fishPositionY = 330;
  float fishSpeedX = 1;
  float fishSpeedY = 0.5;
  float cloudX1, cloudX2, cloudX3;
  float palmLeavesAngle;

  Scene13(PApplet p) {
    parent = p;
    fishImage = parent.loadImage("Neo.png"); // Memuat gambar ikan
    cloudX1 = 100;
    cloudX2 = 300;
    cloudX3 = 500;
    palmLeavesAngle = 0;
  }

  void drawScene() {
    parent.background(135, 206, 235); // Langit biru

    drawSun();
    drawMountains();
    drawBeach();
    drawOcean();
    drawVerticalWaves();
    drawTrashOnBeach();
    drawFishOnBeach(); // Menampilkan gambar ikan di pantai
    drawMovingFishInWater();
    drawDeadTrees();

    // Objek tambahan dari laut indah
    drawPalmTree(150, 500); // Pohon kelapa kiri
    drawUmbrella(200, 550);
    drawUmbrella(600, 550);
    drawLoungeChair(100, 580);
    drawStarfish(300, 600);
    drawBeachBall(500, 600);
    drawCloud(cloudX1, 150);
    drawCloud(cloudX2, 200);
    drawCloud(cloudX3, 170);

    waveOffset += 0.5;
    if (waveOffset > parent.TWO_PI) {
      waveOffset -= parent.TWO_PI;
    }
    
    animateObjects();
    moveFish();
  }

  void drawSun() {
    parent.fill(255, 99, 71);
    parent.ellipse(700, 100, 150, 150);
  }

  void drawMountains() {
    parent.fill(60);
    parent.triangle(150, 300, 375, 75, 600, 300);
    parent.triangle(450, 300, 675, 150, 900, 300);
  }

  void drawBeach() {
    parent.fill(244, 164, 96);
    parent.beginShape();
    parent.vertex(0, 600);
    for (int x = 0; x <= parent.width/2; x++) {
      float y = 300;
      parent.vertex(x, y);
    }
    parent.vertex(parent.width/2, 600);
    parent.endShape(parent.CLOSE);
  }

  void drawOcean() {
    parent.fill(70, 130, 180);
    parent.beginShape();
    parent.vertex(parent.width/2, 600);
    for (int x = parent.width/2; x <= parent.width; x++) {
      float y = 282 + 20 * parent.sin((x * 0.05) + waveOffset);
      parent.vertex(x, y);
    }
    parent.vertex(parent.width, 600);
    parent.endShape(parent.CLOSE);
  }

  void drawVerticalWaves() {
    parent.stroke(255);
    parent.strokeWeight(3);
    parent.noFill();
    for (int y = 282; y <= 600; y += 20) {
      float waveHeight = 20 * parent.sin((y * 0.5) + waveOffset);
      parent.bezier(parent.width/2, y, parent.width/2 + waveHeight, y + 10, parent.width/2 - waveHeight, y + 30, parent.width/2, y + 40);
    }
  }

  void drawTrashOnBeach() {
    drawBottle(100, 600);
    drawBag(150, 480);
    drawUmbrella(200, 500);
    drawBottle(250, 460);
    drawBag(300, 520);
    drawUmbrella(350, 400, true);
    drawBottle(400, 490);
    drawBag(450, 500);
    drawUmbrella(500, 510);
    drawBottle(550, 450);
  }

  void drawFishOnBeach() {
    parent.image(fishImage, 600, 350, fishImage.width-100, fishImage.height-175); // Menampilkan gambar ikan di pantai
  }

  void drawMovingFishInWater() {
    drawFish(fishPositionX, fishPositionY, parent.color(255, 255, 255)); // Ikan putih
  }

  void drawTrash(float x, float y) {
    parent.fill(169, 169, 169);
    parent.rect(x, y, 20, 10); // Contoh sampah
    parent.fill(255, 0, 0);
    parent.rect(x + 30, y + 10, 15, 10); // Contoh sampah
    parent.fill(0, 0, 255);
    parent.rect(x + 60, y - 5, 10, 25); // Contoh sampah
  }

  void drawBottle(float x, float y) {
    parent.fill(0, 191, 255);
    parent.rect(x, y, 10, 30); // Botol plastik
    parent.fill(255);
    parent.rect(x, y - 5, 10, 5); // Tutup botol
  }

  void drawBag(float x, float y) {
    parent.fill(255);
    parent.rect(x, y, 20, 20); // Kantong plastik
    parent.triangle(x, y, x + 5, y - 10, x + 10, y);
    parent.triangle(x + 10, y, x + 15, y - 10, x + 20, y);
  }

  void drawUmbrella(float x, float y) {
    drawUmbrella(x, y, false);
  }

  void drawUmbrella(float x, float y, boolean flipped) {
    parent.fill(255, 0, 0);
    if (flipped) {
      parent.arc(x, y + 20, 40, 40, 0, parent.PI); // Payung terbalik
    } else {
      parent.arc(x, y, 40, 40, parent.PI, parent.TWO_PI); // Payung
    }
    parent.fill(139, 69, 19);
    parent.rect(x - 2, y, 4, 20); // Tiang payung
  }

  void drawFish(float x, float y, color c) {
    parent.fill(c);
    parent.ellipse(x, y, 30, 15); // Badan ikan
    parent.triangle(x + 15, y, x + 30, y - 7.5, x + 30, y + 7.5); // Ekor ikan
  }

  void drawDeadTrees() {
    drawDeadTree(100, 280);
    drawDeadTree(200, 290);
    drawDeadTree(300, 270);
  }

  void drawDeadTree(float x, float y) {
    parent.fill(139, 69, 19);
    parent.rect(x, y, 30, 60); // Batang pohon
    parent.fill(105, 105, 105);
    parent.ellipse(x + 15, y - 30, 75, 75); // Ranting pohon mati
  }

  void moveFish() {
    fishPositionX += fishSpeedX;
    fishPositionY += fishSpeedY;
    if (fishPositionX > parent.width || fishPositionX < parent.width/2) {
      fishSpeedX *= -1;
    }
    if (fishPositionY > 600 || fishPositionY < 200) {
      fishSpeedY *= -1;
    }
  }

  void animateObjects() {
    // Move the clouds
    cloudX1 += 0.2;
    cloudX2 += 0.15;
    cloudX3 += 0.1;
    if (cloudX1 > parent.width + 50) cloudX1 = -50;
    if (cloudX2 > parent.width + 50) cloudX2 = -50;
    if (cloudX3 > parent.width + 50) cloudX3 = -50;

    // Sway the palm leaves
    palmLeavesAngle += 0.005;
  }

  void drawPalmTree(int x, int y) {
    // Trunk
    parent.stroke(139, 69, 19);
    parent.strokeWeight(15);
    parent.line(x, y + 150, x, y - 25);

    // Leaves
    parent.strokeWeight(3);
    parent.fill(139, 69, 19); // Warna coklat
    for (float i = -parent.PI / 3; i <= parent.PI / 3; i += parent.PI / 6) {
      parent.pushMatrix();
      parent.translate(x, y - 25);
      parent.rotate(i + parent.sin(palmLeavesAngle) * 0.1);
      parent.ellipse(0, 0, 150, 30);
      parent.popMatrix();
    }
  }

  void drawLoungeChair(int x, int y) {
    // Chair
    parent.stroke(160, 82, 45);
    parent.strokeWeight(3);
    parent.line(x, y, x + 75, y - 30);
    parent.line(x + 75, y - 30, x + 120, y - 15);
    parent.line(x, y, x + 45, y - 15);
    parent.line(x + 45, y - 15, x + 75, y - 30);
  }

  void drawStarfish(int x, int y) {
    parent.fill(255, 255, 0);
    parent.noStroke();
    parent.beginShape();
    for (int i = 0; i < 5; i++) {
      float angle = parent.TWO_PI / 5 * i;
      float nextAngle = angle + parent.TWO_PI / 10;
      parent.vertex(x + parent.cos(angle) * 30, y + parent.sin(angle) * 30);
      parent.vertex(x + parent.cos(nextAngle) * 15, y + parent.sin(nextAngle) * 15);
    }
    parent.endShape(parent.CLOSE);
  }

  void drawBeachBall(int x, int y) {
    parent.fill(255, 0, 0);
    parent.ellipse(x, y, 45, 45);
    parent.fill(0, 255, 0);
    parent.arc(x, y, 45, 45, 0, parent.PI / 2);
    parent.fill(0, 0, 255);
    parent.arc(x, y, 45, 45, parent.PI / 2, parent.PI);
  }

  void drawCloud(float x, float y) {
    parent.fill(255, 255, 255);
    parent.noStroke();
    parent.ellipse(x, y, 75, 45);
    parent.ellipse(x + 30, y, 75, 45);
    parent.ellipse(x + 15, y - 15, 75, 45);
  }
}
