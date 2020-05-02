class Newton {
  int nbr = 100;
  float G = 6.67430*pow(10, -11);
  float[] posx = new float[nbr], posy= new float[nbr], masse= new float[nbr], force_subie = new float[nbr];

  Newton() {
    for (int i = 0; i<nbr; i++) {
      posx[i]=random(0, width)*10;
      posy[i]=random(0, height)*10;
      masse[i] = random(1, 50000000)*100;
    }
    //printArray(masse);
  }

  void force(int i, int n) {
    force_subie[n] = G * masse[i] * masse[n]/pow((distance(i, n)+0.1), 2);
    //print(force_subie[n]);
    //print(distance(i,n));
    //print('\n');
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
    float somme = sum(force_subie);
    return somme/masse[i];
  }
  float vitesse(int i) {
    float dx = acceleration(i)*0.1;
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
    fill(255);
    //rect(500,500,100,100);
    background(0);
    fill(255);
    for (int i=0; i<nbr; i++) {
      ellipse(posx[i], posy[i], 10, 10);
    }
  }
}
void setup() {
  fullScreen();
  background(0);
}
Newton galaxie = new Newton();
void draw() {
  galaxie.bouger();
  galaxie.dessiner();
}
