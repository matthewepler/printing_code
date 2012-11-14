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
int boxSize = 300;
int halfBox = boxSize/2;

public void setup()
{
  size( 1000, 1000, P3D );
  background( 100 );
  colorMode( HSB, 1, 1, 1 );
  noFill();
  translate( width/2, height/2, 0 );

  setVectors();
  drawLines();

// ---------------------------------------  Rotation //
  // stroke( 200 );
  rotateX( radians( -35 ) );
  rotateY( HALF_PI/2 + radians(8) );

 } 



 public void drawLines()
 {
  strokeWeight( 15 );
  stroke( 1, 1, 0.75f );
// --------------------------------------------- Top //
  line( A.x, A.y, A.z, B.x, B.y, B.z ); 
  line( B.x, B.y, B.z, C.x, C.y, C.z );
  line( C.x, C.y, C.z, D.x, D.y, D.z );
  line( D.x, D.y, D.z, A.x, A.y, A.z );
// ------------------------------------------ Bottom //
  line( E.x, E.y, E.z, F.x, F.y, F.z ); 
  line( F.x, F.y, F.z, G.x, G.y, G.z );
  line( G.x, G.y, G.z, H.x, H.y, H.z );
  line( H.x, H.y, H.z, E.x, E.y, E.z );
// ---------------------------------------- Supports //
  line( A.x, A.y, A.z, E.x, E.y, E.z ); 
  line( B.x, B.y, B.z, F.x, F.y, F.z );
  line( C.x, C.y, C.z, G.x, G.y, G.z );
  line( D.x, D.y, D.z, H.x, H.y, H.z );
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pattern" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
