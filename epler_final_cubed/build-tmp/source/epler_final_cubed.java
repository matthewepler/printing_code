import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import peasy.*; 
import controlP5.*; 
import processing.pdf.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class epler_final_cubed extends PApplet {


PeasyCam cam;

ControlP5 controlP5;
ControlWindow controlWindow;



ArrayList<Cube> cubes = new ArrayList();
float boxSize, halfBox, barWidth;
int tDimension, spacer, sides;
boolean record = false;

public void setup()
{
 size( 800, 800, OPENGL );

 cam = new PeasyCam(this, 100, 1, -1, 1);
 ortho( -width/2, width/2, height/2, -height/2, -1000, 1000 );
 
 initControls();

 boxSize = width / 40;
 halfBox = boxSize / 2;
 barWidth = 0.5f;
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


public void draw()
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


public void generateCubes()
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


public void initControls()
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


class Cube 
{
  
 PVector center, A, B, C, D, E, F, G, H;
 ArrayList edgeValues = new ArrayList();
 int[] edges;
 int edgeCount;
 float posX, posY, posZ;
 ArrayList neighbors = new ArrayList();
 
 // ---------------------------------------------- CONSTRUCTORS //
 Cube() 
 {
 }
 
 Cube ( int _edgeCount, float _x, float _y, float _z ) 
 {
  edgeCount = _edgeCount;
  edges = new int[ edgeCount ];
  posX = _x;
  posY = _y;
  posZ = _z;
  setVectors();
  setEdges();
 }


// ----------------------------------------------- FUNCTIONS //

public void setVectors() 
 {
  center = new PVector( 0, 0, 0 );
// --------------------------------------------- Top //
  A = new PVector( center.x - halfBox, center.y - halfBox, center.z + halfBox );
  B = new PVector( center.x + halfBox, center.y - halfBox, center.z + halfBox );
  C = new PVector( center.x + halfBox, center.y - halfBox, center.z - halfBox );
  D = new PVector( center.x - halfBox, center.y - halfBox, center.z - halfBox );
// ------------------------------------------ Bottom // 
  E = new PVector( center.x - halfBox, center.y + halfBox, center.z + halfBox );
  F = new PVector( center.x + halfBox, center.y + halfBox, center.z + halfBox );
  G = new PVector( center.x + halfBox, center.y + halfBox, center.z - halfBox );
  H = new PVector( center.x - halfBox, center.y + halfBox, center.z - halfBox );
 }


public void render()
{
  pushMatrix();
    translate( posX, posY, posZ );
    for( int i = 0; i < edges.length; i++ )
    {
      drawSingleEdge( edges[i] );
    }
  popMatrix();
}
 
 
  public void setEdges()
 {
  edgeValues.clear();

  // fill up the array with values 1 - 12
  for( int i = 0; i < 12; i++ )
  {
    Value thisValue = new Value( i );
    edgeValues.add( thisValue );
  }
  /* from 0 to edgeCount, pick a random value between 0 
  and the size of the ArrayList and add it to edges array. 
  These are the ones that will get drawn.
  Then remove the Value from the ArrayList of possible
  edges so we don't draw it twice.
  */
  for( int i = 0; i < edgeCount; i++ )
  {
    int ran = floor( random( 0, edgeValues.size() ) );
    Value thisValue = ( Value ) edgeValues.get( ran );
    edges[ i ] = thisValue.num;
    edgeValues.remove( thisValue );
  }
  
 }



public void drawSingleEdge( int _i ) 
{
  switch( _i )
  {
   /*----------------------------------------------- TOP EDGES */
   case 0:
   pushMatrix();
    translate( A.x, A.y, A.z );
    translate( halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 1:
   pushMatrix();
    translate( B.x, B.y, B.z );
    translate( 0, 0, -halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
  
   case 2:
   pushMatrix();
    translate( C.x, C.y, C.z );
    translate( -halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 3:
   pushMatrix();
    translate( D.x, D.y, D.z );
    translate( 0, 0, halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
   
   /*-------------------------------------------- BOTTOM EDGES */
   case 4:
   pushMatrix();
    translate( E.x, E.y, E.z );
    translate( halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 5:
   pushMatrix();
    translate( F.x, F.y, F.z );
    translate( 0, 0, -halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
  
   case 6:
   pushMatrix();
    translate( G.x, G.y, G.z );
    translate( -halfBox, 0, 0 );
    box( boxSize + barWidth, barWidth, barWidth );
   popMatrix();
   break;
  
   case 7:
   pushMatrix();
    translate( H.x, H.y, H.z );
    translate( 0, 0, halfBox );
    box( barWidth, barWidth, boxSize + barWidth );
   popMatrix();
   break;
  
   /*-------------------------------------------- VERTICAL EDGES */
   case 8:
   pushMatrix();
    translate( E.x, E.y, E.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
  
   case 9:
   pushMatrix();
    translate( F.x, F.y, F.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
  
   case 10:
   pushMatrix();
    translate( G.x, G.y, G.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
  
   case 11:
   pushMatrix();
    translate( H.x, H.y, H.z );
    translate( 0, -halfBox, 0 );
    box( barWidth, boxSize + barWidth, barWidth );
   popMatrix();
   break;
   } // end of sweitch
}



 public void drawRefs()  
 {
  // ------------------------------------ XYZ Guides //
  stroke( 255, 0, 0 );
  line( 0, 0, 0, 25, 0, 0 );
  stroke( 0, 255, 0 );
  line( 0, 0, 0, 0, 25, 0 );
  stroke( 0, 0, 255 );
  line( 0, 0, 0, 0, 0, 25 );
  // --------------------------------------- Ref Box //
  // stroke( 255 );
  // box( boxSize );
 }
  
}
class Value
{
  int num;

  Value ( int _i )
  {
    num = _i;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "epler_final_cubed" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
