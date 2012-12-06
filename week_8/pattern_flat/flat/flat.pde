PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.15;

float multiplier = 80;
int thickness = 5;
float padding = multiplier * 4;
float margin;
float rotation = 0;

PImage logo;

void setup() 
{
 size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
 canvas = createGraphics( canvas_width, canvas_height ); 
 margin = 0.2 * canvas_width;
 logo = loadImage( "logo.png" );

 float unit = multiplier + padding/2;

 canvas.beginDraw();
 canvas.background( 5 );
 canvas.stroke( 220, 0, 0 );
 canvas.strokeWeight( thickness );
 canvas.noFill();
 float xpos, ypos;

 for( int x = 0; x <= canvas.width/unit; x++ )
 {
  for( int y = 0; y <= canvas.height/unit; y++ )
  {
    if( y % 2 == 0 )
    {
     xpos = x * padding + (padding * 1.5) - margin;
     ypos = y * padding;
    } else {
     xpos = (x * padding) + (padding) - 150 - margin;
     ypos = y * padding;
    }
    if( x % 2 == 0 )
    {
   	Cube cube = new Cube();
    cube.ranDisplay( xpos, ypos );
    } else {
    logo.resize( 150, 150 );
    canvas.pushMatrix();
     canvas.translate( xpos, ypos );
     canvas.rotate( rotation );
     canvas.image( logo, 0 - logo.width/2, 0 - 75 );
    canvas.popMatrix();
    rotation += HALF_PI;
    }
   }  
  }

 canvas.save( "makerbot_paper2.tif" );
 println( "saved!" );
 canvas.endDraw();

 image(canvas, 0, 0, width, height);
}




 

