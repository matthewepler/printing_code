/* Wet vs. Sharp Exercise
 For "Printing Code" Class @ ITP
 Instructor: Rune Madsen
 October, 2012
 Matthew Epler
 */
 
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.15;


void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height ); 
  
  ColorTheme t = new ColorTheme("theme");
  t.addRange("neutral", 0.15);
  t.addRange("dark teal", 0.05);
  t.addRange("weak", 0.05);

  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 );
  canvas.smooth();
  canvas.background( 0, 0, 1 );
  canvas.noStroke();
  float pageMargin = 0.02 * canvas.width;
  float squareMargin = 0;
  float triMargin = 0;

  
  //TriangularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  TriGrid tGrid = new TriGrid( 3, 5, triMargin, pageMargin );
  
  // ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  ModularGrid grid = new ModularGrid( 6, 10, squareMargin, pageMargin );

  // Draw the Triangle Grid
  for ( int i = 0; i < tGrid.cols; i++ ) {
    for ( int j = 0; j < tGrid.rows; j++ ) {
      TriModule thisModule = tGrid.modules[ i ][ j ];
      TColor ranColor1 = t.getColor();
      TColor ranColor2 = t.getColor();
      thisModule.display( int( random( 1, 3 ) ), ranColor1, ranColor2 );
    }
  }

  // Draw the Modular Grid with Arcs
  for ( int i = 0; i < grid.cols; i++ ) {
    for ( int j = 0; j < grid.rows; j++ ) {
      Module thisModule = grid.modules[ i ][ j ];
        thisModule.display();
        
    }
  }
  
  // display grids for each module type
  tGrid.display();
  grid.display();
 
  //canvas.save("grid_17.tif"); 
  canvas.endDraw();
  image(canvas, 0, 0, width, height);
}


void draw() {
  // do nothing
}

