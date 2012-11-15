import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

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

public class flat_test extends PApplet {

PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.15f;

float multiplier = 80;
int thickness = 5;
float padding = multiplier * 4;
float margin;


public void setup() 
{
 size( PApplet.parseInt( canvas_width*cutter ), PApplet.parseInt( canvas_height*cutter ) );
 canvas = createGraphics( canvas_width, canvas_height ); 
 margin = 0.2f * canvas_width;
 canvas.background( 5 );
 canvas.stroke( 220, 0, 0 );
 canvas.strokeWeight( thickness );
 canvas.noFill();

 float unit = multiplier + padding/2;

 canvas.beginDraw();
 for( int x = 0; x <= canvas.width/unit; x++ )
 {
  for( int y = 0; y <= canvas.height/unit; y++ )
  {
   if( y % 2 == 0 )
   {
   	Cube cube = new Cube();
   	float xpos = x*padding - margin;
    float ypos = y*padding;
    // cube.displayAnchors( x*padding, y*padding );
    // cube.displayAllEdges( x*padding, y*padding );
    cube.ranDisplay( xpos, ypos );
   } else {
   	Cube cube = new Cube();
   	float xpos = x * padding + (padding * 1.5f) - margin;
    float ypos = y * padding;
    // cube.displayAnchors( x * padding + (multiplier * 1.5), y * padding );
    // cube.displayAllEdges( x * padding  + (multiplier * 1.5), y * padding );
    cube.ranDisplay( xpos, ypos );
   }  
  }
 }
 canvas.save( "makerbot_paper.tif" );
 println( "saved!" );
 canvas.endDraw();

 image(canvas, 0, 0, width, height);
}




 

class Cube
{
 ArrayList<Value> numbers = new ArrayList();
 ArrayList<PVector> bottom = new ArrayList();
 ArrayList<PVector> top = new ArrayList();
 PVector center = new PVector( 0, 0 );
 
 Cube()
 {
  PVector Eref = new PVector( -5,  1 );
 	Eref.normalize();
 	PVector E = PVector.sub( center, Eref );
 	E.mult( multiplier );
 	bottom.add( E );
 PVector Fref = new PVector(  1,  3 );
 	Fref.normalize();
 	PVector F = PVector.sub( center, Fref );
    F.mult( multiplier/2 );
    bottom.add( F );
 PVector Gref = new PVector(  5, -1 );
	Gref.normalize();
	PVector G = PVector.sub( center, Gref );
 	G.mult( multiplier );
 	bottom.add( G );
 PVector Href = new PVector( -1, -3 );
	Href.normalize();
	PVector H = PVector.sub( center, Href );
 	H.mult( multiplier/2 );
 	bottom.add( H );

 PVector A = new PVector( E.x, E.y - multiplier * 1.25f );
 top.add( A );
 PVector B = new PVector( F.x, F.y - multiplier * 1.25f );
 top.add( B );
 PVector C = new PVector( G.x, G.y - multiplier * 1.25f );
 top.add( C );
 PVector D = new PVector (H.x, H.y - multiplier * 1.25f );
 top.add( D );
 }

 
 public void displayAnchors( float xpos, float ypos ) 
{
 canvas.pushMatrix();
 canvas.translate( xpos, ypos );
 for( int i = 0; i < bottom.size(); i++ )
 {
   PVector anchor = bottom.get( i );
   canvas.fill( i * 15, 1, 1 );
   canvas.ellipse( anchor.x, anchor.y, 10, 10 );
 }
 for( int i = 0; i < top.size(); i++ )
 {
   PVector anchor = top.get( i );
   canvas.fill( i * 15, 1, 1 );
   canvas.ellipse( anchor.x, anchor.y, 10, 10 );
 }
 canvas.popMatrix();
}


public void displayAllEdges( float xpos, float ypos )
{
 canvas.pushMatrix();
 canvas.translate( xpos, ypos );	
 // ----------------------------------------- BOTTOM //	
 for( int i = 1; i < bottom.size(); i++ )
 {
 	PVector currVector = bottom.get( i );
 	PVector prevVector = bottom.get( i-1 );
 	canvas.line( currVector.x, currVector.y, prevVector.x, prevVector.y );
 }
 PVector bFirst = bottom.get( 0 );
 PVector bLast = bottom.get( bottom.size() - 1 );
 canvas.line( bFirst.x, bFirst.y, bLast.x, bLast.y );

  // ----------------------------------------- TOP //	
  for( int i = 1; i < top.size(); i++ )
 {
 	PVector currVector = top.get( i );
 	PVector prevVector = top.get( i-1 );
 	canvas.line( currVector.x, currVector.y, prevVector.x, prevVector.y );
 }
  PVector tFirst = top.get( 0 );
  PVector tLast = top.get( top.size() - 1 );
  canvas.line( tFirst.x, tFirst.y, tLast.x, tLast.y );

  // ----------------------------------------- SUPPORTS //	
  for( int i = 0; i < 4; i++ )
  {
  	PVector bAnchor = bottom.get( i );
  	PVector tAnchor = top.get( i );
  	canvas.line( bAnchor.x, bAnchor.y, tAnchor.x, tAnchor.y );
  }
  popMatrix();
 }


