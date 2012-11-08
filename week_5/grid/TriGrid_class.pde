class TriGrid {
  
  int cols;
  int rows;
  float gutterSize;
  float pageMargin;
  TriModule[][] modules;
  float moduleWidth;
  float moduleHeight;
  
  TriGrid( int _cols, int _rows, float _gutterSize, float _pageMargin ) {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;
    
    modules = new TriModule[ cols ][ rows ];
    
    float actualPageWidth = ( ( float )canvas.width - ( 2*pageMargin ) );
    float totalGutterWidth = (cols-1) * gutterSize;
    moduleWidth = (actualPageWidth - totalGutterWidth) / ( float )cols;
    
    float actualPageHeight = ( ( float )canvas.height - ( 2*pageMargin ) );
    float totalGutterHeight = ( rows-1 ) * gutterSize;
    moduleHeight = ( actualPageHeight - totalGutterHeight ) / ( float )rows;
    
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        modules[i][j] = new TriModule();
        modules[i][j].x = pageMargin + ( i * moduleWidth ) + ( i * gutterSize );
        modules[i][j].y = pageMargin + ( j * moduleHeight ) + ( j * gutterSize );
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
        modules[i][j].gutter = gutterSize;
      } 
    }
  }

void display()
  {
    canvas.noFill();
    canvas.stroke( 0.3, 1, 1 );
    canvas.strokeWeight( 55 );
    
    canvas.rect( pageMargin, pageMargin, canvas.width - (2*pageMargin), canvas.height - (2*pageMargin) );
    
    // draw all modules
    for( int i = 0; i < cols; i++ )
    {
      for( int j = 0; j < rows; j++ )
      {
        canvas.rect( modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h );
      } 
    }
  }
}
