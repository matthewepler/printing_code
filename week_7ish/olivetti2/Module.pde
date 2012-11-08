class Module
{
  float x;
  float y;
  float w;
  float h;
  color c;
  
  Module() {}
 
  Module( Module _baseModule, float startX, float startY, float _w, float _h, color _c )
  {
    x = ( startX * _baseModule.w ) + ( gutter * (startX - 1 ) ) + margin;
    y = ( startY * _baseModule.h ) + ( gutter * startY - 1 ) + margin;
    w = ( _w * _baseModule.w ) + ( gutter * ( _w - 1 ) );
    h = ( _h *_baseModule.h ) + ( gutter * ( _h - 1 ) );    
    c =  _c;
  } 
  
  void display( color _x) { 
     canvas.fill( _x );
     canvas.noStroke();
     canvas.rect( x, y, w, h ); 
  }
}
