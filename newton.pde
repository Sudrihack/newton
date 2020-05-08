class Newton {
  int nbr = 1000;
  float G = 6.67430*pow(10, -11);
  //float G = 1*pow(10,-5);
  float[] masse= new float[nbr+1], force_subie = new float[nbr+1];
  color[] c = new color[nbr+1];
  Vector[] planet = new Vector[nbr+1];

  Newton() { //constructeur 
    for (int i = 0; i<nbr; i++) {
      float x=random(100, 1200);

      float y=random(100, 800);
      
      
      masse[i] = random(1000000, 1000000000);
      c[i] = color(int(masse[i]), int(masse[i]), int(masse[i]));

      Vector p = new Vector(0, 0, x, y, masse[i], c[i]);
      planet[i] = p;
    }
    
    float x=700;

    float y=500;
    masse[int(nbr)] = 1000000000000000000L;
    c[int(nbr)] = color(255, 0, 0);

    Vector p = new Vector(0, 0, x, y, masse[int(nbr)], c[int(nbr)]);
    planet[int(nbr)] = p;
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
    for (int n =0; n<=nbr; n++) {
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
    for (int i =0; i<=nbr; i++) {
      planet[i].chang_dx(vitesse(i));
      planet[i].bouger();
      /*for(int n =0; i<=nbr; i++){
       if(posx[i] == posx[n] && posy[i] == posy[n] && n!= i){
                                                                      /*print('n');
       fusion(i, n);
       }
       }*/
    }
    dessiner();
  }
  /*
  void fusion(int i, int n) {
   float masse_tot = masse[i]+masse[n];
   posx[i] = 0;
   posy[i] = 0;
   masse[i] = 0;
   
   masse[n] = masse_tot;
   }*/
  void dessiner() {
    //rect(500,500,100,100);
    background(0);
    for (int i=0; i<nbr; i++) {
      planet[i].dessiner();
    }
    fill(planet[nbr].c);
    ellipse(planet[nbr].x, planet[nbr].y, 50,50);
  }
}

void setup() {
  fullScreen();
  background(255);
}
Newton galaxie = new Newton();
void draw() {
  galaxie.bouger();
  /*
  print("\n");
   print(galaxie.planet[5].x);*/
  //galaxie.dessiner();
}
