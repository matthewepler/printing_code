import peasy.*;
PeasyCam cam;
import controlP5.*;
ControlP5 controlP5;
int set = 0;

color[] allColors = new color[ 8 ];
color soloColor; 
boolean soloColorON;

boolean solo = false;
boolean refBox = false;
boolean axis = false;
float drawLen;
float drawCut = 2;
float boxWidth = 3;
float offset = -0.8;
float solo_offset = ( offset/1.5 );
int dim = 50;
float dim_cutter = 1.0;


void setup() {
  size( 1400, 900, P3D ); 
  cam = new PeasyCam(this, 300);
  
  initControls();
 
  allColors[ 0 ] = color( #FF3999 );   // pink = Soft Lab
  allColors[ 1 ] = color( #FFF41A );   // yellow = Processing / Code Art
  allColors[ 2 ] = color( #55BFD8 );   // teal = Physical Computing
  allColors[ 3 ] = color( #491086 );   // purple = General Department Use
  allColors[ 4 ] = color( #5EF552 );   // green = Camp
  allColors[ 5 ] = color( #FF381A );   // red-orange =  Event
  allColors[ 6 ] = color( #1F1E1E );   // dark grey = Thesis
  allColors[ 7 ] = color( #E3E3E3 );   // light grey = Archive
  
  soloColorON = false; 
    if( soloColorON ) {
    soloColor = color( allColors[ 6 ] );        // green = Camp
  }
}


void draw() {
  if( set == 1 ) {
  } else {
    background( 115 );
  }   //ambientLight(102, 102, 102);
  noFill();
  noStroke();
  strokeWeight( 1 );
  


  //-- AXIS REFERENCE @ 0, 0, 0 --//
  if ( axis ) {
    drawAxis();
  }

  //-- MASTER REFERENCE BOX --//
  if ( refBox ) {
    stroke( 255 );
    box( dim );
  }

  //-- DRAW ALL CORNERS --//
  for ( int i = 0; i < 9; i++ ) {
    if( i == 10 ) { //
     solo = true; 
    } else {
     solo = false; 
    }
    drawLen = dim/dim_cutter;
    drawCorner( i, drawLen, solo );  
  }
  
  //-- SEE A SINGLE CORNER --//
//  solo = true;
//  drawCorner( 8, dim, solo );
controlP5.draw();
}


void drawCorner( int c, float len, boolean _solo ) {
  switch( c ) {
  case 1:  // corner 1 - 2 - 3
    Corner corner1 = new Corner( 1, -1, 1 );  
    if( soloColorON ) {
      stroke( 255 );
      corner1.display( soloColor, len, _solo ); 
      noStroke();
    } else {
      corner1.display( allColors[ 0 ], len, _solo ); 
    }
    break;

  case 2:  // corner 1 - 4 - 8 
    Corner corner2 = new Corner( -1, -1, 1); 
    if( soloColorON ) {
      stroke( 255 );
      corner2.display( soloColor, len, _solo ); 
     noStroke(); 
    } else {
     corner2.display( allColors[ 1 ], len, _solo );  
    }
   
    
    break;

  case 3:  // corner 3 - 4 - 7
    Corner corner3 = new Corner( -1, -1, -1 ); 
    if( soloColorON ) {
      stroke( 255 );
      corner3.display( soloColor, len, _solo ); 
      noStroke();
    } else {
     corner3.display( allColors[ 2 ], len, _solo ); 
    }
    break;

  case 4:  // corner 2 - 3 - 6 
    Corner corner4 = new Corner( 1, -1, -1 ); 
    if( soloColorON ) {
      stroke( 255 );
      corner4.display( soloColor, len, _solo ); 
      noStroke();
    } else {
     corner4.display( allColors[ 3 ], len, _solo ); 
    }
    break;

  case 5:  // corner 6 - 10 - 11
    Corner corner5 = new Corner( 1, 1, -1 ); 
    if( soloColorON ) {
      stroke( 255 );
      corner5.display( soloColor, len, _solo );
      noStroke();
    } else {
     corner5.display( allColors[ 4 ], len, _solo );
    }
    break;

  case 6:  // corner 5 - 9 - 10
    Corner corner6 = new Corner( 1, 1, 1 ); 
    if( soloColorON ) {
      stroke( 255 );
      corner6.display( soloColor, len, _solo );  
      noStroke();
    } else {
     corner6.display( allColors[ 5 ], len, _solo );  
    }
    break;

  case 7:  // corner 8 - 9 - 12  
    Corner corner7 = new Corner( -1, 1, 1 ); 
    if( soloColorON ) {
      stroke( 255 );
      corner7.display( soloColor, len, _solo );
      noStroke();
    } else {
     corner7.display( allColors[ 6 ], len, _solo );
    }
    break;

  case 8:  // corner 8 - 9 - 12
    Corner corner8 = new Corner( -1, 1, -1 ); 
    if( soloColorON ) {
      stroke( 255 );
      corner8.display( soloColor, len, _solo );
      noStroke();
    } else {
     corner8.display( allColors[ 7 ], len, _solo );
    }
    break;
  }
}


void drawAxis() {
  strokeWeight( 1 );
  // x-axis = RED
  stroke( 255, 0, 0 );
  fill( 255, 0, 0 );
  line( 0, 0, 0, 10, 0, 0 );
  textSize( 5 );
  text( "X", 10, 0, 0 );
  // y-axis = GREEN
  stroke( 0, 255, 0 );
  fill( 0, 255, 0 );
  text( "Y", 0, 10, 0 );
  line( 0, 0, 0, 0, 10, 0 );
  // z-axis = BLUE
  stroke( 0, 0, 255 );
  fill( 0, 0, 255 );
  text( "Z", 0, 0, 10 );
  line( 0, 0, 0, 0, 0, 10 );
  noFill();
  noStroke();
}

void initControls() {
  controlP5 = new ControlP5(this);
  ControlWindow cw = controlP5.addControlWindow("MAIN CONTROLS",250,250);
  cw.setLocation(10,10);
  //controlP5.addToggle("toggle",300,360,50,50);
  ControlGroup cg = controlP5.addGroup("myGroup",30,30);
  cg.moveTo(cw);
  controlP5.begin(cg,0,10);
  controlP5.addSlider("drawCut",0.15,8).linebreak();
  controlP5.addSlider("boxWidth",0,55).linebreak();
  controlP5.addSlider("offset",-4,0).linebreak();
  controlP5.addSlider("dim",10,30).linebreak();
  controlP5.addSlider("dim_cutter",0.25,8).linebreak();
  Toggle set = controlP5.addToggle("set");
  set.setColorForeground( #F00505 );
  set.setColorLabel( #FFFFFF ); 
  set.setColorActive( #F00505 );
  set.setColorBackground( #9D2626 );  
  controlP5.end();
  
//  ControlWindow cw2 = controlP5.addControlWindow("SOLO SELECT", 250, 250 );
//  cw2.setLocation(10,300);
//  DropdownList p1 = controlP5.addDropdownList("SELECT DEPT.",30,100,100,180);
//  p1.moveTo(cw2);
//  p1.setBackgroundColor(color(190));
//  p1.setItemHeight(20);
//  p1.setBarHeight(15);
//  //p1.captionLabel().set("SOLO");
//  p1.captionLabel().style().marginTop = 3;
//  p1.captionLabel().style().marginLeft = 3;
//  p1.valueLabel().style().marginTop = 3;
//  p1.setColorBackground(color(60));
//  p1.setColorActive(color(255,128));
//  
//  p1.addItem("Soft Lab", 0);
//  p1.addItem("Code",1);
//  p1.addItem("PComp",2);
//  p1.addItem("General",3);
//  p1.addItem("Camp",4);
//  p1.addItem("Event",5);
//  p1.addItem("Thesis",6);
//  p1.addItem("Archive",7);
}

