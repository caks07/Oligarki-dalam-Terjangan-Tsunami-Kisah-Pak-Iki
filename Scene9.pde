class Scene9 {
  PApplet parent;
  float shipX = 0; // Initial X position of the ship
  float shipY = 250; // Y position of the ship (adjusted for the height of the sea)
  boolean casting = true;
  float netX = 0;
  float netY = 0;
  float trashSpeed = 0.5; // Speed of the trash
  float[] trashX = new float[10];
  float[] trashY = new float[10];

  Scene9(PApplet p) {
    parent = p;
    // Initialize trash positions
    for (int i = 0; i < trashX.length; i++) {
      trashX[i] = parent.random(parent.width);
      trashY[i] = parent.random(450, 550);
    }
  }

  void drawScene() {
    drawBackground();

    // Draw the ship with fisherman
    drawShip(shipX, shipY, 1.0);

    // Update ship position
    shipX += 2;
    if (shipX > parent.width) {
      shipX = -400;
    }

    // Draw and update trash positions
    for (int i = 0; i < trashX.length; i++) {
      drawTrash(trashX[i], trashY[i]);
      trashY[i] += trashSpeed;
      if (trashY[i] > parent.height) {
        trashY[i] = 450;
      }
    }

    // Update fishing net movement
    if (casting) {
      netX -= 2;
      netY += 1;
      if (netX < -60) {
        casting = false;
      }
    } else {
      netX += 2;
      netY -= 1;
      if (netX > 0) {
        casting = true;
      }
    }
  }

  void drawBackground() {
    // Draw the sky
    parent.background(135, 206, 235);

    // Draw the water
    parent.fill(70, 130, 180);
    parent.rect(0, 300, parent.width, 300);

    // Draw the sun
    parent.fill(255, 223, 0);
    parent.ellipse(700, 100, 80, 80);
  }

  void drawShip(float x, float y, float scale) {
    parent.pushMatrix();
    parent.translate(x, y);
    parent.scale(scale);

    // Drawing the hull
    parent.fill(139, 69, 19);
    parent.beginShape();
    parent.vertex(200, 100);
    parent.vertex(600, 100);
    parent.vertex(550, 150);
    parent.vertex(250, 150);
    parent.endShape(parent.CLOSE);

    // Drawing the hull details
    parent.fill(139, 69, 19);
    for (int i = 0; i < 5; i++) {
      parent.rect(250 + i * 60, 110, 50, 10);
    }

    // Drawing the main mast
    parent.fill(139, 69, 19);
    parent.rect(380, 0, 20, 100);

    // Drawing the right sail
    parent.fill(255, 228, 196);
    parent.beginShape();
    parent.vertex(400, 0);
    parent.vertex(500, 50);
    parent.vertex(400, 100);
    parent.endShape(parent.CLOSE);

    // Drawing the top sail
    parent.fill(255, 228, 196);
    parent.beginShape();
    parent.vertex(400, -50);
    parent.vertex(350, 0);
    parent.vertex(450, 0);
    parent.endShape(parent.CLOSE);

    // Draw the fisherman on the ship
    drawFisherman(300, 50, 1.0); // Adjusted position

    // Draw the pile of trash on the ship
    drawPileOfTrash(400, 120); // Adjusted position

    parent.popMatrix();
  }

  void drawFisherman(float x, float y, float scale) {
    parent.pushMatrix();
    parent.translate(x, y);
    parent.scale(scale);
    parent.noStroke();

    // Fisherman's head
    parent.fill(240, 200, 160);
    parent.ellipse(0, -50, 40, 40);

    // Fisherman's hat
    parent.fill(139, 69, 19);
    parent.beginShape();
    parent.vertex(-30, -70);
    parent.vertex(30, -70);
    parent.vertex(0, -100);
    parent.endShape(parent.CLOSE);
    parent.rect(-30, -70, 60, 10);

    // Fisherman's eyes
    parent.fill(0);
    parent.ellipse(-10, -50, 6, 6);
    parent.ellipse(10, -50, 6, 6);

    // Fisherman's mouth
    parent.fill(0);
    parent.ellipse(0, -40, 5, 5);

    // Fisherman's body
    parent.fill(0, 150, 150);
    parent.rect(-20, -30, 40, 60);

    // Fisherman's arms
    parent.fill(240, 200, 160);
    parent.rect(-40, -30, 20, 10); // Left arm
    parent.rect(20, -30, 20, 10); // Right arm

    // Fishing net
    parent.stroke(139, 69, 19);
    parent.strokeWeight(2);
    parent.line(-30, -20, netX - 30, netY - 100); // Net line
    parent.noStroke();

    // Drawing the net
    drawNet(netX - 30, netY - 100);

    // Fisherman's hands
    parent.fill(240, 200, 160);
    parent.ellipse(-30, -20, 15, 15); // Left hand
    parent.ellipse(30, -20, 15, 15);  // Right hand

    // Fisherman's legs
    parent.fill(160, 82, 45);
    parent.rect(-15, 30, 10, 30); // Left leg
    parent.rect(5, 30, 10, 30); // Right leg

    // Fisherman's feet
    parent.fill(0);
    parent.rect(-17, 60, 15, 10); // Left foot
    parent.rect(3, 60, 15, 10); // Right foot

    parent.popMatrix();
  }

  void drawNet(float x, float y) {
    parent.fill(200, 200, 200, 150); // Grey, semi-transparent
    parent.beginShape();
    parent.vertex(x, y);
    parent.vertex(x + 40, y + 20);
    parent.vertex(x + 60, y + 80);
    parent.vertex(x + 20, y + 60);
    parent.endShape(parent.CLOSE);

    // Draw net lines
    parent.stroke(150);
    for (int i = 0; i < 4; i++) {
      parent.line(x + i * 10, y, x + 40, y + 20 + i * 10);
    }
    for (int i = 0; i < 4; i++) {
      parent.line(x, y + i * 10, x + 60 - i * 10, y + 80);
    }
  }

  void drawPileOfTrash(float x, float y) {
    for (int i = 0; i < 5; i++) {
      drawTrash(x + parent.random(-20, 20), y + parent.random(-20, 20));
    }
  }

  void drawTrash(float x, float y) {
    drawBottle(x, y);
    drawBag(x + 30, y - 10);
    drawOtherTrash(x + 60, y + 20);
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

  void drawOtherTrash(float x, float y) {
    parent.fill(169, 169, 169);
    parent.rect(x, y, 20, 10); // Contoh sampah
    parent.fill(255, 0, 0);
    parent.rect(x + 30, y + 10, 15, 10); // Contoh sampah
    parent.fill(0, 0, 255);
    parent.rect(x + 60, y - 5, 10, 25); // Contoh sampah
  }
}
