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

public class pattern extends PApplet {


PVector center, A, B, C, D, E, F, G, H;
ArrayList edges = new ArrayList();
int boxSize = 50;
int halfBox = boxSize/2;
float padding = 0.15f * boxSize;
float move = boxSize*3 + padding*2;

public void setup()
{
  size( 1000, 1000, P3D );
  background( 100 );
  colorMode( HSB, 1, 1, 1 );
  noFill();
  strokeWeight( 5 );
  stroke( 1, 1, 0.75f );

// ---------------------------------- Main Functions //
  setVectors();
  // drawRefs(); // draws a box and xyz guides

  resetArrayList();

  for( int i = 0; i < width; i++ )
  {
    PVector pos = new PVector();
    pos.x = i * move;
    pos.y = height/2;
    drawCube( pos );
  }

 } 


 public void drawCube( PVector _pos )
 {
  resetArrayList();
  pushMatrix();
  translate( _pos.x, _pos.y, 0 );
  rotateX( radians( -30 ) );
  rotateY( HALF_PI/2 + radians(6) );
  for( int i = 0; i < 6; i++ )
  {
    int ran = floor( random( 0, edges.size() ) );
    Value thisValue = (Value) edges.get( ran );
    drawLines( thisValue.num );
    edges.remove( thisValue );
  }
  popMatrix();
 }


 public void drawLines( int _i )
 {
  switch( _i )
  {
  // --------------------------------------------- Top //
    case 0: line( A.x, A.y, A.z, B.x, B.y, B.z ); break;
    case 1: line( B.x, B.y, B.z, C.x, C.y, C.z ); break;
    case 2: line( C.x, C.y, C.z, D.x, D.y, D.z ); break;
    case 3: line( D.x, D.y, D.z, A.x, A.y, A.z ); break;

  // ------------------------------------------ Bottom //
    case 4: line( E.x, E.y, E.z, F.x, F.y, F.z ); break;
    case 5: line( F.x, F.y, F.z, G.x, G.y, G.z ); break;
    case 6: line( G.x, G.y, G.z, H.x, H.y, H.z ); break;
    case 7: line( H.x, H.y, H.z, E.x, E.y, E.z ); break;

  // ---------------------------------------- Supports //
    case 8: line( A.x, A.y, A.z, E.x, E.y, E.z ); break;
    case 9: line( B.x, B.y, B.z, F.x, F.y, F.z ); break;
    case 10: line( C.x, C.y, C.z, G.x, G.y, G.z ); break;
    case 11: line( D.x, D.y, D.z, H.x, H.y, H.z ); break;
  }
 }



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



 public void resetArrayList()
 {
  if( edges.size() > 0 )
    {
      edges.clear();
    }

  for( int i = 0; i < 12; i++ )
    {
      Value newValue = new Value( i );
      edges.add( newValue );
    }
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
  stroke( 255 );
  box( boxSize );
 }
class Cube
{  

 PVector center, A, B, C, D, E, F, G, H;
 ArrayList edges = new ArrayList();

// ---------------------------------------------- CONSTRUCTOR //
 Cube() 
 {
  setVectors();
  // drawRefs(); // draws a box and xyz guides

  resetArrayList();

  pushMatrix();
  rotateX( radians( -35 ) );
  rotateY( HALF_PI/2 + radians(8) );

  for( int i = 0; i < 6; i++ )
  {
    int ran = floor( random( 0, edges.size() ) );
    Value thisValue = (Value) edges.get( ran );
    drawLines( thisValue.num );
    edges.remove( thisValue );
  }
  popMatrix();
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
 
 
public void resetArrayList()
 {
  if( edges.size() > 0 )
    {
      edges.clear();
    }

  for( int i = 0; i < 12; i++ )
    {
      Value newValue = new Value( i );
      edges.add( newValue );
    }
 }


public void drawLines( int _i )
 {
  switch( _i )
  {
  // --------------------------------------------- Top //
    case 0:  line( A.x, A.y, A.z, B.x, B.y, B.z );  break;
    case 1:  line( B.x, B.y, B.z, C.x, C.y, C.z );  break;
    case 2:  line( C.x, C.y, C.z, D.x, D.y, D.z );  break;
    case 3:  line( D.x, D.y, D.z, A.x, A.y, A.z );  break;

  // ------------------------------------------ Bottom //
    case 4:  line( E.x, E.y, E.z, F.x, F.y, F.z );  break;
    case 5:  line( F.x, F.y, F.z, G.x, G.y, G.z );  break;
    case 6:  line( G.x, G.y, G.z, H.x, H.y, H.z );  break;
    case 7:  line( H.x, H.y, H.z, E.x, E.y, E.z );  break;

  // ---------------------------------------- Supports //
    case 8:  line( A.x, A.y, A.z, E.x, E.y, E.z );  break;
    case 9:  line( B.x, B.y, B.z, F.x, F.y, F.z );  break;
    case 10: line( C.x, C.y, C.z, G.x, G.y, G.z );  break;
    case 11: line( D.x, D.y, D.z, H.x, H.y, H.z );  break;
  }
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
  stroke( 255 );
  box( boxSize );
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
    String[] appletArgs = new String[] { "pattern" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
