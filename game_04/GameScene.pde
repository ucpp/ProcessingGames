class GameScene extends BaseScene
{
  String message = new String();
  Grid grid = new Grid(); 
  boolean isEndGame = false;
  
  public GameScene()
  { 
    initialize();
  }
  
  void initialize()
  {
    super.initialize();
    PImage img = ResourceLoader.getInstance().GetImage("grid");
    Point pos = new Point((256 - img.width)/2, (256 - img.height)/2);
    grid = new Grid(img, pos);
    grid.gameScene = this;
  }
  
  void render()
  {
    super.render();
    grid.render(); 
    text(message, width/2, 20);
  }
  
  void onMousePressed()
  {
    if(isEndGame)
      sm.startGame();
    else 
      grid.onMousePressed();
  }

  void Win()
  {
    EndGame("You win!");
  }

  void Lose()
  {
     EndGame("You lose!");
  }

  void DeadHeat()
  {
    EndGame("Dead heat!");
  }

  void EndGame(String msg)
  {
    message = msg;
    isEndGame = true;
  }
}