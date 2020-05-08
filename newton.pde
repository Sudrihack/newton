class Newton {
  int nbr = 1000;
  //float G = 6.67430*pow(10, -11); //utiliser cette constante si on met un soleil
  float G = 1*pow(10, -3);
  float[] masse= new float[nbr+1], force_subie = new float[nbr+1];
  color[] c = new color[nbr+1];
  Vector[] planet = new Vector[nbr+1];

  Newton() { //constructeur 
    for (int i = 0; i<nbr; i++) { 
      float x=random(100, 1200);

      float y=random(100, 800);


      masse[i] = random(1000000, 1000000000);
      c[i] = color(int(masse[i])%255, int(masse[i])%255, int(masse[i])%255);

      Vector p = new Vector(0, 0, x, y, masse[i], c[i]);
      planet[i] = p;
    }
    //DECOMMENTER CES LIGNES POUR METTRE UN SOLEIL (VOIR AUSSI PLUS BAS DANS LA METHODE DESSINER)
    /*
    float x=700;

    float y=500;
    masse[int(nbr)] = 1000000000000000000L;
    c[int(nbr)] = color(255, 0, 0);

    Vector p = new Vector(0, 0, x, y, masse[int(nbr)], c[int(nbr)]);
    planet[int(nbr)] = p;
    */
  }
  float angle(int n, int i) {

    float angle = atan2(planet[n].y-planet[i].y, planet[n].x-planet[i].x);
    //float angle = atan((planet[n].y-planet[i].y)/(planet[n].x-planet[i].x+0.1));

    return angle;
  }
  void force(int i, int n) {
    float agl = angle(n, i);
    force_subie[n] =  agl* G * masse[i] * masse[n]/pow((distance(i, n)+0.1), 2);
    planet[n].chang_agl(agl);
  }
  float distance(int i, int n) {
    float distance = sqrt(pow(planet[n].x-planet[i].x, 2)+pow(planet[n].y-planet[i].x, 2));
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
    float dx = acceleration(i)*0.001;
    //int s = int(random(-2,2));
    return dx;
  }
  float sum(float[] T) {
    float somme = 0;
    for (int i=0; i<=nbr; i++) {
      somme+= T[i];
    }
    return somme;
  }
  void bouger() {
    for (int i =0; i<nbr; i++) {
      planet[i].chang_dx(vitesse(i));
      planet[i].bouger();
    }
    dessiner();
  }
  void dessiner() {
    background(0);
    for (int i=0; i<nbr; i++) {
      planet[i].dessiner();
    }
    //DECOMMENTER CES LIGNES POUR FAIRE APPARAITRE UN SOLEIL
    /*
    fill(planet[nbr].c);
    ellipse(planet[nbr].x, planet[nbr].y, 50, 50);
    */
  }
}

void setup() {
  fullScreen();
  background(255);
}
Newton galaxie = new Newton();
void draw() {
  galaxie.bouger();
}
