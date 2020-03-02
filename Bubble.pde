//FIXME: Why do balls like to get stuck in the corner?

class Bubble {
  
  float mass;
  float hue;
  float fx;
  float fy;
  float fz;
  float posx;
  float velx;
  float posy;
  float vely;
  float posz;
  float velz;



  Bubble(float _mass, float _hue) {
    mass = _mass;
    hue = _hue;
  }
  
  void initpos() {
    
    posx=random(1, width-1);
    posy = random(50, 3*height/2);
    posz = mass;
    velx = 0.01;
    vely = 0.01;
    velz = 0.01;
    
  }
  
  void nsl(float accx, float accy, float accz) {
    //FIXME: change drag coefficient for each ball based on its mass so that smaller balls go flying more easily.
    fx = 0.1*(mass* accx);
    fy = 0.1*(mass* accy);
    fz = 0.1*(mass* accz);
    
  }

  void drawBubble(float accx, float accy, float accz) {
    
    accx *= -0.2;
    accy *= 0.2;
    accz *= 0.1;
    //FIXME: Following simulates drag; make proportional to mass (i.e. diameter) as stated above.
    velx *= random(0.99,0.995);
    vely *= random(0.99,0.995);
    velz *= 0.7;
    velx = velx + accx;
    vely = vely + accy;
    velz = velz + map(accz, -9.9, 9.9, mass, 100);

    posx = posx + velx +0.5*accx;
    posy = posy + vely+0.5*accy;
    //FIXME: Figure out why posz is not changing according to inputted mass.
    posz = posz + velz;
    
    //FIXME: Why doesn't the if statements constrain the position when position constraints are implemented?
    //Constrain works just as well.
    //Figure out why posz does not work to make the balls bounce from their edge, not from their center.
   
    if (posx <= 0) {
      velx = -velx;
      vely = -vely;
    }
    
    if ((posx >= width)) {
      velx = -velx;
      vely = -vely;
    }
    
    if (posy <= 0) {
      velx = -velx;
      vely = -vely;
    }
    
    if (posy >= height) {
      velx = -velx;
      vely = -vely;
    }
  
    if (posz < mass) {
      posz = mass;
    } 
    
    else if (posz > 100) {
      posz = 100;
    }
    
    fill(hue, 360, 360);
    noStroke();
    
    posx= constrain(posx, 0, width);
    posy = constrain(posy, 0, height);
    ellipse(int(posx), int(posy), int(posz), int(posz));
    posz--;
    
  }
  //TODO: POSSIBLY add collision detection. Only feasible for desktop as this would get
  //too slow to use as an Android wallpaper.
}
