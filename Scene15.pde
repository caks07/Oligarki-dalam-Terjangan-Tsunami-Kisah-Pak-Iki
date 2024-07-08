class Scene15 {
  PApplet parent;
  int numKapal = 7; // Jumlah kapal
  float[] geserX = new float[numKapal];
  float[] geserY = new float[numKapal];
  float[] ukuran = new float[numKapal];
  int[] clayar = {0xFFFF4545, 0xFF7DFF45, 0xFF5445FF, 0xFFF345FF}; // Warna kapal
  boolean guncanganBesar = false;
  int lastGuncanganTime = 0;
  int guncanganInterval = 5000; // 5 detik dalam milidetik

  Scene15(PApplet p) {
    parent = p;
    // Inisialisasi posisi dan ukuran kapal secara acak
    for (int i = 0; i < numKapal; i++) {
      geserX[i] = parent.random(50, parent.width - 50);
      geserY[i] = parent.random(300, parent.height - 50);
      ukuran[i] = parent.random(0.5, 2.0);
    }
    // Set waktu awal untuk guncangan besar
    lastGuncanganTime = parent.millis();
  }

  void drawScene() {
    parent.background(135, 206, 235); // Sky blue color

    // Draw the sun
    warna(0xFFFFFF00, 0xFFFFFF00);
    parent.ellipse(700, 100, 80, 80);

    // Draw the water
    warna(0xFF279AC4, 0xFF25C1FA);
    parent.rect(0, 300, parent.width, 300);

    // Cek apakah 5 detik telah berlalu untuk guncangan besar berikutnya
    if (parent.millis() - lastGuncanganTime > guncanganInterval) {
      guncanganBesar = true;
      lastGuncanganTime = parent.millis();
    }

    for (int i = 0; i < numKapal; i++) {
      parent.pushMatrix();
      float offsetY = parent.sin(parent.frameCount * 0.05f + i) * 5; // Normal rocking motion
      if (guncanganBesar) {
        offsetY += parent.random(-20, 20); // Large shake effect
      }
      parent.translate(geserX[i], geserY[i] + offsetY);
      Kapal(0, 0, ukuran[i], clayar[i % clayar.length]);
      parent.popMatrix();
    }

    // Reset guncangan besar setelah beberapa frame
    if (guncanganBesar && parent.millis() - lastGuncanganTime > 500) {
      guncanganBesar = false;
    }
  }

  void warna(int garis, int isi) {
    parent.stroke(garis);
    parent.fill(isi);
  }

  void Kapal(float x, float y, float skala, int a) {
    parent.pushMatrix();
    parent.scale(skala);
    parent.translate(x / skala, y / skala); // Adjust position according to scale
    
    warna(0xFF735B3E, 0xFFBF9A6D);
    parent.quad(0, 0, 80, 0, 60, 25, 20, 25);
    warna(0xFF0F0F0F, a);
    parent.triangle(10, -5, 50, -50, 50, -5);
    
    parent.popMatrix();
  }
}
