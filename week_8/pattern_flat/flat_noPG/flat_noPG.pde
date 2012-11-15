float multiplier = 20;
int thickness = 3;
float padding = multiplier * 5;
float margin;

PImage logo;
float rotation = 0;


void setup() 
{
 size( 1000, 800 );
 margin = 0.2 * width;
 background( 5 );
 stroke( 220, 0, 0 );
 strokeWeight( thickness );

 //logo = loadImage( "logo.png" );

 float unit = multiplier + padding/2;
 
 for( int x = 0; x <= width/unit; x++ )
 {
  for( int y = 0; y <= width/unit; y++ )
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
    float xpos = x * padding + (padding * 1.5) - margin;
    float ypos = y * padding;
    // cube.displayAnchors( x * padding + (multiplier * 1.5), y * padding );
    // cube.displayAllEdges( x * padding  + (multiplier * 1.5), y * padding );
    cube.ranDisplay( xpos, ypos );
    }
   }
  }
}




 

