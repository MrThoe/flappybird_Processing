/* FLAPPY BIRD IN PROCESSING
 * This goes goes with the 1st video in my Flappy Bird Tutorial
 * Author: Allen Thoe
 * Date: 11/8/2019
 * Language:  Processing (Version of Java)
 * Download: https://processing.org/download/
 */


PImage bg;  //Background
int bgx, bgy;


void setup()
{
  size(800,620);
  bg = loadImage("./img/bg.png");
}

//MAIN GAME LOOP
void draw()
{
   setBg();
}

void setBg()
{
  image(bg, bgx, bgy);
  image(bg, bgx + bg.width, bgy);
  bgx = bgx - 1; //Move bg left 1 pixel
  if(bgx < -bg.width)
  {
     bgx = 0; //RESET images to starting position 
  }  
}
