import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;
int canvas_height = 5100;
float cutter = 0.15;

color[] allColors = new color[ 8 ];
PFont bigFont, smallFont;

float margin = 50;
float gutter = 0;

ArrayList<Module> allBlocks = new ArrayList();
ArrayList<DotModule> allDotModules = new ArrayList();
ArrayList<Group> groups = new ArrayList();

WeightedRandomSet<Color> weightedColors = new WeightedRandomSet<Color>();
ModularGrid grid;

PImage label;


void setup()
{
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height );
  
  label = loadImage( "label.png" );

  canvas.beginDraw();
  canvas.background( 115 );
  canvas.smooth();
  
  createColors();  
  createModules();
  //showLayout(); 
  //grid.display();
  randomDisplay();
  
  canvas.image( label, 1300, 2100 );
  
  canvas.endDraw();
  
  String filename = "olivetti_12";
  canvas.save( filename + ".tif" ); 
  image( canvas, 0, 0, width, height );
  println( "SAVED" );
}


 void randomDisplay() {
   for( int i = 0; i < groups.size(); i++ ) {
   Group thisGroup = groups.get( i );
   thisGroup.displayModules(); 
  }
  
  for( int i = 0; i < groups.size(); i++ ) {
   Group thisGroup = groups.get( i );
   thisGroup.displayDotModules(); 
  }
 }


 void createModules() {
  grid = new ModularGrid(10, 15, gutter, margin);  
  Module module = grid.modules[1][1]; // a single module for reference 
  
    
  Group bottomRight = new Group( "bottomRight" );
    Module pinkBottomRight = new Module( module, 3, 7, 7, 7.99, #DE2475 ); allBlocks.add( pinkBottomRight );
    Module extraPink = new Module( module, 6.5, 10.5, 2, 1, #DE2475 ); allBlocks.add( extraPink );
    DotModule smRight = new DotModule( module, 8.25, 11.25, 0.5, 0.5 ); allDotModules.add( smRight );
      bottomRight.modules.add( pinkBottomRight );
      bottomRight.modules.add( extraPink );
      bottomRight.dotModules.add( smRight );  
        groups.add( bottomRight );
        
  Group upperRight = new Group( "upperRight" );
    Module pinkUpperRight = new Module( module, 3, 0, 7, 8, #DE2475 ); allBlocks.add( pinkUpperRight );
      upperRight.modules.add( pinkUpperRight );
        groups.add( upperRight );
  
  Group upperLeft = new Group( "upperLeft" );
    Module dkBlueUpperLeft = new Module( module, 0, 0, 5, 5, #050543 ); allBlocks.add( dkBlueUpperLeft );
    Module dkBlueUpperLeft2 = new Module( module, 1, 5, 3.5, 0.5, #050543 ); allBlocks.add( dkBlueUpperLeft2 );
    DotModule smallTop = new DotModule( module, 2.25, 1.5, 0.5, 0.5 ); allDotModules.add( smallTop ); 
      upperLeft.modules.add( dkBlueUpperLeft );
      upperLeft.modules.add( dkBlueUpperLeft2 );
      upperLeft.dotModules.add( smallTop );
        groups.add( upperLeft );
        
  Group midTop = new Group( "midTop" );
    Module orangeTop = new Module( module, 2.5, 0, 5, 2, #E53410 ); allBlocks.add( orangeTop );
    DotModule largeTop = new DotModule( module, 4.25, 2, 1.5, 1.5 ); allDotModules.add( largeTop ); 
      midTop.modules.add( orangeTop );
      midTop.dotModules.add( largeTop );
        groups.add( midTop );
  
  Group midCenter = new Group( "midCenter" ); 
    Module dkBlueMiddle = new Module( module, 5.5, 8, 2.5, 2.5, #050543 ); allBlocks.add( dkBlueMiddle );
    DotModule medBottom = new DotModule( module, 7, 8.5, 1, 1 ); allDotModules.add( medBottom );
      midCenter.modules.add( dkBlueMiddle );
      midCenter.dotModules.add( medBottom );
        groups.add( midCenter );
      
  Group midRight = new Group( "midRight" );
    Module ltBlueRight = new Module( module, 9, 8, 1, 3, #559CF7 ); allBlocks.add( ltBlueRight );
    Module ltBlueRight2 = new Module( module, 9.25, 11, 0.75, 1.5, #559CF7 );
      midRight.modules.add( ltBlueRight );
      midRight.modules.add( ltBlueRight2 );
        groups.add( midRight );
    
  Group bottomLeft = new Group( "bottomLeft" );
    Module orangeBottomLeft = new Module( module, 0, 9, 5, 6, #E53410 ); allBlocks.add( orangeBottomLeft );
    DotModule large = new DotModule( module, 1.5, 9, 2, 2 ); allDotModules.add( large );
      bottomLeft.modules.add( orangeBottomLeft );
      bottomLeft.dotModules.add( large );
        groups.add( bottomLeft );
        
  Group midLeft = new Group( "midLeft" );
    Module ltBlueLeftSkinny = new Module( module, 0, 5, 1, 5, #559CF7 ); allBlocks.add( ltBlueLeftSkinny );
    Module ltBlueLeftWide = new Module( module, 0, 6, 3, 2, #559CF7 ); allBlocks.add( ltBlueLeftWide );
    Module ltBlueLeftWide2 = new Module( module, 0, 8, 3.5, 2, #559CF7 ); allBlocks.add( ltBlueLeftWide2 );
    DotModule medLeft = new DotModule( module, 1, 5.5, 1, 1 ); allDotModules.add( medLeft );
      midLeft.modules.add( ltBlueLeftSkinny );
      midLeft.modules.add( ltBlueLeftWide );
      midLeft.modules.add( ltBlueLeftWide2 );
      midLeft.dotModules.add( medLeft );
        groups.add( midLeft );

  }


 void createColors() {   
  allColors[ 0 ] = color( #DE2475 );  // pink
  allColors[ 1 ] = color( #050543 );  // dark blue
  allColors[ 2 ] = color( #559CF7 );  // light blue
  allColors[ 3 ] = color( #E53410 );  // orange
  allColors[ 4 ] = color( #FFFFFF );  // white
  
  Color pink = new Color( allColors[0] );
  Color darkBlue = new Color( allColors[1] );
  Color lightBlue = new Color( allColors[2] );
  Color orange = new Color( allColors[3] );
  Color white = new Color( allColors[4] );
  
  weightedColors.add( pink, 4 ); 
  weightedColors.add( darkBlue, 3 ); 
  weightedColors.add( lightBlue, 2 );
  weightedColors.add( orange, 2 ); 
  weightedColors.add( white, 1 ); 
 }



  void showLayout() {
    for( Module thisModule:allBlocks ) {
     canvas.fill( thisModule.c );
     canvas.stroke( thisModule.c );
     canvas.rect( thisModule.x, thisModule.y, thisModule.w, thisModule.h ); 
    }
    for( DotModule thisDotModule:allDotModules ) {
     canvas.fill( 255 );
     canvas.stroke( 0 );
     thisDotModule.display();
    }
} 

