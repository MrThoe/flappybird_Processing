/* FLAPPY BIRD IN PROCESSING
 * This goes goes with the 3rd video in my Flappy Bird Tutorial
 * Author: Allen Thoe
 * Date: 11/8/2019
 * Language:  Processing (Version of Java)
 * Download: https://processing.org/download/
 */

PImage bg, kirby, topPipe, botPipe;  //Background, Player
int bgx, bgy, kx, ky, g, Vky;

void setup()
{
  size(800,620);
  bg = loadImage("./img/bg.png");
  kirby = loadImage("./img/kirby.png");
  botPipe = loadImage("./img/botPipe.png");
  topPipe = loadImage("./img/topPipe.png");
  kx = 100;
  ky = 50;
  g = 1; //Gravity == Speed of downward acceleration
}

//MAIN GAME LOOP
void draw()
{
   setBg();
   kirby();
   image(topPipe, 0, 0);
   image(botPipe, 0, 480);
}

void kirby()
{
   image(kirby, kx, ky);
   ky = ky + Vky;
   Vky = Vky + g;  
}

void mousePressed()
{
   Vky = -15;
}
void setBg()
{
  image(bg, bgx, bgy);
  image(bg, bgx + bg.width, bgy);
  bgx--;
  if(bgx < -bg.width)
  {
     bgx = 0; //RESET images to starting position 
  }  
}
