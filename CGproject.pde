import g4p_controls.*; 
import arb.soundcipher.*;
import processing.sound.*;

SoundCipher sc = new SoundCipher(this);
SoundCipher sc2 = new SoundCipher(this);
SCScore score = new SCScore();
float[] insts = {sc.PIANO, sc.FLUTE, sc.CLARINET, sc.BASSOON, sc.VIOLIN, sc.VIOLA, sc.CELLO, sc.SAXOPHONE};
int i;
float A, x, y;
float duration = 1;
float dynamic = 80;



float C0 = 60;
float Cs0 = 61;
float D0 = 62;
float Ds0 = 63;
float E0 = 64;
float F0 = 65;
float Fs0 = 66;
float G0 = 67;
float Gs0 = 68;
float A0 = 69;
float As0 = 70;
float B0 = 71;


float C1 = 72;
float Cs1 = 73; 
float D1 = 74;
float Ds1 = 75;
float E1 = 76;
float F1 = 77;
float Fs1 = 78;
float G1 = 79;
float Gs1 = 80;
float A1 = 81;
float As1 = 82;
float B1 = 83;


float C2 = 84;
float Cs2 = 85;
float D2 = 86;
float Ds2 = 87;
float E2 = 88;
float F2 = 89;
float Fs2 = 90;
float G2 = 91;
float Gs2 = 92;
float A2 = 93;
float As2 = 94;
float B2 = 95;
float C3 = 96;

float[] major = {C0, D0, E0, F0, G0, A0, B0, C1, D1, E1, F1, G1, A1, B1, C2};
float[] majorP = {C0, D0, E0, G0, A0, C1, D1, E1, G1, A1, C2, D2, E2, G2, A2};
float[] majorB = {C0, D0, Ds0, E0, G0, A0, C1, D1, Ds1, E1, G1, A1, C2, D2, Ds2};
float[] mixolydian = {C0, D0, E0, F0, G0, A0, As0, C1, D1, E1, F1, G1, A1, As1, C2};
float[] klezmer = {C0, Cs0, E0, F0, G0, Gs0, A0, As0, C1, Cs1, E1, F1, G1, Gs1, A1};
float[] minorP = {C0, Ds0, F0, G0, As0, C1, Ds1, F1, G1, As1, C2, Ds2, F2, G2, As2};
float[] minorB = {C0, Ds0, F0, Fs0, G0, As0, C1, Ds1, F1, Fs1, G1, As1, C2, Ds2, F2};
float[] japaness = {C0, Cs0, F0, G0, Gs0, C1, Cs1, F1, G1, Gs1, C2, Cs2, F2, G2, Gs2};
float[] minor = {C0, D0, Ds0, F0, G0, Gs0, As0, C1, D1, Ds1, F1, G1, Gs1, As1, C2};
float[] hamonicm = {C0, D0, Ds0, F0, G0, Gs0, B0, C1, D1, Ds1, F1, G1, Gs1, B1, C2};
float[] dorian = {C0, D0, Ds0, F0, G0, A0, As0, C1, D1, Ds1, F1, G1, A1, As1, C2};
float[] southe = {C0, Cs0, Ds0, G0, Gs0, C1, Cs1, Ds1, G1, Gs1, C2, Cs2, Ds2, G2, Gs2};

float[] pitch;

int lin = 70;
int lin2 = 630;

PImage img, imgstart;

boolean start = false;
float countTime = 1;



public void setup() {
  size(800, 800, JAVA2D);
  createGUI();
  img = loadImage("img.jpg");
  imgstart = loadImage("start.jpg");
  background(img);
}

