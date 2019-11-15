/* FLAPPY BIRD IN PROCESSING
 * This goes goes with the 5th video in my Flappy Bird Tutorial
 * Author: Allen Thoe
 * Date: 11/14/2019
 * Language:  Processing (Version of Java)
 * Download: https://processing.org/download/
 */

PImage bg, kirby, topPipe, botPipe;  //Background, Player
int bgx, bgy, kx, ky, g, Vky;
int[] pipeX, pipeY; //DECLARE two arrays 
int gameState;

//ONE TIME
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
  pipeX = new int[5];  //[0,0,0,0]
  pipeY = new int[pipeX.length];
  //POPULATE THE ARRAY WITH VALUES
  for(int i = 0; i < pipeX.length; i++)
  {
    pipeX[i] = width + 200*i;
    pipeY[i] = (int)random(-350, 0);
  } 
}

//MAIN GAME LOOP
void draw()
{
  if(gameState==0)
  {
    setBg();
    setPipes();
    kirby(); //PUTS KIRBY ON TOP -- Draws him last
  }
  else
  {
    text("YOU LOSE", 20,100);  
  }
}

void setPipes()
{
  //Move the Pipes
  for(int i = 0; i < pipeX.length; i++)
  {
   image(topPipe, pipeX[i], pipeY[i]);
   image(botPipe, pipeX[i], pipeY[i] + 680);
   pipeX[i]-= 2;
   if(pipeX[i] < -200)
   {
     pipeX[i] = width;  
   }
   
   //Check for Collision
   if(kx > (pipeX[i]-35) && kx < pipeX[i] + 92)
   {
     if(!(ky > pipeY[i] + 449 && ky < pipeY[i] + (449 + 231-49)))
     {
       gameState = 1;
     }
   }
  }  
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
