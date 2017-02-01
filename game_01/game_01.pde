final int gameTime = 10;
final int fontSize = 24;
// rectangle width (px)
final int w = 30;
// rectangle height (px)
final int h = 30;

// position rectangle on screen
int x, y;
//player points
int points;
int time;

// enum doesn't work on web version!
// I use this hack for all enums
class GameState 
{
  final static int
  START = 0,
  GAME  = 1, 
  END   = 2;
}
// current game state
int state = GameState.START;
 
// start point of this sketch
void setup()
{
    // the game window size
    size(400, 300);
    initializeTextSettings();
    // count frames per second
    frameRate(10);
    clearScreen();
    drawStartScene();
}

// game loop
// call for update mouse position
void draw() {}

// on mouse pressed
void mousePressed()
{
    update();
}

// update game states
void update()
{
  switch(state)
  {
    case GameState.START:
    state = GameState.GAME;
    points = 0;
    time = millis()/1000;
    drawGameScene();
    break;
    
    case GameState.GAME:
    // if the mouse cursor on the rectangle, we will add game points
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h)
    {
      points++;
      drawGameScene();
    }
    // if the time is over
    if(millis()/1000 - time >= gameTime)
    {
      state = GameState.END;
      drawEndScene();
    }
    break;
    
    case GameState.END:
    state = GameState.START;
    drawStartScene();
    break;
  }
}
 
// draw black screen
void clearScreen()
{
  background(0);
}

void initializeTextSettings()
{
  PFont guiFont = createFont("Arial", fontSize);
  textAlign(CENTER, CENTER);
  textFont(guiFont);
}

void drawStartScene()
{
   clearScreen();
   text("Press to Start", width/2, height/2);
}
 
// draw rectangle in random point
void drawGameScene()
{
   clearScreen();
   text("Points: " + points, width/2, fontSize + 5);
   x = (int)(w + random(width - w*2));
   y = (int)(h + fontSize + 5 + random(height - (h*2 + fontSize + 5)));
   rect(x, y, w, h);
}
 
void drawEndScene()
{
  clearScreen();
  text("Game Over\n" + points + " points", width/2, height/2);
}