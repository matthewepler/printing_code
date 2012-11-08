/* Ice Cream Cone Excercise
 For "Printing Code" Class @ ITP
 Instructor: Rune Madsen
 
 Assignment: create an ice cream
 cone using only rect(), ellipse(), 
 and triangle(). Each function can
 only be used once.
 
 Created September, 2012
 Matthew Epler
*/
 
 
 /*  Properties
 _________________________________________________________________ */
PGraphics canvas;
int canvas_width = 2550;  // for printing on A4, 8.5" x 11"
int canvas_height = 3300; // landscape orientation


/*  Setup
 _________________________________________________________________ */
void setup(){
 size(int(canvas_width*0.2), int(canvas_height*0.2));
 background(255);
  smooth();

  canvas = createGraphics(canvas_width, canvas_height, P2D);


  int leDiameter = 200;
  int leRadius = leDiameter/2;
  
  canvas.beginDraw();
  canvas.background(255);
  canvas.strokeWeight(20);
  canvas.noFill();
  for (int i=0; i<=canvas_height+40; i+=40) {
    canvas.rect(0, 0, canvas_width, i);
  }
  canvas.fill(255);
  canvas.ellipse(canvas_width/2, .25*canvas_height, leDiameter, leDiameter);
  canvas.triangle(canvas_width/2, canvas_height - .2*canvas_height, 
                  canvas_width/2 + leRadius, .25*canvas_height + 20, 
                  canvas_width/2 - leRadius, .25*canvas_height + 20);
  canvas.save("cone.png");
  image(canvas, 0,0, width, height);
  canvas.endDraw();
                
  

  //canvas.save("grab.png");
}


