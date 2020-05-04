class Newton {
  int nbr = 1000;
  //float G = 6.67430*pow(10, -11);
  float G = 1*pow(10, -1);
  float[] posx = new float[nbr+1], posy= new float[nbr+1], masse= new float[nbr+1], force_subie = new float[nbr+1];
  color[] c = new color[nbr+1];

  Newton() { //constructeur 
    for (int i = 0; i<nbr; i++) {
      posx[i]=random(200, 800);

      posy[i]=random(200, 700);
      masse[i] = random(1, 100)*10;
      c[i] = color(int(masse[i])%255, int(masse[i])%255, int(masse[i])%255);
    }
    posx[nbr-1] = 500;
    posy[nbr-1] = 300;
    masse[nbr-1] = 500000000;
    c[nbr-1] = color(255, 0, 0);

    posx[nbr] = 900;
    posy[nbr] = 700;
    masse[nbr] = 500000000;
    c[nbr] = color(255, 0, 0);
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
    dessiner();
    for (int i =0; i<=nbr; i++) {
      posx[i]+=vitesse(i);
      posy[i]+=vitesse(i);
      /*for(int n =0; i<=nbr; i++){
       if(posx[i] == posx[n] && posy[i] == posy[n] && n!= i){
                /*print('n');
       fusion(i, n);
       }
       }*/
    }
  }
  void fusion(int i, int n) {
    float masse_tot = masse[i]+masse[n];
    posx[i] = 0;
    posy[i] = 0;
    masse[i] = 0;

    masse[n] = masse_tot;
  }
  void dessiner() {
    //rect(500,500,100,100);
    background(255);
    fill(255);
    for (int i=0; i<nbr-1; i++) {
      fill(c[i]);
      ellipse(posx[i], posy[i], 2, 2);
    }
    fill(c[nbr-1]);
    ellipse(posx[nbr-1], posy[nbr-1], 50, 50);
    fill(c[nbr]);
    ellipse(posx[nbr], posy[nbr], 50, 50);
  }
}
void setup() {
  fullScreen();
  background(255);
}
Newton galaxie = new Newton();
void draw() {
  galaxie.bouger();
  //galaxie.dessiner();
}
