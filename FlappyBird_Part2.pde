PImage bg, kirby, topPipe, botPipe;  //Background, Player
int bgx, bgy, kx, ky, g, Vky;

void setup()
{
  size(800,620);
  numPipes = 10;
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
}

void kirby()
{
   image(kirby, kx, ky);
   ky = ky + Vky;
   Vky = Vky + g; 
   if(ky>=height-50)
   {
     ky = height-50; 
   }
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
