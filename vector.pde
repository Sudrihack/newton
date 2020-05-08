class Vector {
  float dx, agl, x, y;
  Vector(float vitesse, float angle, float posx, float posy) {
    dx = vitesse;
    agl = angle;
    x = posx;
    y = posy;
  }

  void dessiner() {
    //background(0);
    colorMode(HSB, 600);
    fill(color(agl, agl, agl));
    noStroke();
    ellipse(x, y, 10, 10);
  }

  void bouger() {
    //print(str(agl)+"\n");
    x+=cos(agl)*dx;
    //print(str(agl)+"\n");
    y+=sin(agl)*dx; 
    //dessiner();
  }

  void chang_agl(float new_agl) {
    agl = new_agl;
  }
  void chang_dx(float new_speed) {
    dx = new_speed;
  }
}
/*
void setup() {
  //fullScreen();
  background(255);
}
Vector vec = new Vector(1, -1, 700, 500);

float agl = 0;
float dx = 0;
void draw() {
  dx += 0.05;
  agl+= 0.4;
  print(dx);
  print("\n");
  vec.chang_agl(agl);
  vec.chang_dx(dx);
  vec.bouger();
}*/
