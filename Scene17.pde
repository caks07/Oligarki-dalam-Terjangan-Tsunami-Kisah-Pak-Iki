class Scene17 {
  PApplet parent;
  float cloudX1, cloudX2, cloudX3;
  Trash[] beachTrashItems;
  Debris[] buildingDebris;
  int numBeachTrashItems = 40; // Increased number of beach trash items
  int numBuildingDebris = 20; // Number of building debris items

  Scene17(PApplet p) {
    parent = p;
    cloudX1 = 0;
    cloudX2 = p.width / 2;
    cloudX3 = p.width / 4;
    
    // Initialize beach trash items
    beachTrashItems = new Trash[numBeachTrashItems];
    for (int i = 0; i < numBeachTrashItems; i++) {
      int shapeType = int(p.random(3)); // Random shape type: 0 - bottle, 1 - bag, 2 - wrapper
      beachTrashItems[i] = new Trash(p, p.random(p.width), p.height * 0.5 + p.random(p.height * 0.5), p.random(20, 50), false, shapeType);
    }
    
    // Initialize building debris items
    buildingDebris = new Debris[numBuildingDebris];
    for (int i = 0; i < numBuildingDebris; i++) {
      int shapeType = int(p.random(3)); // Random shape type: 0 - small block, 1 - medium block, 2 - large block
      buildingDebris[i] = new Debris(p, p.random(p.width), p.height * 0.5 + p.random(p.height * 0.5), p.random(30, 60), shapeType, p.color(180, 180, 200));
    }
  }

  void drawScene() {
    // Langit
    parent.background(220, 240, 255);
    
    // Matahari
    parent.fill(255, 200, 0);
    parent.ellipse(100, 100, 120, 120);
    
    // Awan
    drawCloud(cloudX1, 100);
    drawCloud(cloudX2, 150);
    drawCloud(cloudX3, 80);
    
    // Update posisi awan
    cloudX1 += 1;
    cloudX2 += 1;
    cloudX3 += 1;
    if (cloudX1 > parent.width) cloudX1 = -150;
    if (cloudX2 > parent.width) cloudX2 = -150;
    if (cloudX3 > parent.width) cloudX3 = -150;
    
    // Pantai
    parent.fill(255, 220, 180);
    parent.rect(0, parent.height * 0.5, parent.width, parent.height * 0.5);
    
    // Nelayan
    drawFisherman(200, parent.height * 0.55);
    
    // Draw beach trash items
    for (int i = 0; i < numBeachTrashItems; i++) {
      beachTrashItems[i].display();
    }
    
    // Draw building debris items
    for (int i = 0; i < numBuildingDebris; i++) {
      buildingDebris[i].display();
    }
    
    // Bangunan Pemerintahan 1
    drawGovernmentBuilding(500, int(parent.height * 0.55), 150, 150, 5, 4, parent.color(180, 180, 200));
    
    // Bangunan Pemerintahan 2
    drawGovernmentBuilding(300, int(parent.height * 0.55), 150, 150, 5, 4, parent.color(200, 180, 180));
    
    // Bangunan Pemerintahan 3
    drawGovernmentBuilding(100, int(parent.height * 0.55), 150, 150, 5, 4, parent.color(180, 200, 180));
    
    // Laut (dibuat lebih rendah)
    parent.fill(100, 180, 255);
    parent.beginShape();
    parent.vertex(0, parent.height * 0.7);
    for (int x = 0; x <= parent.width; x += 20) {
      float y = parent.height * 0.7 + parent.sin(x * 0.02 + parent.frameCount * 0.02) * 15;
      parent.vertex(x, y);
    }
    parent.vertex(parent.width, parent.height);
    parent.vertex(0, parent.height);
    parent.endShape(PApplet.CLOSE);
  }

  void drawCloud(float x, float y) {
    parent.fill(255);
    parent.ellipse(x, y, 60, 60);
    parent.ellipse(x + 40, y, 60, 60);
    parent.ellipse(x + 20, y - 20, 60, 60);
    parent.ellipse(x + 60, y - 10, 60, 60);
    parent.ellipse(x + 80, y, 60, 60);
  }

  void drawGovernmentBuilding(int x, int y, int w, int h, int rows, int cols, int c) {
    parent.fill(c);
    parent.rect(x, y, w, h);
    
    parent.fill(0);
    parent.rect(x + w / 2 - 10, y + h - 30, 20, 30); // pintu gedung
    
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        parent.fill(255);
        parent.rect(x + 10 + i * ((w - 20) / cols), y + 10 + j * ((h - 40) / rows), (w - 20) / cols - 5, (h - 40) / rows - 5); // jendela gedung
      }
    }
    
    // Menggambar bendera
    parent.fill(255, 0, 0);
    parent.rect(x + w / 2 - 15, y - 20, 30, 10);
    parent.fill(255);
    parent.rect(x + w / 2 - 15, y - 10, 30, 10);
    parent.fill(100);
    parent.rect(x + w / 2 - 15, y - 20, 2, 30);
  }

  void drawFisherman(float x, float y) {
    // Kepala
    parent.fill(255, 224, 189); // Warna kulit
    parent.ellipse(x + 25, y - 80, 40, 40); // Kepala
    
    // Topi
    parent.fill(194, 178, 128); // Warna cokelat muda untuk topi
    parent.ellipse(x + 25, y - 95, 60, 20); // Bagian atas topi dinaikkan
    parent.rect(x + 5, y - 105, 40, 20); // Bagian badan topi dinaikkan
    
    // Tubuh
    parent.fill(34, 139, 34); // Warna hijau untuk baju
    parent.rect(x + 10, y - 60, 30, 40); // Tubuh atas
    
    parent.fill(139, 69, 19); // Warna cokelat untuk jaket
    parent.rect(x + 5, y - 60, 40, 30); // Jaket
    
    parent.fill(34, 139, 34); // Warna hijau untuk celana
    parent.rect(x + 10, y - 30, 30, 30); // Celana
    
    // Sepatu
    parent.fill(105, 105, 105); // Warna abu-abu untuk sepatu
    parent.rect(x + 10, y, 15, 20); // Sepatu kiri
    parent.rect(x + 25, y, 15, 20); // Sepatu kanan
    
    // Lengan dan tangan
    parent.fill(255, 224, 189); // Warna kulit
    parent.rect(x, y - 55, 10, 25); // Lengan kiri
    parent.rect(x + 40, y - 55, 10, 25); // Lengan kanan
    parent.ellipse(x + 5, y - 30, 10, 10); // Tangan kiri
    parent.ellipse(x + 45, y - 30, 10, 10); // Tangan kanan
    
    // Jaring
    parent.fill(255); // Warna putih untuk jaring
    parent.line(x + 25, y - 60, x + 70, y - 80); // Jaring
    parent.line(x + 70, y - 80, x + 70, y - 60); // Jaring bawah
    parent.line(x + 70, y - 80, x + 75, y - 90); // Jaring samping
    
    // Detail wajah
    parent.fill(0); // Warna hitam untuk detail wajah
    parent.ellipse(x + 17, y - 85, 5, 5); // Mata kiri
    parent.ellipse(x + 33, y - 85, 5, 5); // Mata kanan
  }
}

