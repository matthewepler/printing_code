class TriModule
{
  float x;
  float y;
  float w;
  float h;
  float gutter;
  boolean used = false;
  
  TriModule() {}
 
  TriModule( float _x, float _y, float _w, float _h )
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  } 
  
  void display( int _num, TColor ranColor1, TColor ranColor2 ) {
   PVector[] triangle_1 = new PVector[ 3 ];
   PVector[] triangle_2 = new PVector[ 3 ];
   PVector[] triangle_3 = new PVector[ 3 ];
   PVector[] triangle_4 = new PVector[ 3 ];
   
   // 90 @ upper left corner
   triangle_1[ 0 ] = new PVector( x, y );
   triangle_1[ 1 ] = new PVector( x + w - gutter, y );
   triangle_1[ 2 ] = new PVector( x, y + h - gutter );
   
   // 90 @ upper right corner
   triangle_2[ 0 ] = new PVector( x + gutter , y );
   triangle_2[ 1 ] = new PVector( x + w, y );
   triangle_2[ 2 ] = new PVector( x + w , y + h - gutter );
   
   // 90 @ bottom right corner
   triangle_3[ 0 ] = new PVector( x + w, y + gutter );
   triangle_3[ 1 ] = new PVector( x + w, y + h );
   triangle_3[ 2 ] = new PVector( x + gutter , y + h );
      
   // 90 @ bottom left corner
   triangle_4[ 0 ] = new PVector( x, y + gutter );
   triangle_4[ 1 ] = new PVector( x, y + h );
   triangle_4[ 2 ] = new PVector( x + w -gutter , y + h );
   
   //canvas.noStroke();
   canvas.stroke( 0.3, 1, 1 );
   canvas.strokeWeight( 55 );
  
   switch( _num ) {
     case 1:
       canvas.fill( ranColor1.hue(), ranColor1.saturation(), ranColor1.brightness() );
       canvas.triangle( triangle_1[ 0 ].x, triangle_1[ 0 ].y,  triangle_1[ 1 ].x, triangle_1[ 1 ].y,  triangle_1[ 2 ].x, triangle_1[ 2 ].y ); 
       canvas.fill( ranColor2.hue(), ranColor2.saturation(), ranColor2.brightness() );
       canvas.triangle( triangle_3[ 0 ].x, triangle_3[ 0 ].y,  triangle_3[ 1 ].x, triangle_3[ 1 ].y,  triangle_3[ 2 ].x, triangle_3[ 2 ].y );        
       break;
     case 2:
       canvas.fill( ranColor1.hue(), ranColor1.saturation(), ranColor1.brightness() );
       canvas.triangle( triangle_2[ 0 ].x, triangle_2[ 0 ].y,  triangle_2[ 1 ].x, triangle_2[ 1 ].y,  triangle_2[ 2 ].x, triangle_2[ 2 ].y ); 
       canvas.fill( ranColor2.hue(), ranColor2.saturation(), ranColor2.brightness() );
       canvas.triangle( triangle_4[ 0 ].x, triangle_4[ 0 ].y,  triangle_4[ 1 ].x, triangle_4[ 1 ].y,  triangle_4[ 2 ].x, triangle_4[ 2 ].y ); 
       break;
   }
  }
  
}


