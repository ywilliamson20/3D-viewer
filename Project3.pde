//Project 3
//by Yvette Williamson

//Initialization and Declaration of Variables
int posx=0;
int posy=0;
int posz=0;
int tarx=0;
int tary=0;
int tarz=0;
PShape cube; 
PShape monsta;
PShape monsta2;
float tick;
PVector monster;
PVector monster2;
PVector cubes;
PVector fans;
Camera cam;

void setup(){
//Creates camera object, Cube object, Monster objects, PVector Objects and sets perspective

  size(1600, 1000, P3D);
  colorMode(HSB, 360, 100, 100);
  background(190);

 //perspective
 perspective(radians(50.0f), width/(float)height, 0.1, 1000);
 
 //Cube Object
 cube = createShape();
 cube.beginShape(TRIANGLE); 
 cube.fill(240,100,100);
  cube.vertex(-0.5, -0.5, -0.5); 
  cube.vertex(-0.5, -0.5, 0.5); 
  cube.vertex(-0.5, 0.5, -0.5);

   cube.fill(270,70,100);
  cube.vertex(0.5, 0.5, -0.5); 
  cube.vertex(0.5, -0.5, -0.5); 
  cube.vertex(-0.5, 0.5, -0.5); 
 
  cube.fill(0,100,100);
  cube.vertex(0.5, -0.5, 0.5); 
  cube.vertex(-0.5, -0.5, -0.5); 
  cube.vertex(0.5, -0.5, -0.5); 

 cube.fill(210,70,100);
  cube.vertex(-0.5, 0.5, -0.5); 
  cube.vertex(0.5, -0.5, -0.5); 
  cube.vertex(-0.5, -0.5, -0.5); 
 
  cube.fill(0,0,80);
  cube.vertex(-0.5, -0.5, 0.5); 
  cube.vertex(-0.5, 0.5, 0.5); 
  cube.vertex(-0.5, 0.5, -0.5);
 
  cube.fill(300,100,100);
  cube.vertex(0.5, -0.5, 0.5); 
  cube.vertex(-0.5, -0.5, 0.5); 
  cube.vertex(-0.5, -0.5, -0.5); 

  cube.fill(60,100,100);
   cube.vertex(-0.5, 0.5, 0.5); 
  cube.vertex(-0.5, -0.5, 0.5); 
  cube.vertex(0.5, -0.5, 0.5); 
  
  cube.fill(210,100,100);
   cube.vertex(0.5, 0.5, -0.5); 
  cube.vertex(0.5, -0.5, -0.5); 
  cube.vertex(0.5, -0.5, 0.5); 

  cube.fill(0,100,100);
   cube.vertex(0.5, -0.5, 0.5); 
  cube.vertex(0.5, 0.5, 0.5); 
  cube.vertex(0.5, 0.5, -0.5); 
 
  cube.fill(30,100,100);
   cube.vertex(0.5, 0.5, 0.5); 
  cube.vertex(0.5, 0.5, -0.5); 
  cube.vertex(-0.5, 0.5, -0.5); 
 
  cube.fill(150,30,100);
   cube.vertex(0.5, 0.5, 0.5); 
  cube.vertex(-0.5, 0.5, -0.5); 
  cube.vertex(-0.5, 0.5, 0.5); 

  cube.fill(120,100,100);
  cube.vertex(0.5, 0.5, 0.5); 
  cube.vertex(-0.5, 0.5, 0.5); 
  cube.vertex(0.5, -0.5, 0.5); 
  cube.endShape(); 
 
  //Camera Object
  cam=new Camera(tarx, tary, tarz);
  
  //PVectors are made for Object locations and sent to be added to target list for camera
  monster=new PVector (0,0,0);
  cam.LookAtTarget(monster);
  
  monster2=new PVector (75,0,0);
  cam.LookAtTarget(monster2);
  
  cubes=new PVector (-100,0,0);
  cam.LookAtTarget(cubes);
  
  fans=new PVector (-50,0,0);
  cam.LookAtTarget(fans);
  
  
  //Monster Objects
  monsta = loadShape("monster.obj"); 
  monsta.setFill(color(255, 0, 255,0));   
  monsta.setStroke(true);     
  monsta.setStroke(color(0));      
  monsta.setStrokeWeight(2.0f); 
  
  
  monsta2 = loadShape("monster.obj"); 
  monsta2.setFill(color(83, 88, 100));   
  monsta2.setStroke(false);    
    
}

