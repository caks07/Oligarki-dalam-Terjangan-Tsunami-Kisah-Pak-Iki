import ddf.minim.*;

class Scene14 {
  PApplet parent;
  float shipX1 = 0; // Initial X position of the first ship
  float shipY1 = 300; // Y position of the first ship
  float shipX2 = -200; // Initial X position of the second ship
  float shipY2 = 350; // Y position of the second ship
  float shipX3 = -400; // Initial X position of the third ship
  float shipY3 = 250; // Y position of the third ship

  Scene14(PApplet p) {
    parent = p;
  }

  void drawScene() {
    drawBackground();
    
    // Draw ships with different scales
    drawShip(shipX1, shipY1, 1.0);
    drawShip(shipX2, shipY2, 0.8);
    drawShip(shipX3, shipY3, 0.6);
    
    // Update ship positions
    shipX1 += 2;
    shipX2 += 1.5;
    shipX3 += 1;

    // Reset ship positions when they go off screen
    if (shipX1 > parent.width) {
      shipX1 = -400;
    }
    if (shipX2 > parent.width) {
      shipX2 = -400;
    }
    if (shipX3 > parent.width) {
      shipX3 = -400;
    }
  }

  void drawBackground() {
    // Draw the night sky
    parent.background(30, 50, 112);
    
    // Draw the water
    parent.fill(25, 25, 112);
    parent.rect(0, 200, parent.width, 400);
    
    // Draw some stars
    parent.fill(255);
    for (int i = 0; i < 50; i++) {
      float starX = parent.random(parent.width);
      float starY = parent.random(200);
      parent.ellipse(starX, starY, 2, 2);
    }
    
    // Draw the moon
    parent.fill(255, 255, 224);
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
    parent.endShape(CLOSE);
    
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
    parent.endShape(CLOSE);
    
    // Drawing the top sail
    parent.fill(255, 228, 196);
    parent.beginShape();
    parent.vertex(400, -50);
    parent.vertex(350, 0);
    parent.vertex(450, 0);
    parent.endShape(CLOSE);
    
    parent.popMatrix();
  }
}
