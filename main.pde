import ddf.minim.*;

Minim minim;
AudioPlayer scene1Sound;
AudioPlayer scene2Sound;
AudioPlayer scene3Sound;
AudioPlayer scene4Sound;
AudioPlayer scene5Sound;
AudioPlayer scene6Sound;
AudioPlayer scene7Sound;
AudioPlayer scene8Sound;
AudioPlayer scene9Sound;
AudioPlayer scene10Sound;
AudioPlayer scene11Sound;
AudioPlayer scene12Sound;
AudioPlayer scene13Sound;
AudioPlayer scene14Sound;
AudioPlayer scene15Sound;
AudioPlayer scene16Sound;
AudioPlayer scene17Sound;

Scene1 scene1;
Scene2 scene2;
Scene3 scene3;
Scene4 scene4;
Scene5 scene5;
Scene6 scene6;
Scene7 scene7;
Scene8 scene8;
Scene9 scene9;
Scene10 scene10;
Scene11 scene11;
Scene12 scene12;
Scene13 scene13;
Scene14 scene14;
Scene15 scene15;
Scene16 scene16;
Scene17 scene17;

int scene1Duration = 35000;
int scene2Duration = 2000;
int scene3Duration = 39000;
int scene4Duration = 51000;
int scene5Duration = 36000;
int scene6Duration = 5000;
int scene7Duration = 2000;
int scene8Duration = 40000;
int scene9Duration = 42000;
int scene10Duration = 2000;
int scene11Duration = 38000;
int scene12Duration = 38000;
int scene13Duration = 22000;
int scene14Duration = 5000;
int scene15Duration = 12000;
int scene16Duration = 22000;
int scene17Duration = 50000;

int startTime;
int currentScene = 1;

void setup() {
  size(800, 600);
  minim = new Minim(this);

  scene1Sound = minim.loadFile("scene1.WAV");
  scene2Sound = minim.loadFile("scene2.WAV");
  scene3Sound = minim.loadFile("scene3.WAV");
  scene4Sound = minim.loadFile("scene4.WAV");
  scene5Sound = minim.loadFile("scene5.WAV");
  scene6Sound = minim.loadFile("scene6.WAV");
  scene7Sound = minim.loadFile("scene7.WAV");
  scene8Sound = minim.loadFile("scene8.WAV");
  scene9Sound = minim.loadFile("scene9.WAV");
  scene10Sound = minim.loadFile("scene10.WAV");
  scene11Sound = minim.loadFile("scene11.WAV");
  scene12Sound = minim.loadFile("scene12.WAV");
  scene13Sound = minim.loadFile("scene13.WAV");
  scene14Sound = minim.loadFile("scene14.WAV");
  scene15Sound = minim.loadFile("scene15.WAV");
  scene16Sound = minim.loadFile("scene16.WAV");
  scene17Sound = minim.loadFile("scene17.WAV");

  scene1 = new Scene1(this);
  scene2 = new Scene2(this);
  scene3 = new Scene3(this);
  scene4 = new Scene4(this);
  scene5 = new Scene5(this);
  scene6 = new Scene6(this);
  scene7 = new Scene7(this);
  scene8 = new Scene8(this);
  scene9 = new Scene9(this);
  scene10 = new Scene10(this);
  scene11 = new Scene11(this);
  scene12 = new Scene12(this);
  scene13 = new Scene13(this);
  scene14 = new Scene14(this);
  scene15 = new Scene15(this);
  scene16 = new Scene16(this);
  scene17 = new Scene17(this);

  startScene1();
}

void draw() {
  background(0);
  if (currentScene == 1) {
    scene1.drawScene();
    if (millis() - startTime >= scene1Duration) {
      startScene2();
    }
  } else if (currentScene == 2) {
    scene2.drawScene();
    if (millis() - startTime >= scene2Duration) {
      startScene3();
    }
  } else if (currentScene == 3) {
    scene3.drawScene();
    if (millis() - startTime >= scene3Duration) {
      startScene4();
    }
  } else if (currentScene == 4) {
    scene4.drawScene();
    if (millis() - startTime >= scene4Duration) {
      startScene5();
    }
  } else if (currentScene == 5) {
    scene5.drawScene();
    if (millis() - startTime >= scene5Duration) {
      startScene6();
    }
  } else if (currentScene == 6) {
    scene6.drawScene();
    if (millis() - startTime >= scene6Duration) {
      startScene7();
    }
  } else if (currentScene == 7) {
    scene7.drawScene();
    if (millis() - startTime >= scene7Duration) {
      startScene8();
    }
  } else if (currentScene == 8) {
    scene8.drawScene();
    if (millis() - startTime >= scene8Duration) {
      startScene9();
    }
  } else if (currentScene == 9) {
    scene9.drawScene();
    if (millis() - startTime >= scene9Duration) {
      startScene10();
    }
  } else if (currentScene == 10) {
    scene10.drawScene();
    if (millis() - startTime >= scene10Duration) {
      startScene11();
    }
  } else if (currentScene == 11) {
    scene11.drawScene();
    if (millis() - startTime >= scene11Duration) {
      startScene12();
    }
  } else if (currentScene == 12) {
    scene12.drawScene();
    if (millis() - startTime >= scene12Duration) {
      startScene13();
    }
  } else if (currentScene == 13) {
    scene13.drawScene();
    if (millis() - startTime >= scene13Duration) {
      startScene14();
    }
  } else if (currentScene == 14) {
    scene14.drawScene();
    if (millis() - startTime >= scene14Duration) {
      startScene15();
    }
  } else if (currentScene == 15) {
    scene15.drawScene();
    if (millis() - startTime >= scene15Duration) {
      startScene16();
    }
  } else if (currentScene == 16) {
    scene16.drawScene();
    if (millis() - startTime >= scene16Duration) {
      startScene17();
    }
  } else if (currentScene == 17) {
    scene17.drawScene();
    if (millis() - startTime >= scene17Duration) {
      noLoop();
    }
  }
}