void draw(){
//Draws objects created in setup function

//Continuously Update camera position
  cam.Update();
  camera(posx,posy, posz,tarx, tary,tarz,0,1,0);
  
  //For axis to be correct after making positive Y axis point upwards
  scale(1, -1, 1);
  
  //To clean up drawings
 background(190);
 
 //For grid
  for(int i=0;i<21;i++){
     stroke(0,0,100);
     strokeWeight(2.0f);
   
     if(i*10==100){
       stroke(240,100,100);
       strokeWeight(4.0f);
     }
   
     line(-100+i*10,0,-100,-100+i*10,0,100); 
     
  }
  for(int i=0;i<21;i++){
     stroke(0,0,100);
     strokeWeight(2.0f);
     if(i*10==100){
      stroke(0,100,100);
      strokeWeight(4.0f);
     }
  
     line(-100,0,-100+i*10,100,0,-100+i*10); 

  }
  
  //Draw Triangle Fans
  stroke(0);
  strokeWeight(1.0f);
  
  beginShape(TRIANGLE_FAN); 
    fill(0,100,100);
    vertex(-30, 10, 0); 
    fill(60,100,100);
    vertex(-35, 0, 0); 
    fill(120,100,100);
    vertex(-45, 0,0);
    fill(180,100,100);
    vertex(-50, 10, 0); 
    fill(240,100,100);
    vertex(-45, 20, 0); 
    fill(300,100,100);
    vertex(-35, 20, 0);
    fill(360,100,100);
    vertex(-30, 10, 0); 
  endShape(); 
  
   beginShape(TRIANGLE_FAN); 
    fill(0,100,100);
    vertex(-50, 10, 0); 
     fill(18,100,100);
    vertex(-50.5, 7, 0); 
     fill(36,100,100);
    vertex(-51, 5, 0); 
    fill(54,100,100);
    vertex(-52, 4, 0); 
      fill(72,100,100);
    vertex(-54.5, 1, 0); 
    fill(90,100,100);
    vertex(-57, 0, 0);
      fill(108,100,100);
    vertex(-60, 0, 0);
     fill(126,100,100);
    vertex(-64.5, 1, 0); 
    fill(144,100,100);
    vertex(-67.5, 4, 0); 
     fill(162,100,100);
    vertex(-69.5, 7, 0); 
     fill(180,100,100);
    vertex(-70, 10, 0); 
     fill(192,100,100);
    vertex(-69.5, 13, 0); 
     fill(216,100,100);
    vertex(-67.5, 16, 0); 
      fill(234,100,100);
    vertex(-64.5, 19, 0);
    fill(252,100,100);
    vertex(-60, 20, 0);
      fill(270,100,100);
    vertex(-57, 20, 0); 
    fill(288,100,100);
    vertex(-54.5, 19, 0);
      fill(306,100,100);
    vertex(-52, 16, 0); 
     fill(324,100,100);
     vertex(-51, 14, 0); 
    fill(342,100,100);
     vertex(-50.5, 13, 0); 
     fill(360,100,100);
    vertex(-50, 10, 0);
   endShape(); 


   //Draw Monster Objects
   shape(monsta,75,0);

   pushMatrix();
   scale(0.5);
   shape(monsta2,0,0);
   popMatrix();
  
  
   //Draw Cube Objects
   
   //First Render
   translate(-100,0,0);
   pushMatrix();
   scale(5,5,5);
   
   shape(cube);
    cube.setStroke(false); 

   popMatrix();
   
   //Render 2
   pushMatrix();
   translate(-10,0,0);
  
   shape(cube);
    cube.setStroke(false); 

   popMatrix();
   
   //Render 3
   pushMatrix();
   translate(10,0,0);
   scale(10,20,10);
  
   shape(cube);
    cube.setStroke(false); 

   popMatrix();


}

void mouseWheel(MouseEvent event) {
//To get event from Mouse Wheel and send count to Zoom camera object function

  tick = event.getCount();
  cam.Zoom(tick);
}

void keyPressed(){
//To get key event and send to Cycle Target Camera Object Function

  if(key==' ')
  {
    cam.CycleTarget();
  }
  
}
