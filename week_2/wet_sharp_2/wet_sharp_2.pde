/* Wet vs. Sharp Exercise
 For "Printing Code" Class @ ITP
 Instructor: Rune Madsen
 
 Assignment: Write a Processing sketch that 
 outputs 2 shapes on a page. The first shape 
 should be inspired by the word “wet”. The 
 second shape should be inspired by the word 
 “sharp”. Use only black and white. You have 
 to use beginShape(), and all vertex points 
 have to be created in a for loop. No manual 
 plotting. Print on a poster at AMS and bring 
 to class for design critique.
 
 Created September, 2012
 Matthew Epler
 using Dan Shiffman's Sine Wave code
 http://processing.org/learning/basics/sinewave.html
 for use with Proessing 1.5.1
 */

PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // portrait orientation
float cutter = 0.18;


void setup() {
  size(int(canvas_width*cutter), int(canvas_height*cutter));
  //background(255);
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  canvas.smooth();
  renderDrop();
}


void renderDrop() {
  canvas.beginDraw();
  canvas.background(3);
  canvas.stroke(255);
  canvas.strokeWeight(5);
  canvas.noFill();
  //canvas.line(canvas_width/2, 0, canvas_width/2, canvas_height); // for reference
  float dropWidth = 0.15 * canvas_width;
  float vertFreq = 400;
  float dropHeight = 100;
  int margin = 300;
  
  canvas.translate(canvas_width/2 - dropWidth/2, dropHeight);
  
  for(int y=0; y<canvas_height - dropHeight*8; y+=vertFreq){
    float ypos = y + margin + 0.75 * dropHeight;
    canvas.beginShape();
    canvas.vertex(0, ypos);                            
    canvas.bezierVertex(0, y + dropHeight * 6,         // control point 1
                        dropWidth, y + dropHeight * 6, // control point 2
                        dropWidth, ypos);              // anchor point   
    canvas.vertex(dropWidth/2, margin*4);
    canvas.endShape(CLOSE);
  }
  canvas.save("wetSharp2_1.tif"); 
  image(canvas, 0, 0, width, height);
  canvas.endDraw();
}

                        
