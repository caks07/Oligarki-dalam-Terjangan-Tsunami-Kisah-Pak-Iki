class Scene4 {
  PApplet parent;
  float shipX;
  float shipY;
  boolean casting;
  float rodX;
  float rodY;
  float fishSpeed;

  Scene4(PApplet p) {
    parent = p;
    shipX = 0;
    shipY = 250;
    casting = true;
    rodX = 0;
    rodY = 0;
    fishSpeed = 0.5;
  }

  void drawScene() {
    drawBackground();

    // Draw the ship with fisherman and fish box
    drawShip(shipX, shipY, 1.0);

    // Update ship position
    shipX += 2;
    if (shipX > parent.width) {
      shipX = -400;
    }

    // Draw fish in the water
    for (int i = 0; i < 20; i++) {
      drawFish(parent.random(parent.width), parent.random(450, 550), fishSpeed, parent.color(80, 160, 180), parent.color(240, 240, 230));
    }

    // Update fishing rod movement
    if (casting) {
      rodX -= 2;
      rodY += 1;
      if (rodX < -60) {
        casting = false;
      }
    } else {
      rodX += 2;
      rodY -= 1;
      if (rodX > 0) {
        casting = true;
      }
    }
  }

  void drawBackground() {
    // Draw the sky
    parent.background(135, 206, 235);

    // Draw the sun in the top right corner
    parent.fill(255, 223, 0);
    parent.ellipse(parent.width - 100, 100, 80, 80);

    // Draw the mountains symmetrically in the center
    parent.fill(34, 139, 34);
    parent.triangle(parent.width / 2 - 200, 300, parent.width / 2, 100, parent.width / 2 + 200, 300);
    parent.triangle(parent.width / 2 - 400, 300, parent.width / 2 - 200, 150, parent.width / 2, 300);

    // Draw the water
    parent.fill(70, 130, 180);
    parent.rect(0, 300, parent.width, 300);
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
    parent.endShape(PApplet.CLOSE);

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
    parent.endShape(PApplet.CLOSE);

    // Drawing the top sail
    parent.fill(255, 228, 196);
    parent.beginShape();
    parent.vertex(400, -50);
    parent.vertex(350, 0);
    parent.vertex(450, 0);
    parent.endShape(PApplet.CLOSE);

    // Draw the fish box on the ship
    drawFishBox(500, 70, 1.0); // Adjusted position

    // Draw the fisherman on the ship
    drawFisherman(300, 50, 1.0); // Adjusted position

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
    parent.endShape(PApplet.CLOSE);
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

    // Fishing rod
    parent.stroke(139, 69, 19);
    parent.strokeWeight(4);
    parent.line(-20, -20, rodX - 20, rodY - 100); // Rod
    parent.noStroke();

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

  void drawFishBox(float x, float y, float scale) {
    parent.pushMatrix();
    parent.translate(x, y);
    parent.scale(scale);
    parent.noStroke();

    // Draw the box
    parent.fill(139, 69, 19);
    parent.rect(-50, -30, 100, 60);

    // Draw the fish inside the box
    for (int i = 0; i < 5; i++) {
      drawFish(parent.random(-40, 40), parent.random(-20, 20), 0.5, parent.color(80, 160, 180), parent.color(240, 240, 230));
    }

    parent.popMatrix();
  }

  void drawFish(float x, float y, float speed, int bodyColor, int headColor) {
    parent.pushMatrix();
    parent.translate(x, y);
    parent.scale(1.0);
    parent.noStroke();

    // Fish body
    parent.fill(bodyColor);
    parent.beginShape();
    parent.vertex(-30, -10); // left top
    parent.vertex(20, -10);  // right top
    parent.vertex(30, 0);    // right middle
    parent.vertex(20, 10);   // right bottom
    parent.vertex(-30, 10);  // left bottom
    parent.endShape(PApplet.CLOSE);

    // Fish head
    parent.fill(headColor);
    parent.ellipse(-30, 0, 20, 20);

    // Fish eye
    parent.fill(0);
    parent.ellipse(-35, -3, 5, 5);

    // Fish mouth
    parent.fill(0);
    parent.triangle(-40, 0, -35, 3, -35, -3);

    // Fish tail
    parent.fill(0, 90, 120);
    parent.beginShape();
    parent.vertex(30, 0);   // middle
    parent.vertex(40, -10); // top
    parent.vertex(40, 10);  // bottom
    parent.endShape(PApplet.CLOSE);

    // Fish fins
    parent.fill(0, 90, 120);
    parent.triangle(-10, -10, -5, -15, 0, -10); // top fin
    parent.triangle(-10, 10, -5, 15, 0, 10);    // bottom fin

    // Fish scales (stripes)
    parent.stroke(0, 90, 120);
    parent.strokeWeight(2);
    parent.noFill();

    // First stripe
    parent.beginShape();
    parent.vertex(-20, -10);
    parent.bezierVertex(-10, -7, -10, 7, -20, 10);
    parent.endShape();

    // Second stripe
    parent.beginShape();
    parent.vertex(0, -10);
    parent.bezierVertex(10, -7, 10, 7, 0, 10);
    parent.endShape();

    parent.popMatrix();
  }
}
