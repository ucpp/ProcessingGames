class Player
{
  Paddle paddle = new Paddle();
  int points = 0;

  void initialize(int x, int y)
  {
    points = 0;
    paddle.initialize(x, y);
  }
}