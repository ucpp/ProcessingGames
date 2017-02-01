class GameState
{
  static final int
  START = 0,
  GAME  = 1,
  WIN   = 2,
  LOSE  = 3;
}
int state = GameState.START;

GameSettings settings = new GameSettings();
final int countBricksCol = 5;
final int countBricksRow = 3;
Brick[] bricks = new Brick[countBricksCol * countBricksRow];
Ball ball = new Ball();
Paddle paddle;
color[] col = new color[3];
int countBricks = 0;

void setup()
{
  size(300,300);
  settings.initialize();
  crearScreen();
  drawStart();
}

void draw()
{
  clearScreen();
  if(state == GameState.START)
    drawStart();
  else if(state == GameState.GAME)
    update();
  else if(state == GameState.LOSE)
    text("You lose!", width/2, height/2);
  else if(state == GameState.WIN)
    text("You win!", width/2, height/2);
}

void drawStart()
{
  text("Press to start", width/2, height/2);
}

void clearScreen()
{
  fill(255);
  background(0);
}

void update()
{
  ball.update();
  ball.render();
  paddle.update(mouseX);
  paddle.render();
  if(paddle.collider.OverlapsCircle(ball.collider))
     ball.speedY *= -1;
  for(int i = 0; i < bricks.length; i++)
  {
    if(bricks[i] != null)
    {
      bricks[i].render();
      if(bricks[i].collider.OverlapsCircle(ball.collider))
      {
        ball.speedY*=-1;
        bricks[i] = null;
        countBricks++;
      }
    }
  }
  if(ball.position.y > height + ball.R)
    state = GameState.LOSE;
  
  if(countBricks == countBricksCol * countBricksRow)
    state = GameState.WIN;
}

void mousePressed()
{
  if(state == GameState.START)
    startGame();
  else if(state == GameState.WIN || state == GameState.LOSE)
    state = GameState.START;
}

void startGame()
{
  state = GameState.GAME;
  countBricks = 0;
  int w = (300-4)/countBricksCol - 4;
  int h = (100-4)/countBricksRow - 4;
  
  col[0] = color(255, 255, 0); // yellow
  col[2] = color(0, 0, 255); // blue
  col[1] = color(255, 0, 0); // red
  
  for(int i = 0; i < 5; i++)
  {
    for(int j = 0; j < 3; j++)
    {
      bricks[i*countBricksRow + j] = new Brick(i*w + (i+1)*4, j*h + (j+1)*4, w, h);
      bricks[i*countBricksRow + j].col = col[j];
      bricks[i*countBricksRow + j].render();
    }
  }
  ball = new Ball(width/2, height/2, 10);
  paddle = new Paddle(width/2, height - 20, 70, 15);
}