import processing.core.PApplet;

public class Main extends PApplet {

  Scene12 scene12;


  public void settings() {
    size(800, 600);
  }

  public void setup() {
    scene12 = new Scene12(this);
  }

  public void draw() {
    scene12.drawScene();
  }
}

class Scene12 {
  PApplet parent;
  // Variabel untuk animasi awan
  float cloudX1 = 0;
  float cloudY1 = 100;
  float cloudX2 = 400;
  float cloudY2 = 150;
  float cloudX3 = 200;
  float cloudY3 = 80;

  // Variabel untuk animasi karakter
  float nelayanArmAngle = 0;
  boolean nelayanArmUp = true;
  float[] pemerintahArmAngle = {0, 0, 0, 0};
  boolean[] pemerintahArmUp = {true, true, true, true};

  Scene12(PApplet p) {
    parent = p;
  }

  void drawScene() {
    parent.background(180, 220, 230);
    drawBackgroundScene();

    // Menggerakkan awan pertama
    cloudX1 += 1;
    if (cloudX1 > parent.width) {
      cloudX1 = -100; // reset posisi awan ketika sudah keluar layar
    }

    // Menggerakkan awan kedua
    cloudX2 += 1.5;
    if (cloudX2 > parent.width) {
      cloudX2 = -100; // reset posisi awan ketika sudah keluar layar
    }

    // Menggerakkan awan ketiga
    cloudX3 += 1.2;
    if (cloudX3 > parent.width) {
      cloudX3 = -100; // reset posisi awan ketika sudah keluar layar
    }

    // Menggambar awan
    drawCloud(cloudX1, cloudY1);
    drawCloud(cloudX2, cloudY2);
    drawCloud(cloudX3, cloudY3);

    // Animasi karakter
    animateNelayan();
    animatePemerintah();
  }

  void drawBackgroundScene() {
    // Menggambar jalanan
    parent.fill(34, 139, 34);
    parent.rect(0, parent.height / 2, parent.width, parent.height / 2);

    // Menggambar trotoar
    parent.fill(150);
    parent.rect(0, parent.height * 3 / 4, parent.width, parent.height / 8);

    // Menggambar gedung pertama
    drawBuilding(600, 200, 150, 150, 5, 4, parent.color(180, 180, 200));

    // Menggambar gedung kedua
    drawBuilding(400, 230, 150, 100, 4, 3, parent.color(200, 180, 180));

    // Menggambar gedung ketiga
    drawBuilding(200, 250, 100, 130, 3, 2, parent.color(180, 200, 180));

    // Menggambar marka putih di trotoar
    drawSidewalkMarkings();



    // Menggambar karakter pemerintah 1
    drawCharacterPemerintah(300, 470, 0);

    // Menggambar karakter pemerintah 2
    drawCharacterPemerintah(400, 470, 1);

    // Menggambar karakter pemerintah 3
    drawCharacterPemerintah(500, 470, 2);

    // Menggambar karakter Pak Iki
    drawCharacterPakIki(100, 470);
  }

