import peasy.*;
PeasyCam cam;
import controlP5.*;
ControlP5 controlP5;
ControlWindow controlWindow;
import processing.pdf.*;


ArrayList<Cube> cubes = new ArrayList();
float boxSize, halfBox, barWidth;
int tDimension, spacer, sides;
boolean record = false;

void setup()
{
 size( 800, 800, OPENGL );

 cam = new PeasyCam(this, 100, 1, -1, 1);
 ortho( -width/2, width/2, height/2, -height/2, -1000, 1000 );
 
 initControls();

 boxSize = width / 40;
 halfBox = boxSize / 2;
 barWidth = 0.5;
 tDimension = 5;
 spacer = 4;
 sides = 3;

 fill( 15 );
 noStroke();
 smooth();

 generateCubes();
 int half = (int) cubes.size()/2;
 Cube center = cubes.get( half );

 cam.lookAt( center.posX, center.posY, center.posZ );
}


void draw()
{
 background( 200 );
 
 if( record ) 
 {
  beginRaw(PDF, "raw.pdf");
 }
 
  for( int i = 0; i < cubes.size(); i++ )
  {
    Cube thisCube = cubes.get( i );
    thisCube.render();
  }
  
  if( record )
  {
   endRaw();
   println( "PDF saved" );
   exit();
  }

//  float[] camPos = cam.getPosition();
//  float[] camRot = cam.getRotations();
//  float[] camCenter = cam.getLookAt();
//  println( "Position: " + camPos[0] + ", " + camPos[1] + ", " + camPos[2] );
//  println( "Rotation: " + camRot[0] + ", " + camRot[1] + ", " + camRot[2] );
//  println( "LookAt: " + camCenter[0] + ", " + camCenter[1] + ", " + camCenter[2] );
}


void generateCubes()
{
	for( int y = 0; y < tDimension; y++ ) 		 // generate cubes one vertical level at a time
 	{
	 	for( int x = 0; x < tDimension; x++ )
	 	{
	 		for( int z = 0; z < tDimension; z++ )
	 		{
	 			Cube newCube = new Cube( sides, x * boxSize * spacer, 
	 											y * boxSize * spacer * -1, 
	 											z * boxSize * spacer );
	 			cubes.add( newCube );
	 		}
	 	}
 	}
}


void initControls()
{
  controlP5 = new ControlP5(this);
  ControlWindow cw = controlP5.addControlWindow("MAIN CONTROLS",330,430);
  cw.setLocation(10,10);
  ControlGroup variables = controlP5.addGroup("Variables",30,30);
  variables.moveTo(cw);

  controlP5.begin(variables,0,10);
  
  controlP5.addSlider("boxSize", 0, width/4 ).linebreak();
  controlP5.addSlider("barWidth", 0, 6 ).linebreak();
  controlP5.addToggle("record");
  
  controlP5.end();  
}


