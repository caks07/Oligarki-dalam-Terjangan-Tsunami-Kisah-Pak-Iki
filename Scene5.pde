class Scene5 {
  PApplet parent;
  int numPeople = 20; // Jumlah orang
  float[] x = new float[numPeople];
  float[] y = new float[numPeople];
  float[] speedX = new float[numPeople];
  float[] speedY = new float[numPeople];
  boolean[] hasLittered = new boolean[numPeople];
  color[] shirtColors = new color[numPeople]; // Array untuk warna baju

  // Variables for clouds
  int numClouds = 3;
  float[] cloudX = new float[numClouds];
  float[] cloudY = new float[numClouds];
  float[] cloudSpeed = new float[numClouds];

  // Variables for sun
  float sunX = 700;
  float sunY = 100;

  // Variables for umbrellas
  int numUmbrellas = 5;
  float[] umbrellaX = new float[numUmbrellas];
  float[] umbrellaY = new float[numUmbrellas];

  // Variables for palm trees
  int numPalms = 3;
  float[] palmX = new float[numPalms];
  float[] palmY = new float[numPalms];

  // Variables for mats
  int numMats = 7;
  float[] matX = new float[numMats];
  float[] matY = new float[numMats];
  color[] matColors = new color[numMats]; // Array untuk warna tikar

  Scene5(PApplet p) {
    parent = p;
    for (int i = 0; i < numPeople; i++) {
      x[i] = parent.random(parent.width);
      y[i] = parent.random(parent.height / 2, parent.height);
      speedX[i] = parent.random(-1, 1);
      speedY[i] = parent.random(-1, 1);
      hasLittered[i] = false;
      shirtColors[i] = parent.color(parent.random(255), parent.random(255), parent.random(255)); // Warna baju acak
    }

    for (int i = 0; i < numClouds; i++) {
      cloudX[i] = parent.random(50, 750);
      cloudY[i] = parent.random(50, 150);
      cloudSpeed[i] = parent.random(0.2, 0.5);
    }

    for (int i = 0; i < numUmbrellas; i++) {
      umbrellaX[i] = parent.random(parent.width);
      umbrellaY[i] = parent.random(parent.height / 2, parent.height - 50);
    }

    for (int i = 0; i < numPalms; i++) {
      palmX[i] = parent.random(parent.width);
      palmY[i] = parent.height / 2;
    }

    for (int i = 0; i < numMats; i++) {
      matX[i] = parent.random(parent.width);
      matY[i] = parent.random(parent.height / 2, parent.height - 50);
      matColors[i] = parent.color(parent.random(255), parent.random(255), parent.random(255)); // Warna tikar acak
    }
  }

  void drawScene() {
    parent.background(135, 206, 235); // Warna langit
    drawBeach();
    drawOcean();
    
    // Matahari
    drawSun(sunX, sunY);
    
    // Awan
    parent.fill(255);
    parent.noStroke();
    for (int i = 0; i < numClouds; i++) {
      cloudX[i] += cloudSpeed[i];
      if (cloudX[i] > parent.width + 40) cloudX[i] = -40;
      parent.ellipse(cloudX[i], cloudY[i], 80, 60);
      parent.ellipse(cloudX[i] - 30, cloudY[i] + 10, 60, 40);
      parent.ellipse(cloudX[i] + 30, cloudY[i] + 10, 60, 40);
    }
    
    // Tikar
    for (int i = 0; i < numMats; i++) {
      drawMat(matX[i], matY[i], matColors[i]);
    }
    
    // Pohon kelapa
    for (int i = 0; i < numPalms; i++) {
      drawPalmTree(palmX[i], palmY[i]);
    }
    
    for (int i = 0; i < numPeople; i++) {
      drawPerson(x[i], y[i], shirtColors[i]);
      x[i] += speedX[i];
      y[i] += speedY[i];
      if (x[i] < 0 || x[i] > parent.width) speedX[i] *= -1;
      if (y[i] < parent.height / 2 || y[i] > parent.height) speedY[i] *= -1;
    }
    
    // Payung
    for (int i = 0; i < numUmbrellas; i++) {
      drawUmbrella(umbrellaX[i], umbrellaY[i]);
    }
  }

  void drawBeach() {
    parent.fill(240, 230, 140); // Warna pasir
    parent.rect(0, parent.height / 2, parent.width, parent.height / 2);
  }

  void drawOcean() {
    parent.fill(0, 105, 148); // Warna laut
    parent.rect(0, parent.height / 2 - 50, parent.width, 50);
  }

  void drawSun(float x, float y) {
    parent.fill(255, 223, 0);
    parent.ellipse(x, y, 80, 80);
    
    // Garis-garis matahari
    parent.stroke(255, 223, 0);
    for (int i = 0; i < 360; i += 15) {
      float angle = parent.radians(i);
      float x1 = x + parent.cos(angle) * 50; // Adjusted from 40 to 50
      float y1 = y + parent.sin(angle) * 50; // Adjusted from 40 to 50
      float x2 = x + parent.cos(angle) * 80; // Adjusted from 60 to 80
      float y2 = y + parent.sin(angle) * 80; // Adjusted from 60 to 80
      parent.line(x1, y1, x2, y2);
    }
  }

  void drawPerson(float x, float y, color shirtColor) {
    // Kepala
    parent.fill(255, 220, 177); // Warna kulit
    parent.ellipse(x, y - 40, 20, 20);
    
    // Rambut
    parent.fill(255, 165, 0); // Warna rambut oren
    parent.ellipse(x, y - 50, 25, 15);
    
    // Badan
    parent.fill(shirtColor); // Warna baju sesuai array shirtColors
    parent.rect(x - 10, y - 30, 20, 30);
    
    // Kaki
    parent.fill(255, 220, 177); // Warna kulit
    parent.rect(x - 10, y, 10, 20);
    parent.rect(x, y, 10, 20);
    
    // Tangan
    parent.fill(255, 220, 177); // Warna kulit
    parent.rect(x - 20, y - 30, 10, 20);
    parent.rect(x + 10, y - 30, 10, 20);
    
    // Detail tambahan
    // Mata
    parent.fill(0);
    parent.ellipse(x - 5, y - 42, 3, 3);
    parent.ellipse(x + 5, y - 42, 3, 3);
    
    // Mulut
    parent.noFill();
    parent.stroke(0);
    parent.arc(x, y - 35, 10, 5, 0, parent.PI);
    
    // Celana pendek
    parent.fill(0, 0, 255); // Warna celana
    parent.rect(x - 10, y, 20, 10);
    
    // Sandal
    parent.fill(255, 0, 0); // Warna sandal
    parent.rect(x - 10, y + 20, 10, 5);
    parent.rect(x, y + 20, 10, 5);
  }

  void drawMat(float x, float y, color matColor) {
    parent.fill(matColor); // Warna tikar acak
    parent.rect(x, y, 60, 40);
  }

  void drawUmbrella(float x, float y) {
    // Tiang payung
    parent.stroke(160, 82, 45); // Warna cokelat untuk tiang
    parent.strokeWeight(4);
    parent.line(x, y, x, y - 60);
    
    // Kanopi payung
    parent.fill(255, 0, 0); // Warna merah untuk kanopi
    parent.noStroke();
    parent.arc(x, y - 60, 80, 80, parent.PI, parent.TWO_PI);
  }

  void drawPalmTree(float x, float y) {
    // Batang pohon kelapa
    parent.stroke(139, 69, 19); // Warna cokelat untuk batang
    parent.strokeWeight(10);
    parent.line(x, y, x, y - 100);
    
    // Daun kelapa
    parent.stroke(34, 139, 34); // Warna hijau untuk daun
    parent.strokeWeight(4);
    for (int i = 0; i < 5; i++) {
      parent.line(x, y - 100, x + parent.cos(parent.PI / 3 * i) * 50, y - 100 - parent.sin(parent.PI / 3 * i) * 30);
      parent.line(x, y - 100, x - parent.cos(parent.PI / 3 * i) * 50, y - 100 - parent.sin(parent.PI / 3 * i) * 30);
    }
  }
}
