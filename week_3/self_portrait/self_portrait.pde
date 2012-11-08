/*
Code assignment for "Printing Code" course
taught by Rune Madsen @ ITP, Fall 2012

Assignment:
This week you’ll create an abstract representation of your identity. 
Pick one of the color schemes from today’s lecture and write a Processing 
sketch that outputs abstract forms in colors using your chosen scheme. 
The only constraint - besides that it needs to as simple as possible - 
is that the colors have to be different every time you run your sketch. 
This means that you will need to use “random()”. This is an exercise in 
writing code that is generative, but within constraints. Every output 
should be different, but still effectively communicate who you are. 
You can write your own color code or use the Toxiclibs library. Print the 
result that you like the most, and bring to class a poster that you feel 
expresses who you are as a person.

Thanks for the design crisis, Rune.

Matthew Epler
September 2012
*/

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.18;

float rectSize = 40;

void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height );

  /* Color Ranges */
  FloatRange h = new FloatRange( 0, 0.1 );
  FloatRange s = new FloatRange( 0.7, 1 );
  FloatRange b = new FloatRange( 0.3, 0.9 );
  ColorRange range = new ColorRange( h, s, b, "My range" );

 
  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 ); // turns out you need to call this inside beginDraw(). Dang.
  canvas.smooth();
  canvas.noStroke();
  
  /* Color Range for background */
  PVector center = new PVector( canvas_width/2, 0.45 * canvas_height, 0 );
  float len = 0.4 * canvas_width;
  int randomLeft = (int)rectSize * (int)random( 30, 50 );
  int randomRight = (int)rectSize * (int)random( 70, 80 );
  int randomTop = (int)rectSize * (int)random( 90, 110 );
  int randomBottom = (int)randomTop + (int)rectSize*2;
  
  /* Background */
  for( int x = 0; x < canvas_width; x += rectSize ) {
    for( int y = 0; y < canvas_height; y += rectSize ) {
      if( x > randomLeft && x < randomRight && y > randomTop && y < randomBottom) {
       ColorRange xRange = ColorRange.HARD;
       TColor xColor = xRange.getColor();
       canvas.fill( xColor.hue(), xColor.saturation(), xColor.brightness() );
       canvas.rect( x, y, rectSize, rectSize );
      } else {
      TColor ranColor = range.getColor();
      canvas.fill( ranColor.hue(), ranColor.saturation(), ranColor.brightness() );
      canvas.rect( x, y, rectSize, rectSize );
    }
    }
  }
  
  /* Box - turned out to be too much. But check it out for the hell of it if you're bored. */  
     // drawBox(); // put it in a seperate function so you didn't have to read through commented code. #niceGuy
//  
  /* THE LINE! THE LINE!! */
  float randomStart = random( rectSize*6, rectSize*30 );
  float randomStop = random(canvas_height - rectSize * 40, canvas_height - rectSize*3 );
  canvas.stroke( 0, 0, 1 );
  canvas.strokeWeight( 15 );
  canvas.line( center.x - len/4 + len/2, center.y - len-4 - len/2,  center.x + len/4 + len/2, randomStop );
  
  canvas.endDraw();
  //canvas.save("portrait10.tif");
  image( canvas, 0, 0, width, height) ;

  // additional note: had trouble when trying translate(). Said it wouldn't work in this rendered. WhAAAAT?
}

void drawBox() {
//  canvas.rectMode( CENTER );
//  canvas.strokeWeight( 20 );
//  canvas.stroke( 0, 0, 1 );
//  TColor ranColor = range.getColor();
//  TColor invColor = ranColor.getComplement();
//  invColor.darken( 0.25 );
//  canvas.fill( invColor.hue(), invColor.saturation(), invColor.brightness() );
//  canvas.rect( center.x + len/4, center.y - len/4, len, len );
//  
//  canvas.stroke( 0, 0, 1 );
//  canvas.strokeWeight( 20 );
//  canvas.noFill();
//  canvas.rect( center.x - len/4, center.y + len/4, len, len );
//  canvas.line( center.x - len/4, center.y + len/4, center.x - len/4 - len/2, center.y + len/4 + len/2 );
//  canvas.line( center.x + len/4 + len/2, center.y - len/4 - len/2, center.x + len/4, center.y - len/4 ); 
//  canvas.line( center.x - len/4, center.y + len/4 - len, center.x - len/4 - len/2, center.y + len/4 - len/2 );
//  canvas.line( center.x - len/4 + len, center.y + len/4, center.x - len/4 + len/2, center.y + len/4 + len/2 );
   
}