  void drawBuilding(int x, int y, int w, int h, int rows, int cols, color c) {
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

 

  void drawCharacterPemerintah(int x, int y, int index) {
    parent.noStroke();
    parent.fill(255, 224, 189); // warna kulit kepala
    parent.ellipse(x, y, 30, 40); // kepala

    parent.fill(0, 0, 0); // warna rambut
    drawDetailedHair(x, y - 20); // rambut

    parent.fill(0);
    parent.ellipse(x - 5, y - 5, 5, 5); // mata kiri
    parent.ellipse(x + 5, y - 5, 5, 5); // mata kanan

    parent.fill(255, 0, 0); // warna mulut
    parent.arc(x, y + 10, 20, 10, 0, parent.PI); // mulut

    parent.fill(0); // warna baju hitam
    parent.rect(x - 15, y + 20, 30, 50); // badan

    parent.pushMatrix();
    parent.translate(x - 20, y + 40);
    parent.rotate(pemerintahArmAngle[index]);
    parent.fill(255, 224, 189); // warna kulit tangan
    parent.rect(0, 0, 5, 50); // lengan kiri
    parent.popMatrix();

    parent.pushMatrix();
    parent.translate(x + 15, y + 40);
    parent.rotate(-pemerintahArmAngle[index]);
    parent.fill(255, 224, 189); // warna kulit tangan
    parent.rect(0, 0, 5, 50); // lengan kanan
    parent.popMatrix();

    parent.fill(255, 255, 255); // warna celana hijau
    parent.rect(x - 15, y + 70, 15, 40); // kaki kiri
    parent.rect(x, y + 70, 15, 40); // kaki kanan

    parent.fill(0); // warna sepatu hitam
    parent.rect(x - 15, y + 110, 15, 10); // sepatu kiri
    parent.rect(x, y + 110, 15, 10); // sepatu kanan

    // Menggambar dasi
    drawTie(x, y + 20); // menggambar dasi merah
  }

  void drawCharacterPakIki(int x, int y) {
    parent.noStroke();
    parent.fill(255, 224, 189); // warna kulit kepala
    parent.ellipse(x, y, 40, 40); // kepala

    drawHat(x, y - 20); // menggambar topi

    parent.fill(0);
    parent.ellipse(x - 5, y - 5, 5, 5); // mata kiri
    parent.ellipse(x + 5, y - 5, 5, 5); // mata kanan

    parent.fill(255, 0, 0); // warna mulut
    parent.arc(x, y + 10, 20, 10, 0, parent.PI); // mulut

    parent.fill(139, 69, 19); // warna baju coklat
    parent.rect(x - 15, y + 20, 30, 50); // badan

    parent.fill(255, 224, 189); // warna kulit tangan
    parent.rect(x - 20, y + 20, 5, 50); // lengan kiri
    parent.rect(x + 15, y + 20, 5, 50); // lengan kanan

    parent.fill(137, 243, 54); // warna celana hijau terang
    parent.rect(x - 15, y + 70, 15, 40); // kaki kiri
    parent.rect(x, y + 70, 15, 40); // kaki kanan

    parent.fill(0); // warna sepatu hitam
    parent.rect(x - 15, y + 110, 15, 10); // sepatu kiri
    parent.rect(x, y + 110, 15, 10); // sepatu kanan
  }

  void animateNelayan() {
    if (nelayanArmUp) {
      nelayanArmAngle += 0.05;
      if (nelayanArmAngle > parent.PI / 4) {
        nelayanArmUp = false;
      }
    } else {
      nelayanArmAngle -= 0.05;
      if (nelayanArmAngle < -parent.PI / 4) {
        nelayanArmUp = true;
      }
    }
  }

  void animatePemerintah() {
    for (int i = 0; i < pemerintahArmAngle.length; i++) {
      if (pemerintahArmUp[i]) {
        pemerintahArmAngle[i] += 0.05;
        if (pemerintahArmAngle[i] > parent.PI / 6) {
          pemerintahArmUp[i] = false;
        }
      } else {
        pemerintahArmAngle[i] -= 0.05;
        if (pemerintahArmAngle[i] < -parent.PI / 6) {
          pemerintahArmUp[i] = true;
        }
      }
    }
  }

  void drawDetailedHair(int x, int y) {
    parent.fill(0); // warna rambut hitam
    parent.beginShape();
    parent.vertex(x - 20, y);
    parent.bezierVertex(x - 15, y - 20, x + 15, y - 20, x + 20, y);
    parent.endShape(PApplet.CLOSE);

    parent.fill(0); // warna rambut hitam
    parent.beginShape();
    parent.vertex(x - 20, y);
    parent.bezierVertex(x - 10, y + 20, x + 10, y + 20, x + 20, y);
    parent.endShape(PApplet.CLOSE);

    parent.ellipse(x, y, 30, 20); // rambut tambahan
  }

  void drawHat(int x, int y) {
    parent.fill(194, 178, 128); // warna topi
    parent.ellipse(x, y, 50, 20); // bagian atas topi
    parent.rect(x - 25, y, 50, 10); // bagian bawah topi
  }

  void drawCloud(float x, float y) {
    parent.fill(255);
    parent.noStroke();
    parent.ellipse(x, y, 40, 40);
    parent.ellipse(x + 30, y, 50, 50);
    parent.ellipse(x + 60, y, 40, 40);
    parent.ellipse(x + 30, y - 20, 50, 50);
  }

  void drawSidewalkMarkings() {
    parent.stroke(255);
    parent.strokeWeight(5);
    for (int i = 0; i < parent.width; i += 40) {
      parent.line(i, parent.height * 3 / 4 + parent.height / 16, i + 20, parent.height * 3 / 4 + parent.height / 16);
    }
  }

  void drawTie(int x, int y) {
    parent.fill(255, 0, 0); // warna dasi merah
    parent.beginShape();
    parent.vertex(x - 5, y);
    parent.vertex(x + 5, y);
    parent.vertex(x, y + 10);
    parent.endShape(PApplet.CLOSE);
  }
}
