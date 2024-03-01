class Particle{
  float dt = 0.001; // used to set speed of particles
  
  float dx;
  float dy;
  float dz;
  
  float x;
  float y;
  float z;
  
  float Hue;
  float Sat;
  float Bright;

  
   ArrayList<PVector> history = new ArrayList<PVector> (); // Array list that holds a vector location of all past location
  
  
  
  
  Particle(PVector location,int H, int S, int B){ // set initial location and the colour of the particle and trail
    
    x = location.x; 
    y = location.y;
    z = location.z;
    
    Hue = H;
    Sat = S;
    Bright = B;
   
  }
  

  void move (){
  
    dx = (sigma * (y - x))*dt;  //Lorenz equations 
    dy = (x * (rho - z) - y)*dt;
    dz = (x * y - betta * z)*dt; 
  
  
    x = x + dx;   // set next location
    y = y + dy; 
    z = z + dz;
    
    
    
    if (dt < 0.005){  // used to start animation slowly and speed up as the animation continues 
     dt = dt + 0.000005;
    }
    
    history.add(new PVector(x,y,z));    //save location history
    
    if (history.size() > 900){    // delete the old location history so the trail disapers 
     history.remove(0);// remove the first vector of array
    }
    
    }
   
  void display(){
    
    stroke(Hue,Sat,Bright,500);// display particle
    strokeWeight(3.7);
    point(x,y,z);
    
  }
  
  
  void ParticleTrail() { //create trail with same hue using particle history
  
    noFill();
    
    beginShape();
    for (PVector v : history) {

      strokeWeight(0.5);
      stroke(Hue,Sat,Bright,200);
      vertex(v.x,v.y,v.z);
      
    }
    endShape();
  
  
}
}
