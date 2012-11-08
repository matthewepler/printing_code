import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

void setup() {
  size( 800, 100 );
  colorMode( HSB, 1, 1, 1 );
  rectMode( CENTER );
  
  /* Color Ranges */
  FloatRange h = new FloatRange( 0, 0.3 );
  FloatRange s = new FloatRange( 0.7, 1 );
  FloatRange b = new FloatRange( 0.9, 1 );
  ColorRange range = new ColorRange( h, s, b, "My range" );
  
  float rectSize = 40;
  float rectNum = width / rectSize;
  
  translate( rectSize, 0 );
  stroke( 0, 0, 1 );
  
  for( int i = 0; i < rectNum - 1; i++ ) {
   TColor ranColor = range.getColor();
   fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness());
   rect( i * rectSize, height/2, rectSize, rectSize );
  }
  
}