 public void ranDisplay( float xpos, float ypos )
 {
  initList();

  for( int i = 0; i < 6; i++ )
  {
  	int ranValue = (int) floor( random( 0, numbers.size() ) );
  	Value thisValue = numbers.get( ranValue );
  	canvas.pushMatrix();
  	  canvas.translate( xpos, ypos );
  	  displayEdge( thisValue.num );
  	canvas.popMatrix();
  	numbers.remove( thisValue );
  }
 }

 public void displayEdge( int _num )
 {
 	PVector start = new PVector();
 	PVector end   = new PVector();

  	switch( _num )
  	{
  		case 0: 
  				{
  				 start = top.get( 0 );
  				 end   = top.get( 1 );
  				 break;
  				}
  		case 1: 
  				{
  				 start = top.get( 1 );
  				 end   = top.get( 2 );
  				 break;
  				}
  		case 2: 
  				{
  				 start = top.get( 2 );
  				 end   = top.get( 3 );
  				 break;
  				}
  		case 3: 
  				{
  				 start = top.get( 3 );
  				 end   = top.get( 0 );
  				 break;
  				}
  		case 4: 
  				{
  				 start = bottom.get( 0 );
  				 end   = bottom.get( 1 );
  				 break;
  				}
  		case 5: 
  				{
  				 start = bottom.get( 1 );
  				 end   = bottom.get( 2 );
  				 break;
  				}
  		case 6: 
  				{
  				 start = bottom.get( 2 );
  				 end   = bottom.get( 3 );
  				 break;
  				}
  		case 7: 
  				{
  				 start = bottom.get( 3 );
  				 end   = bottom.get( 0 );
  				 break;
  				}
  		case 8: 
  				{
  				 start = top.get( 0 );
  				 end   = bottom.get( 0 );
  				 break;
  				}
  		case 9: 
  				{
  				 start = top.get( 1 );
  				 end   = bottom.get( 1 );
  				 break;
  				}
  		case 10:
  			 	{
  				 start = top.get( 2 );
	   			 end   = bottom.get( 2 );
  				 break;
				}  		
			case 11: 
				{
  				 start = top.get( 3 );
	   			 end   = bottom.get( 3 );
  				 break;
				}  	
			}
  	canvas.line( start.x, start.y, end.x, end.y );
 }


 public void initList()
{
 if( numbers.size() > 0 )
 {
 	numbers.clear();
 }
 for( int i = 0; i < 12; i++ )
 {
 	Value value = new Value( i );
 	numbers.add( value );
 }
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
    String[] appletArgs = new String[] { "flat_test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
