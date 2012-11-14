
PVector center, A, B, C, D, E, F, G, H;
int boxSize = 300;
int halfBox = boxSize/2;

void setup()
{
  size( 1000, 1000, P3D );
  background( 100 );
  colorMode( HSB, 1, 1, 1 );
  noFill();
  translate( width/2, height/2, 0 );

// ---------------------------------- Main Functions //
  setVectors();
  // drawRefs(); // draws a box and xyz guides
  drawLines();

// ---------------------------------------  Rotation //
  rotateX( radians( -35 ) );
  rotateY( HALF_PI/2 + radians(8) );
 } 



 void drawLines()
 {
  strokeWeight( 15 );
  stroke( 1, 1, 0.75 );
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



 void setVectors() 
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



 void drawRefs()
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
