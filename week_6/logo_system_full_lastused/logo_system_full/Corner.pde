class Corner {

  int xDir, yDir, zDir;
  boolean solo;

  Corner( int _xDir, int _yDir, int _zDir ) {
    xDir = _xDir;
    yDir = _yDir;
    zDir = _zDir;
  } 


  void display( color c, float _len, boolean _solo ) {
    float len;
    float pos;
    fill( c );
    if( _solo ) {
      len = _len * dim_cutter;
      pos = dim / solo_offset;
    } else {
      len = _len;
      pos = dim / offset; 
    }
    pushMatrix();
  
    // go to base corner
    translate( pos * xDir, pos * yDir, pos * zDir );
//    if( _solo ) {
//     float flag_length = dim * 3;
//     
//     //-- DEPT FLAG --//
//     pushMatrix();
//     translate( dim/2, 0, flag_length/2 );
//     rotateX( HALF_PI );
//     box( len+ boxWidth, flag_length, 1 ); 
//     //-- DEPT TEXT --//
//     textSize( 20 );
//     fill( 255 );
//     translate( -dim/4 * xDir, flag_length/3 * yDir, 5 );
//     rotateZ( HALF_PI );
//     text( "SOFT LAB", 0, 0 );
//     fill( c );
//     popMatrix();
//     
//     //-- ITP FLAG --//
//     pushMatrix();
//     translate( flag_length/2 * xDir, dim/2 * yDir, 0 );
//     rotateZ( HALF_PI );
//     box( len+ boxWidth, flag_length, 1 ); 
//     //-- ITP TEXT --//
//     textSize( 30 );
//     fill( 255 );
//     translate( dim/4 * xDir, flag_length/2.5, 5 );
//     rotateZ( -HALF_PI );
//     text( "I   T   P", 0, 0 );
//     fill( c );
//     popMatrix();
//
//    }
    // translate in each direction to draw from the center of the box
    // X
    pushMatrix();
    strokeWeight( 15 );
    translate( dim * xDir /drawCut, 0, 0 );
    rotateY( HALF_PI );
    box( boxWidth, boxWidth, len + boxWidth );  
    popMatrix();
    // Y
    pushMatrix();
    translate( 0, dim * yDir / drawCut, 0 );
    rotateX( HALF_PI );
    box( boxWidth, boxWidth, len + boxWidth );
    popMatrix();
    // Z
    pushMatrix();
    translate( 0, 0, dim * zDir / drawCut );
    box( boxWidth, boxWidth, len + boxWidth );
    popMatrix();

    //fill( 255, 0, 0 );
    //sphere( 20 );
    noFill();

    // back to center and exit swtich
    popMatrix();
  }
}