void startScene1() {
  currentScene = 1;
  startTime = millis();
  if (!scene1Sound.isPlaying()) {
    scene1Sound.play();
  }
}

void startScene2() {
  currentScene = 2;
  startTime = millis();
  if (scene1Sound.isPlaying()) {
    scene1Sound.pause();
  }
  if (!scene2Sound.isPlaying()) {
    scene2Sound.play();
  }
}

void startScene3() {
  currentScene = 3;
  startTime = millis();
  if (scene2Sound.isPlaying()) {
    scene2Sound.pause();
  }
  if (!scene3Sound.isPlaying()) {
    scene3Sound.play();
  }
}

void startScene4() {
  currentScene = 4;
  startTime = millis();
  if (scene3Sound.isPlaying()) {
    scene3Sound.pause();
  }
  if (!scene4Sound.isPlaying()) {
    scene4Sound.play();
  }
}

void startScene5() {
  currentScene = 5;
  startTime = millis();
  if (scene4Sound.isPlaying()) {
    scene4Sound.pause();
  }
  if (!scene5Sound.isPlaying()) {
    scene5Sound.play();
  }
}

void startScene6() {
  currentScene = 6;
  startTime = millis();
  if (scene5Sound.isPlaying()) {
    scene5Sound.pause();
  }
  if (!scene6Sound.isPlaying()) {
    scene6Sound.play();
  }
}

void startScene7() {
  currentScene = 7;
  startTime = millis();
  if (scene6Sound.isPlaying()) {
    scene6Sound.pause();
  }
  if (!scene7Sound.isPlaying()) {
    scene7Sound.play();
  }
}

void startScene8() {
  currentScene = 8;
  startTime = millis();
  if (scene7Sound.isPlaying()) {
    scene7Sound.pause();
  }
  if (!scene8Sound.isPlaying()) {
    scene8Sound.play();
  }
}

void startScene9() {
  currentScene = 9;
  startTime = millis();
  if (scene8Sound.isPlaying()) {
    scene8Sound.pause();
  }
  if (!scene9Sound.isPlaying()) {
    scene9Sound.play();
  }
}

void startScene10() {
  currentScene = 10;
  startTime = millis();
  if (scene9Sound.isPlaying()) {
    scene9Sound.pause();
  }
  if (!scene10Sound.isPlaying()) {
    scene10Sound.play();
  }
}

void startScene11() {
  currentScene = 11;
  startTime = millis();
  if (scene10Sound.isPlaying()) {
    scene10Sound.pause();
  }
  if (!scene11Sound.isPlaying()) {
    scene11Sound.play();
  }
}

void startScene12() {
  currentScene = 12;
  startTime = millis();
  if (scene11Sound.isPlaying()) {
    scene11Sound.pause();
  }
  if (!scene12Sound.isPlaying()) {
    scene12Sound.play();
  }
}

void startScene13() {
  currentScene = 13;
  startTime = millis();
  if (scene12Sound.isPlaying()) {
    scene12Sound.pause();
  }
  if (!scene13Sound.isPlaying()) {
    scene13Sound.play();
  }
}

void startScene14() {
  currentScene = 14;
  startTime = millis();
  if (scene13Sound.isPlaying()) {
    scene13Sound.pause();
  }
  if (!scene14Sound.isPlaying()) {
    scene14Sound.play();
  }
}

void startScene15() {
  currentScene = 15;
  startTime = millis();
  if (scene14Sound.isPlaying()) {
    scene14Sound.pause();
  }
  if (!scene15Sound.isPlaying()) {
    scene15Sound.play();
  }
}

void startScene16() {
  currentScene = 16;
  startTime = millis();
  if (scene15Sound.isPlaying()) {
    scene15Sound.pause();
  }
  if (!scene16Sound.isPlaying()) {
    scene16Sound.play();
  }
}

void startScene17() {
  currentScene = 17;
  startTime = millis();
  if (scene16Sound.isPlaying()) {
    scene16Sound.pause();
  }
  if (!scene17Sound.isPlaying()) {
    scene17Sound.play();
  }
}

void stop() {
  scene1Sound.close();
  scene2Sound.close();
  scene3Sound.close();
  scene4Sound.close();
  scene5Sound.close();
  scene6Sound.close();
  scene7Sound.close();
  scene8Sound.close();
  scene9Sound.close();
  scene10Sound.close();
  scene11Sound.close();
  scene12Sound.close();
  scene13Sound.close();
  scene14Sound.close();
  scene15Sound.close();
  scene16Sound.close();
  scene17Sound.close();
  minim.stop();
  super.stop();
}
