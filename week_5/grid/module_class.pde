class Module
{
  float x;
  float y;
  float w;
  float h;
  boolean used = false;
  
  Module() {}
 
  Module( float _x, float _y, float _w, float _h )
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  } 
  
  void display() {
   drawArc( int( random( 1, 5 ) ) );
  }
  
  void drawArc( int _corner ) {
   canvas.fill( 0 );
   canvas.noStroke();
   switch( _corner ) {
    // arc( x, y, w, h, start, stop ); 
    // top left
    case 1:
      canvas.arc( x, y, w*2, h*2, 0 , HALF_PI + radians( 5 ));
      used = true;
      break;
      
    // top right
    case 2:
      canvas.arc( x + w, y, w*2, h*2, HALF_PI, PI + radians( 5 ));
      used = true;
      break;
      
    // bottom left
    case 3:
      canvas.arc( x, y + h, w*2, h*2, TWO_PI - HALF_PI , TWO_PI + radians( 5 ));
      used = true;
      break;
      
    // bottom right
    case 4: 
      canvas.arc( x + w, y + h, w*2, h*2, PI , TWO_PI - HALF_PI + radians( 5 ));
      used = true;
      break;
   }
  }
}


