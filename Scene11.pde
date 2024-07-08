class Scene11 {
  PApplet parent;
  float fish1X, fish2X, fish3X, fish4X, fish5X, fish6X;
  Bubble[] bubbles;
  Trash[] trashItems;
  int numBubbles = 10;
  int numTrashItems = 30; // Increased number of trash items
  int numCorals = 10; // Number of coral objects
  Coral[] corals;

  Scene11(PApplet p) {
    parent = p;
    fish1X = 150;
    fish2X = parent.width - 150;
    fish3X = 200;
    fish4X = 350;
    fish5X = 500;
    fish6X = 650;

    bubbles = new Bubble[numBubbles];
    for (int i = 0; i < numBubbles; i++) {
      bubbles[i] = new Bubble(parent.random(parent.width), parent.random(parent.height), parent.random(10, 30));
    }

    trashItems = new Trash[numTrashItems];
    for (int i = 0; i < numTrashItems; i++) {
      boolean isFloating = parent.random(1) > 0.5; // 50% chance to be floating
      int shapeType = int(parent.random(2)); // Random shape type: 0 - bottle, 1 - bag
      trashItems[i] = new Trash(parent.random(parent.width), isFloating ? parent.random(parent.height) : parent.height - parent.random(20, 50), parent.random(20, 50), isFloating, shapeType); // Larger size
    }

    corals = new Coral[numCorals];
    for (int i = 0; i < numCorals; i++) {
      corals[i] = new Coral(parent.random(parent.width), parent.height - parent.random(50, 100));
    }
  }

  void drawScene() {
    // Draw the underwater background
    parent.background(0, 105, 148);

    // Draw the seabed
    parent.fill(28, 53, 45);
    parent.noStroke();
    parent.rect(0, 500, parent.width, 100);

    // Draw corals
    for (int i = 0; i < numCorals; i++) {
      corals[i].display();
    }

    // Draw some seaweed
    drawSeaweed(50, 480);
    drawSeaweed(750, 500);

    // Draw the fish facing each other
    drawFish1(fish1X, 300, true);
    drawFish1(fish2X, 300, false);

    // Draw smaller fish in the background
    drawSmallFish(fish3X, 200);
    drawSmallFish(fish4X, 250);
    drawSmallFish(fish5X, 150);
    drawSmallFish(fish6X, 220);

    // Draw bubbles from the Bubble class
    for (int i = 0; i < numBubbles; i++) {
      bubbles[i].move();
      bubbles[i].display();
    }

    // Draw trash from the Trash class
    for (int i = 0; i < numTrashItems; i++) {
      if (trashItems[i].isFloating) {
        trashItems[i].move();
      }
      trashItems[i].display();
    }

    animateObjects();
  }

  void animateObjects() {
    // Move the fish facing each other
    fish1X += 1;
    fish2X -= 1;
    if (fish1X > parent.width + 50) fish1X = -50;
    if (fish2X < -50) fish2X = parent.width + 50;

    // Move the small fish in the background
    fish3X += 1;
    fish4X += 1;
    fish5X += 1;
    fish6X += 1;
    if (fish3X > parent.width) fish3X = -50;
    if (fish4X > parent.width) fish4X = -50;
    if (fish5X > parent.width) fish5X = -50;
    if (fish6X > parent.width) fish6X = -50;
  }

  void drawFish1(float x, float y, boolean facingRight) {
    parent.pushMatrix();
    parent.translate(x, y);
    if (!facingRight) parent.scale(-1, 1);
    parent.fill(255, 69, 0);
    parent.ellipse(0, 0, 60, 40); // Body
    parent.fill(255, 255, 255);
    parent.ellipse(15, -10, 10, 10); // Eye
    parent.fill(0, 0, 0);
    parent.ellipse(15, -10, 5, 5); // Pupil
    parent.fill(255, 69, 0);
    parent.triangle(-30, 0, -50, -15, -50, 15); // Tail
    parent.stroke(0);
    parent.line(-15, -20, -15, 20); // Body stripe
    parent.line(0, -20, 0, 20); // Body stripe
    parent.line(15, -20, 15, 20); // Body stripe
    parent.noStroke();
    parent.fill(0);
    parent.arc(20, 5, 10, 10, 0, parent.PI); // Mouth
    // Fins
    parent.fill(255, 69, 0);
    parent.triangle(-10, -20, -20, -35, -30, -20); // Top fin
    parent.triangle(-10, 20, -20, 35, -30, 20); // Bottom fin

    // Simulate fish taking trash
    for (int i = 0; i < numTrashItems; i++) {
      float d = PApplet.dist(x, y, trashItems[i].x, trashItems[i].y);
      if (d < 50) { // if fish is close to the trash
        trashItems[i].x = x;
        trashItems[i].y = y;
      }
    }

    parent.popMatrix();
  }

  void drawSmallFish(float x, float y) {
    parent.fill(255, 204, 0);
    parent.ellipse(x, y, 40, 20); // Body
    parent.fill(255);
    parent.ellipse(x + 15, y - 5, 5, 5); // Eye
    parent.fill(0);
    parent.ellipse(x + 15, y - 5, 2, 2); // Pupil
    parent.fill(255, 204, 0);
    parent.triangle(x - 20, y, x - 30, y - 10, x - 30, y + 10); // Tail
    // Fins
    parent.fill(255, 204, 0);
    parent.triangle(x - 5, y - 10, x - 15, y - 20, x - 25, y - 10); // Top fin
    parent.triangle(x - 5, y + 10, x - 15, y + 20, x - 25, y + 10); // Bottom fin
  }

  void drawSeaweed(float x, float y) {
    parent.fill(34, 139, 34);
    parent.noStroke();
    parent.beginShape();
    parent.vertex(x, y);
    parent.bezierVertex(x - 20, y - 40, x + 10, y - 70, x - 10, y - 100);
    parent.bezierVertex(x + 10, y - 70, x - 20, y - 40, x, y);
    parent.endShape(parent.CLOSE);
  }

  class Bubble {
    float x, y, diameter;
    float speed;
    int bubbleColor;

    Bubble(float tempX, float tempY, float tempDiameter) {
      x = tempX;
      y = tempY;
      diameter = tempDiameter;
      speed = parent.random(1, 3);
      bubbleColor = parent.random(1) > 0.5 ? parent.color(255, 255, 255, 150) : parent.color(0, 255, 0, 150); // White or Green with transparency
    }

    void move() {
      y -= speed;
      if (y + diameter / 2 < 0) {
        y = parent.height;
        x = parent.random(parent.width);
      }
    }

    void display() {
      parent.fill(bubbleColor);
      parent.noStroke();
      parent.ellipse(x, y, diameter, diameter);
    }
  }

  class Trash {
    float x, y, size;
    float speed;
    float floatOffset;
    float floatSpeed;
    boolean isFloating;
    int shapeType;

    Trash(float tempX, float tempY, float tempSize, boolean tempIsFloating, int tempShapeType) {
      x = tempX;
      y = tempY;
      size = tempSize;
      isFloating = tempIsFloating;
      shapeType = tempShapeType;
      speed = parent.random(0.5, 1.5);
      floatOffset = parent.random(parent.TWO_PI);
      floatSpeed = parent.random(0.02, 0.05);
    }

    void move() {
      y -= speed;
      x += parent.sin(floatOffset) * 0.5; // Add a slight horizontal floating effect
      floatOffset += floatSpeed;
      if (y + size / 2 < 0) {
        y = parent.height;
        x = parent.random(parent.width);
      }
    }

    void display() {
      parent.noStroke();
      switch(shapeType) {
        case 0:
          drawPlasticBottle(x, y, size);
          break;
        case 1:
          drawPlasticBag(x, y, size);
          break;
      }
    }

    void drawPlasticBottle(float x, float y, float size) {
      parent.fill(0, 191, 255);
      parent.rect(x - size / 4, y - size / 2, size / 2, size); // Body
      parent.fill(255);
      parent.rect(x - size / 8, y - size / 2 - size / 8, size / 4, size / 8); // Cap
    }

    void drawPlasticBag(float x, float y, float size) {
      parent.fill(255);
      parent.rect(x - size / 2, y - size / 2, size, size); // Bag
      parent.triangle(x - size / 2, y - size / 2, x - size / 4, y - size / 2 - size / 4, x, y - size / 2); // Handle left
      parent.triangle(x + size / 2, y - size / 2, x + size / 4, y - size / 2 - size / 4, x, y - size / 2); // Handle right
    }
  }

  class Coral {
    float x, y;

    Coral(float tempX, float tempY) {
      x = tempX;
      y = tempY;
    }

    void display() {
      parent.fill(255, 99, 71);
      parent.noStroke();
      parent.rect(x - 10, y - 40, 20, 40); // Main stalk
      parent.ellipse(x - 10, y - 40, 20, 20); // Top left
      parent.ellipse(x + 10, y - 40, 20, 20); // Top right
      parent.ellipse(x, y - 30, 30, 30); // Bottom
      parent.fill(60, 179, 113);
      parent.rect(x - 30, y - 30, 10, 30); // Left stalk
      parent.rect(x + 20, y - 50, 10, 50); // Right stalk
      parent.ellipse(x - 25, y - 30, 15, 15); // Left top
      parent.ellipse(x + 25, y - 50, 15, 15); // Right top
    }
  }
}