class Trash {
  PApplet parent;
  float x, y, size;
  boolean isFloating;
  int shapeType;
  float floatOffset;
  float floatSpeed;
  
  Trash(PApplet p, float tempX, float tempY, float tempSize, boolean tempIsFloating, int tempShapeType) {
    parent = p;
    x = tempX;
    y = tempY;
    size = tempSize;
    isFloating = tempIsFloating;
    shapeType = tempShapeType;
    floatOffset = parent.random(parent.TWO_PI);
    floatSpeed = parent.random(0.02, 0.05);
  }
  
  void move() {
    if (isFloating) {
      y += parent.sin(floatOffset) * 0.5; // Simulate floating effect
      x += parent.cos(floatOffset) * 0.5; // Simulate horizontal floating effect
      floatOffset += floatSpeed;
      if (y + size / 2 < 0) {
        y = parent.height;
        x = parent.random(parent.width);
      }
    }
  }
  
  void display() {
    parent.fill(139, 69, 19); // Brown color for trash
    parent.noStroke();
    switch(shapeType) {
      case 0:
        drawPlasticBottle(x, y, size);
        break;
      case 1:
        drawPlasticBag(x, y, size);
        break;
      case 2:
        drawPlasticWrapper(x, y, size);
        break;
    }
  }
  
  void drawPlasticBottle(float x, float y, float size) {
    parent.fill(173, 216, 230);
    parent.rect(x - size / 4, y - size / 2, size / 2, size); // Body
    parent.ellipse(x, y - size / 2, size / 2, size / 4); // Top
    parent.fill(255);
    parent.ellipse(x, y + size / 2, size / 2, size / 4); // Bottom
  }
  
  void drawPlasticBag(float x, float y, float size) {
    parent.fill(173, 216, 230, 150);
    parent.beginShape();
    parent.vertex(x - size / 2, y);
    parent.bezierVertex(x - size / 2, y - size / 2, x + size / 2, y - size / 2, x + size / 2, y);
    parent.bezierVertex(x + size / 2, y + size / 2, x - size / 2, y + size / 2, x - size / 2, y);
    parent.endShape(PApplet.CLOSE);
  }
  
  void drawPlasticWrapper(float x, float y, float size) {
    parent.fill(255, 255, 204);
    parent.rect(x - size / 2, y - size / 4, size, size / 2);
    parent.stroke(200, 200, 0);
    parent.line(x - size / 2, y - size / 4, x + size / 2, y + size / 4);
    parent.line(x - size / 2, y + size / 4, x + size / 2, y - size / 4);
    parent.noStroke();
  }
}

class Debris {
  PApplet parent;
  float x, y, size;
  int shapeType;
  int c;
  
  Debris(PApplet p, float tempX, float tempY, float tempSize, int tempShapeType, int tempColor) {
    parent = p;
    x = tempX;
    y = tempY;
    size = tempSize;
    shapeType = tempShapeType;
    c = tempColor;
  }
  
  void display() {
    parent.fill(c);
    parent.noStroke();
    switch(shapeType) {
      case 0:
        parent.rect(x, y, size, size / 2); // Small block
        break;
      case 1:
        parent.rect(x, y, size, size); // Medium block
        break;
      case 2:
        parent.rect(x, y, size * 1.5, size); // Large block
        break;
    }
  }
}