public void draw() {
  if(keyPressed == true){
   start = true; 
   countTime = 0;
  }else{
     countTime += millis()/1000;
  }
  
  if(countTime >= 23000){
     start = false; 
  }
  

  if (start == false) {
    background(imgstart);
    textSize(50);
    fill((random((1+sin(float(millis())/4000))*255)),(random((1+sin(float(millis())/4000))*255)),(random((1+sin(float(millis())/4000))*255)));
    filter(11);
    text("Pressed some key to Start", 85, 600);
    filter(18);
  } 
  
  if(start == true) {

    ball();
    drawtext();
    drawline();

    String mixmod = mode.getSelectedText();

    switch(mixmod) {
    case "major" :
      pitch = major;
      break;
    case "majorPan" :
      pitch = majorP;
      break;
    case "majorBlue" :
      pitch = majorB;
      break;
    case "mixolydian" :
      pitch = mixolydian;
      break;
    case "klezmer" :
      pitch = klezmer;
      break;
    case "minorPan" :
      pitch = minorP;
      break;
    case "minorBlue" :
      pitch = minorB;
      break;
    case "japaness" :
      pitch = japaness;
      break;
    case "minor" :
      pitch = minor;
      break;
    case "harmonicminor" :
      pitch = hamonicm;
      break;
    case "dorian" :
      pitch = dorian;
      break;
    case "South-E" :
      pitch = southe;
      break;
    default :
      pitch = major;
    }

    String instru = instrus.getSelectedText();
    switch(instru) {
    case "Piano" :
      sc.instrument = insts[0];
      sc2.instrument = insts[0];
      break;
    case "Flute" :
      sc.instrument = insts[1];
      sc2.instrument = insts[1];
      break;
    case "Clarinet" :
      sc.instrument = insts[2];
      sc2.instrument = insts[2];
      break;
    case "Bassoon" :
      sc.instrument = insts[3];
      sc2.instrument = insts[3];
      break;
    case "Violin" :
      sc.instrument = insts[4];
      sc2.instrument = insts[4];
      break;
    case "Viola" :
      sc.instrument = insts[5];
      sc2.instrument = insts[5];
      break;
    case "Cello" :
      sc.instrument = insts[6];
      sc2.instrument = insts[6];
      break;
    case "Saxophone" :
      sc.instrument = insts[7];
      sc2.instrument = insts[7];
      break;
    default :
      sc.instrument = insts[0];
      sc2.instrument = insts[0];
    }
  }
}

void play(int note) {

  dynamic = cos(PI)*30+500;
  sc.playNote(pitch[note], dynamic, duration);
}

void play2(int note) {
  dynamic = cos(PI)*30+500;
  sc2.playNote(pitch[note], dynamic, duration);
}

void mouseMoved() {
  if (start == true) {
    x = mouseX;
    y = mouseY;
    countTime = 0;

    if ((y > 49) && (y < 751)) {
      if ((x > 49) && (x < 65)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(50, 50, 50, 640+70);

        play(0);
      }
      if ((x >= 65) && (x < 118) && (y > 110)) {
        stroke(0, 0, 200);
        strokeWeight(3);
        line(100, 60, 100, 630+70);

        play(1);
      }
      if ((x >= 118) && (x < 171) && (y > 110)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(150, 70, 150, 620+70);

        play(2);
      }
      if ((x >= 171) && (x < 206) && (y > 110)) {
        stroke(0, 0, 200);
        strokeWeight(3);
        line(200, 80, 200, 610+70);

        play(3);
      }
      if ((x >= 206) && (x < 259) && (y > 110)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(250, 90, 250, 600+70);

        play(4);
      }
      if ((x >= 259) && (x < 312) && (y > 110)) {
        stroke(0, 0, 200);
        strokeWeight(3);
        line(300, 100, 300, 610+70);

        play(5);
      }
      if ((x >= 312) && (x < 365) && (y > 110)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(350, 110, 350, 610+70);

        play(6);
      }
      if ((x >= 365) && (x < 418) && (y > 110)) {
        stroke(0, 0, 200);
        strokeWeight(3);
        line(400, 100, 400, 600+70);

        play(7);
      }
      if ((x >= 418) && (x < 471) && (y > 110)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(450, 90, 450, 610+70);

        play(8);
      }
      if ((x >= 471) && (x < 524) && (y > 110)) {
        stroke(0, 0, 200);
        strokeWeight(3);
        line(500, 90, 500, 610+70);

        play(9);
      }
      if ((x >= 524) && (x < 577) && (y > 110)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(550, 80, 550, 620+70);

        play(10);
      }
      if ((x >= 577) && (x < 630) && (y > 110)) {
        stroke(0, 0, 200);
        strokeWeight(3);
        line(600, 70, 600, 630+70);

        play(11);
      }
      if ((x >= 630) && (x < 683) && (y > 110)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(650, 60, 650, 640+70);

        play(12);
      }
      if ((x >= 683) && (x < 735) && (y > 110)) {
        stroke(0, 0, 200);
        strokeWeight(3);
        line(700, 50, 700, 640+70);

        play(13);
      }
      if ((x >= 735) && (x < 800) && (y > 110)) {
        stroke(200, 0, 0);
        strokeWeight(3);
        line(750, 40, 750, 640+70);

        play(14);
      }
    }
  }
}

