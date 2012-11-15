class DotModule {
  
  float x;
  float y;
  float w;
  float h;
  
 
  DotModule( Module _baseModule, float startX, float startY, float _w, float _h )
  {
    x = ( startX * _baseModule.w ) + ( gutter * (startX - 1 ) ) + margin;
    y = ( startY * _baseModule.h ) + ( gutter * startY - 1 ) + margin;
    w = ( _w * _baseModule.w ) + ( gutter * ( _w - 1 ) );
    h = ( _h *_baseModule.h ) + ( gutter * ( _h - 1 ) );   

  }  
  
  void display() {
    
    ArrayList values = new ArrayList();
    int numLetter = ceil( random( 0, 2 ) );
    int[] numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    String upperCase = "A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z";
    
    
    if ( numLetter == 1 ) {                   // let there be numbers
      for( int i = 0; i < numbers.length; i++ ) {
       values.add( (int) numbers[ i ] ) ; 
      }
    } else {                                  // let there be letters
      int upperLower = ceil( random( 0, 2 ) );
      if( upperLower == 1 ) {  // upper case
        String[] allLetters = upperCase.split(", ");
        for( int i = 0; i < allLetters.length; i++ ) {
         values.add( (String) allLetters[ i ] ); 
        }
      } else {                 // lower case
        String lowerCase = upperCase.toLowerCase();
        String[] allLetters = lowerCase.split(", ");
        for( int i = 0; i < allLetters.length; i++ ) {
         values.add( (String) allLetters[ i ] ); 
        }
      }
    }
    
    
    canvas.noStroke();
    Color randC;
    
    // squares behind ellipses
    for( int i = 0; i < 2; i++ ) {
      randC = weightedColors.getRandom();
      canvas.fill( randC.c );
      canvas.rect( x + ( w * i ), y, w, h ); 
     for( int j = 0; j < 2; j++ ) {
       randC = weightedColors.getRandom();
       canvas.fill( randC.c );
       canvas.rect( x, y + ( h * i ), w, h ); 
     }
    } 
    
    // ellipses      
     for( int i = 0; i < 3; i++ ) {
       for( int j = 0; j < 3; j++ ) {
        randC = weightedColors.getRandom();
        canvas.fill( randC.c );
        canvas.ellipse( x + (w * i), y + (h * j), w, h );
         } 
        } 
}
}
