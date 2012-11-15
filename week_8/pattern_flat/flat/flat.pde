PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.15;

float multiplier = 80;
int thickness = 5;
float padding = multiplier * 4;
float margin;


void setup() 
{
 size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
 canvas = createGraphics( canvas_width, canvas_height ); 
 margin = 0.2 * canvas_width;
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
   	float xpos = x * padding + (padding * 1.5) - margin;
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




 

