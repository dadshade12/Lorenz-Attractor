class Particle{
  float dt = 0.001; 
  
  float dx;
  float dy;
  float dz;
  
  float x;
  float y;
  float z;
  
  float Hue;
  float Sat;
  float Bright;
  
  ArrayList<PVector> history = new ArrayList<PVector> ();
  
  
  
  
  Particle(PVector location,int H, int S, int B){
    
    x = location.x; 
    y = location.y;
    z = location.z;
    
    Hue = H;
    Sat = S;
    Bright = B;
   
  }
  

  void move (){
     

    
    
  
    dx = (sigma * (y - x))*dt;
    dy = (x * (rho - z) - y)*dt;
    dz = (x * y - betta * z)*dt; 
  
  
    x = x + dx;
    y = y + dy; 
    z = z + dz;
    
    
    
    if (dt < 0.005){
     dt = dt + 0.000005;
    }
    
    history.add(new PVector(x,y,z));
    
    if (history.size() > 900){
     history.remove(0);
    }
    
    }
   
   
  
  
  void display(){
    

    
    stroke(Hue,Sat,Bright,500);
    strokeWeight(3.7);
    point(x,y,z);
    
  }
  
  
  void ParticleTrail() {
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
