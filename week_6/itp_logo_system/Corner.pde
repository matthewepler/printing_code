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

    // translate in each direction to draw from the center of the box
    // X
    pushMatrix();
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

    //fill( 255, 0, 0 );  // for reference of centroid
    //sphere( 20 );
    noFill();

    // back to center and exit swtich
    popMatrix();
  }
}


