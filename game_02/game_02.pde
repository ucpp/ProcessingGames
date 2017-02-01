// enum doesn't work on web version!
// I use this hack for all enums
class GameState
{
  static final int
  START = 0,
  GAME  = 1,
  WIN   = 2,
  LOSE  = 3;
}
// current game state
int state = GameState.START;

GameSettings settings = new GameSettings();
Player player = new Player();
Player ai = new Player();
Ball ball = new Ball();

// start point of this sketch
void setup()
{
  size(400, 250);
  settings.initialize();
  initialize();
}

// initialize game
void initialize()
{
  state = GameState.GAME;
  ball.initialize(width/2, height/2);
  player.initialize(10, height/2);
  ai.initialize(width-10, height/2);
  ball.initialize(width/2, height/2);
}
 
void draw()
{
  background(0);
  if(state == GameState.START)
    text("Press to start", width/2, height/2);
  else if(state == GameState.GAME)
    update();
  else if(state == GameState.LOSE)
    text("You lose!", width/2, height/2);
  else if(state == GameState.WIN)
    text("You win!", width/2, height/2);
}
 
void mousePressed()
{
  if(state == GameState.START)
    initialize();
  else if(state == GameState.WIN || state == GameState.LOSE)
    state = GameState.START;
}
 
void update()
{
  updateGame();
  drawGame();
}
 
void drawGame()
{
  drawPoints();
  drawTable();
  player.paddle.render();
  ai.paddle.render();
  ball.render();
}
 
void drawTable()
{
  line(width/2, 0, width/2, height);
}
 
void drawPoints()
{
  text(player.points, width/4, settings.fontSize + 5);
  text(ai.points, width - width/4, settings.fontSize + 5);
}
 
void updateGame()
{
  updateGameState();
  updateBall();
  player.paddle.update(mouseY);
  ai.paddle.update(ball.y);
}
 
void updateBall()
{
  if(ball.x > width - ball.radius)
  {
    ai.points++;
    ball.initialize(width/2, height/2);
  }
  if(ball.x < ball.radius)
  {
    player.points++;
    ball.initialize(width/2, height/2);
  }
  
  if(player.paddle.contains(ball.x, ball.y) || ai.paddle.contains(ball.x, ball.y))
    ball.speedX *= -1;
  ball.update();
}
 
void updateGameState()
{
  if(ai.points >= 11)
    state = GameState.WIN;
  else if(player.points >= 11)
    state = GameState.LOSE;
}

int clamp(int value, int minValue, int maxValue)
{
  return max(minValue, min(value, maxValue));
}