void keyPressed() {
  if (start == true) {
    if (key == 'Q' || key == 'q') {
      play2(0);
      textSize(70);
      text("Q", 50-20, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(50, 50, 50, 640+70);
    }
    if (key == 'W' || key == 'w') {
      play2(1);
      textSize(70);
      text("W", 100-20, 384);
      stroke(0, 0, 200);
      strokeWeight(3);
      line(100, 60, 100, 630+70);
    }
    if (key == 'E' || key == 'e') {
      play2(2);
      textSize(70);
      text("E", 150-15, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(150, 70, 150, 620+70);
    }
    if (key == 'R' || key == 'r') {
      play2(3);
      textSize(70);
      text("R", 200-15, 384);
      stroke(0, 0, 200);
      strokeWeight(3);
      line(200, 80, 200, 610+70);
    }
    if (key == 'A' || key == 'a') {
      play2(4);
      textSize(70);
      text("A", 250-20, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(250, 90, 250, 600+70);
    }
    if (key == 'S' || key == 's') {
      play2(5);
      textSize(70);
      text("S", 300-15, 384);
      stroke(0, 0, 200);
      strokeWeight(3);
      line(300, 100, 300, 610+70);
    }
    if (key == 'D' || key == 'd') {
      play2(6);
      textSize(70);
      text("D", 350-20, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(350, 110, 350, 610+70);
    }
    if (key == 'F' || key == 'f') {
      play2(7);
      textSize(70);
      text("F", 400-15, 384);
      stroke(0, 0, 200);
      strokeWeight(3);
      line(400, 100, 400, 600+70);
    }
    if (key == 'U' || key == 'u') {
      play2(8);
      textSize(70);
      text("U", 450-20, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(450, 90, 450, 610+70);
    }
    if (key == 'I' || key == 'i') {
      play2(9);
      textSize(70);
      text("I", 500-10, 384);
      stroke(0, 0, 200);
      strokeWeight(3);
      line(500, 90, 500, 610+70);
    }
    if (key == 'O' || key == 'o') {
      play2(10);
      textSize(70);
      text("O", 550-20, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(550, 80, 550, 620+70);
    }
    if (key == 'P' || key == 'p') {
      play2(11);
      textSize(70);
      text("P", 600-10, 384);
      stroke(0, 0, 200);
      strokeWeight(3);
      line(600, 70, 600, 630+70);
    }
    if (key == 'J' || key == 'j') {
      play2(12);
      textSize(70);
      text("J", 650-10, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(650, 60, 650, 640+70);
    }
    if (key == 'K' || key == 'k') {
      play2(13);
      textSize(70);
      text("K", 700-15, 384);
      stroke(0, 0, 200);
      strokeWeight(3);
      line(700, 50, 700, 640+70);
    }
    if (key == 'L' || key == 'l') {
      play2(14);
      textSize(70);
      text("L", 750-20, 384);
      stroke(200, 0, 0);
      strokeWeight(3);
      line(750, 40, 750, 640+70);
    }
  }
}

void ball() {

  fill(random((1+cos(float(millis())/4000))*234));
  //filter(18);
  ellipse(abs(x+9*cos(A+=.5-noise(i++)))%800, abs(y+9*sin(A))%800, 40, 40);
  filter(11);
}

void drawline() {
  strokeWeight(1);
  stroke(200, 0, 0);
  line(50, 50, 50, 640+70);
  stroke(0, 0, 200);
  line(100, 60, 100, 630+70);
  stroke(200, 0, 0);
  line(150, 70, 150, 620+70);
  stroke(0, 0, 200);
  line(200, 80, 200, 610+70);
  stroke(200, 0, 0);
  line(250, 90, 250, 600+70);
  stroke(0, 0, 200);
  line(300, 100, 300, 610+70);
  stroke(200, 0, 0);
  line(350, 110, 350, 610+70);
  stroke(0, 0, 200);
  line(400, 100, 400, 600+70);
  stroke(200, 0, 0);
  line(450, 90, 450, 610+70);
  stroke(0, 0, 200);
  line(500, 90, 500, 610+70);
  stroke(200, 0, 0);
  line(550, 80, 550, 620+70);
  stroke(0, 0, 200);
  line(600, 70, 600, 630+70);
  stroke(200, 0, 0);
  line(650, 60, 650, 640+70);
  stroke(0, 0, 200);
  line(700, 50, 700, 640+70);
  stroke(200, 0, 0);
  line(750, 40, 750, 640+70);
}

void drawtext() {

  textSize(50);
  text("Q", 50-20, 384);
  text("W", 100-20, 384);
  text("E", 150-15, 384);
  text("R", 200-20, 384);
  text("A", 250-20, 384);
  text("S", 300-15, 384);
  text("D", 350-20, 384);
  text("F", 400-15, 384);
  text("U", 450-20, 384);
  text("I", 500-10, 384);
  text("O", 550-20, 384);
  text("P", 600-15, 384);
  text("J", 650-10, 384);
  text("K", 700-20, 384);
  text("L", 750-15, 384);
}
