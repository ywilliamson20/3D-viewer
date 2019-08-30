//Class for Camera Functions

class Camera{

//Initialization and Declaration of Variables
  int tX;
  int tY;
  int tZ;
  int dX;
  int dY;
  int dZ;
  int i=1;
  float phi;
  float theta;
  int radius=200;
  PVector local;
  ArrayList<PVector> cycles;
  
  //Camera Constructor
  Camera(int tX, int tY, int tZ){
    

   this.tX=tX;
   this.tY=tY;
   this.tZ=tZ;
   cycles=new ArrayList<PVector>();//arraylist for PVectors
   
  }
  
//Function to Update Camera Position  
  void Update(){
    
    phi=map(mouseX, 0, width-1,0,360 );
    theta=map(mouseY,0, height-1, 1, 179);
    
    dX=int((radius)*cos(radians(phi))*sin(radians(theta)));
    dY=int((radius)*cos(radians(theta)));
    dZ=int((radius)*sin(radians(theta))*sin(radians(phi)));
    
    posx=tarx+dX;
    posy=tary+dY;
    posz=tarz+dZ;

  }
  
  void LookAtTarget(PVector location){
  //adds PVector to list of targets 
  
    cycles.add(location);

  }
  
  //Cycles Through Targets
  void CycleTarget()
  {
     PVector temp= new PVector();
     
      temp=cycles.get(i);
      tarx=(int)temp.x;
      i++;
      
      if(i>=cycles.size()){
        i=0;
      }

  }
  
  void Zoom(float tick)
  {
    //Changes Camera Offset
    
    if(tick>0)
    {
      if(radius<200)
      radius+=5;
    }
    
    else
    {
      if(radius>30)
      radius-=5;
    }
  }
  
} 
