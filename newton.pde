class Newton {
  int nbr = 100;
  //float G = 6.67430*pow(10, -11);
  float G = 1*pow(10, -3);
  float[] posx = new float[nbr], posy= new float[nbr], masse= new float[nbr], force_subie = new float[nbr];
  color[] c = new color[nbr];
  Newton() {
    for (int i = 0; i<nbr; i++) {
      posx[i]=random(200, 800);

      posy[i]=random(200, 700);
      masse[i] = random(1, 100000)*1000;
      c[i] = color(int(masse[i])%255, int(masse[i])%255, int(masse[i])%255);
    }
    //printArray(masse);
  }
  float angle(int n, int i) {

    //float angle = atan2(posy[n]-posy[i], posx[n]-posx[i]);
    float angle = atan((posy[n]-posy[i])/(posx[n]-posx[i]+0.1));

    return angle;
  }
  void force(int i, int n) {
    force_subie[n] =  angle(n, i)* G * masse[i] * masse[n]/pow((distance(i, n)+0.1), 2);
  }
  float distance(int i, int n) {
    float distance = sqrt(pow(posx[n]-posx[i], 2)+pow(posy[n]-posy[i], 2));
    return distance;
  }
  float acceleration(int i) {
    //on calcule toutes les forces
    for (int n =0; n<nbr; n++) {
      force(i, n);
    }
    return sum(force_subie)/masse[i];
  }
  float vitesse(int i) {
    float dx = acceleration(i)*0.01;
    //int s = int(random(-2,2));
    return dx;
  }
  float sum(float[] T) {
    float somme = 0;
    for (int i=0; i<nbr; i++) {
      somme+= T[i];
    }
    return somme;
  }
  void bouger() {
    for (int i =0; i<nbr; i++) {
      posx[i]+=vitesse(i);
      posy[i]+=vitesse(i);
    }
    dessiner();
  }
  void dessiner() {
    //rect(500,500,100,100);
    background(255);
    fill(255);
    for (int i=0; i<nbr; i++) {
      fill(c[i]);
      ellipse(posx[i], posy[i], 10, 10);
    }
  }
}
void setup() {
  fullScreen();
  background(255);
}
Newton galaxie = new Newton();
void draw() {
  galaxie.bouger();
  galaxie.dessiner();
}
