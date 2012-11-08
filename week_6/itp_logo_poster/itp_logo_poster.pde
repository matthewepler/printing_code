/*
Matthew Epler, 2012 
*/


PGraphics canvas;
int canvas_width = 3300;
int canvas_height = 5100;
float cutter = 0.15;

color[] allColors = new color[ 8 ];
PFont bigFont, smallFont;

float margin = 50;
float gutter = 5;

HashMap<String, Module> allModules = new HashMap();
ArrayList<Module> keyList = new ArrayList();
ArrayList<Module> iterList = new ArrayList();

void setup()
{
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height );
  
  allColors[ 0 ] = color( #FF3999 );   // pink = Soft Lab
  allColors[ 1 ] = color( #FFF41A );   // yellow = Processing / Code Art
  allColors[ 2 ] = color( #55BFD8 );   // teal = Physical Computing
  allColors[ 3 ] = color( #491086 );   // purple = General Department Use
  allColors[ 4 ] = color( #5EF552 );   // green = Camp
  allColors[ 5 ] = color( #FF381A );   // red-orange =  Event
  allColors[ 6 ] = color( #1F1E1E );   // dark grey = Thesis
  allColors[ 7 ] = color( #E3E3E3 );   // light grey = Archive
  
  String[] depts = { "Soft Lab", "Processing", "PComp", "General", "Camp", "Event", "Thesis", "Archive" };
  String[] corners = { "blue.png", "green.png", "grey.png", "pink.png", "purple.png", "red.png", "white.png", "yellow.png" };
  String[] iterations = { "1A.png", "1B.png", "1C.png", "2A.png", "2B.png", "2C.png" };
  
  bigFont = loadFont( "font250.vlw");
  smallFont = loadFont( "font70.vlw" );
  
  ModularGrid grid = new ModularGrid(13, 21, gutter, margin);  
  Module module = grid.modules[1][1]; // a single module for reference
  
  // argument = ( module, startX (in modules), startY (in modules), width in modules, height in modules.
  Module main = new Module( module, 1, 1, 6, 6 );  allModules.put( "main", main );
  
  //-- KEY --//
  Module key1A = new Module( module, 8, 2, 2, 1 );   allModules.put( "key1A", key1A );  keyList.add( key1A );
  Module key1B = new Module( module, 10, 2, 2, 1 );  allModules.put( "key1B", key1B );  keyList.add( key1B );
  Module key2A = new Module( module, 8, 3, 2, 1 );   allModules.put( "key2A", key2A );  keyList.add( key2A );
  Module key2B = new Module( module, 10, 3, 2, 1 );  allModules.put( "key2B", key2B );  keyList.add( key2B );
  Module key3A = new Module( module, 8, 4, 2, 1 );   allModules.put( "key3A", key3A );  keyList.add( key3A );
  Module key3B = new Module( module, 10, 4, 2, 1 );  allModules.put( "key3B", key3B );  keyList.add( key3B );
  Module key4A = new Module( module, 8, 5, 2, 1 );   allModules.put( "key4A", key4A );  keyList.add( key4A );
  Module key4B = new Module( module, 10, 5, 2, 1 );  allModules.put( "key4B", key4B );  keyList.add( key4B );
  
  //-- TITLE --//
  Module title = new Module( module, 1, 8, 11, 2 );  allModules.put( "title", title );

 
  //-- INDIVIDUAL CORNERS --//
  Module iCorners = new Module( module, 1, 11, 11, 2 ); allModules.put( "iCorners", iCorners );
  
  //-- DEPT BOXES --//
  Module dBox1A = new Module( module, 2, 14, 3, 3 ); allModules.put( "dBox1A", dBox1A );  iterList.add( dBox1A );
  Module dBox1B = new Module( module, 5, 14, 3, 3 ); allModules.put( "dBox1B", dBox1B );  iterList.add( dBox1B );
  Module dBox1C = new Module( module, 8, 14, 3, 3 ); allModules.put( "dBox1C", dBox1C );  iterList.add( dBox1C );
  Module dBox2A = new Module( module, 2, 17, 3, 3 ); allModules.put( "dBox2A", dBox2A );  iterList.add( dBox2A );
  Module dBox2B = new Module( module, 5, 17, 3, 3 ); allModules.put( "dBox2B", dBox2B );  iterList.add( dBox2B );
  Module dBox2C = new Module( module, 8, 17, 3, 3 ); allModules.put( "dBox2C", dBox2C );  iterList.add( dBox2C );
  
  canvas.beginDraw();
  canvas.background( 115 );
  canvas.smooth();
  
  //showLayout(); 
  //grid.display();
  
  //-- MAIN IMAGE --//
  PImage mainImage = loadImage( "_main.png" );
  canvas.image( mainImage, main.x, main.y, main.w, main.h );
  
  //-- KEY MAP --//
  canvas.noStroke();
  for( int i = 0; i < keyList.size(); i++ ) {
    Module thisModule = keyList.get( i );
    float swatchWidth = 0.25 * thisModule.w;
    canvas.fill( allColors[ i ] );
    canvas.rectMode( CENTER );
    canvas.rect( thisModule.x, thisModule.y + thisModule.h / 2, swatchWidth, swatchWidth );
    canvas.fill( 255 );
    canvas.textFont( smallFont, 70 );
    canvas.text( depts[ i ], thisModule.x + swatchWidth / 1.5, thisModule.y + thisModule.h / 2 + 35 );
  }
  
  //-- TITLE --//
  canvas.textFont( bigFont, 600 );
  canvas.textAlign( CENTER );
  canvas.text( "ITP LOGO SYSTEM", title.x + title.w / 2, title.y + title.h / 1.15 );
  
  //-- CORNERS --//
  for( int i = 0; i < 8; i++ ) {
   PImage cornerImage = loadImage( corners[ i ] );
   canvas.image( cornerImage, iCorners.x + ( module.w * 1.5 )+ ( module.w * i ), iCorners.y + module.h / 2, module.w, module.h );
  }
  
  //-- ITERATIONS --//
  for( int i = 0; i < 6; i++ ) {
   Module thisModule = iterList.get( i );
   PImage iterImage = loadImage( iterations[ i ] );
   canvas.image( iterImage, thisModule.x, thisModule.y, thisModule.w, thisModule.h );
  }
  
  canvas.endDraw();
  
  int filename = day() + hour() + minute() + second();
  //canvas.save( filename + ".tif" ); 
  image( canvas, 0, 0, width, height );
  println( "SAVED" );
}

void draw() {
 // do nothing 
}

void showLayout() {
   Iterator i = allModules.entrySet().iterator();  
   while (i.hasNext()) {
     Map.Entry me = ( Map.Entry )i.next();
     Module thisModule = (Module) me.getValue(); 
     canvas.fill( color( random(255), random(255), random(255)) );
     canvas.rect( thisModule.x, thisModule.y, thisModule.w, thisModule.h );
  } 
}
