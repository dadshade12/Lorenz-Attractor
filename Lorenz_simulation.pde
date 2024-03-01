import peasy.*;

Particle P;  // initiate particle object

float sigma = 10;    //constants 
float rho = 28; 
float betta = 8.0/3.0;

float dt; 

float dx;
float dy;
float dz; 

int NumOfParticles = 75;  // amount of particles you want in simulation

float x = 0.0;
float y = 0.0;
float z = 0.0;

int H;  // hue
int S;  // saturation 
int B;  // brightness




ArrayList<PVector> ParticleList = new ArrayList<PVector> (NumOfParticles); // create a array list to store the locations of all particles 
Particle[] Particles = new Particle[NumOfParticles];  // array of objects to hold each particles 

PeasyCam cam;  // camera set up



void setup(){
    size(1400, 1400, P3D);          // window size in 3d space 
    colorMode(HSB, 360, 100, 100);  // colour mode HSB and set maxs
    cam = new PeasyCam(this, 500); //initiate camera
    
    
   
    
    
    for (int i = NumOfParticles; i > 0; i--){  // set start location of each particle, random used to create slightly different start points
      
      
        
       x = random(7.95,8);
       y = random(5.95,6);
       z = random(9.95,10);
       
       ParticleList.add(new PVector(x,y,z));
       
      
      
      
      }
      
      
    for(int count = NumOfParticles; count > 0; count--) {
     
    
         if (count > (NumOfParticles/5)*3){ //sets 3 different groups of particles with varying hue in red, blue, and purple
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

         
        Particles[count - 1] = new Particle(ParticleList.get(count-1),H,S,B); // set the start location of each particle and store the object into the object array called particles  
        
        
    
       }

       
    }
   


void draw(){
  
    background(0); 
    translate(0, 0, 0);
    scale(5);
    
for(int count = NumOfParticles; count > 0; count--) { //using the Particle class move, display and start particle trail to each object in the Particles array 
   
    Particles[count -1].move();
    Particles[count - 1].display();
    Particles[count - 1].ParticleTrail();
    
    
  } 
    
}
