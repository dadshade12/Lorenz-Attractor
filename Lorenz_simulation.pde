import peasy.*;

Particle P; 

float sigma = 10;
float rho = 28; 
float betta = 8.0/3.0;

float dt; 

float dx;
float dy;
float dz; 

int NumOfParticles = 75;

float x = 0.0;
float y = 0.0;
float z = 0.0;

int H;
int S;
int B;

float offset;


ArrayList<PVector> ParticleList = new ArrayList<PVector> (NumOfParticles);
Particle[] Particles = new Particle[NumOfParticles];

PeasyCam cam;



void setup(){
    size(1400, 1400, P3D);
    colorMode(HSB, 360, 100, 100);
    cam = new PeasyCam(this, 500);
    
    
    

    float offset;
    
    
    for (int i = NumOfParticles; i > 0; i--){
      
      
        
       x = random(7.95,8);
       y = random(5.95,6);
       z = random(9.95,10);
       
       ParticleList.add(new PVector(x,y,z));
       
      
      
      
      }
      
      
    for(int count = NumOfParticles; count > 0; count--) {
     
    
         if (count > (NumOfParticles/5)*3){
           H = int(random(0,50));
           S = 100;
           B = 100;
         }
          else if (count > (NumOfParticles/3) ){
           H = int(random(300,360));
           S = 100;
           B = 100;
         } 
         else {
           H = int(random(240,300));
           S = 100;
           B = 100;
         }

         
        Particles[count - 1] = new Particle(ParticleList.get(count-1),H,S,B);
        
        
    
       }

       
    }
   


void draw(){
  
    background(0); 
    translate(0, 0, 0);
    scale(5);
    
for(int count = NumOfParticles; count > 0; count--) {
   
    Particles[count -1].move();
    Particles[count - 1].display();
    Particles[count - 1].ParticleTrail();
    
    
  } 

    
   
   
   /* noFill();
    
    float hu = 0;
    beginShape();
    for (PVector v : points) {

      strokeWeight(0.5);
      stroke(hu,255,255);
      vertex(v.x,v.y,v.z);
      hu += 0.1;
      if (hu >255){
        hu = 0;
      }
    }
    endShape();
    */
    
}
