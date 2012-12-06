/* Wet vs. Sharp Exercise
 For "Printing Code" Class @ ITP
 Instructor: Rune Madsen
 
 Assignment: Create two shapes using
 the beginShape() function. One to 
 represent "wet," and the other "sharp."
 They should appear vertically aligned. 
 Black and white only.
 
 Created September, 2012
 Matthew Epler
 for use with Proessing 1.5.1
*/

PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.15;

void setup(){
 size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
 canvas = createGraphics( canvas_width, canvas_height, P2D ); 
 canvas.beginDraw();
 canvas.colorMode( HSB, 1, 1, 1 );
 canvas.smooth();
 canvas.background(255);
 canvas.fill(0);
 canvas.ellipse(canvas_width/2, canvas_height/2, 500, 500);
 //canvas.save("wetSharp.tif"); 
 canvas.endDraw();

 image(canvas, 0, 0, width, height);
}

void draw(){
 
}
