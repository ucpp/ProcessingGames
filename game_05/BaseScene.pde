abstract class BaseScene
{
  public BaseScene()
  {
    initialize();
  }
  
  void initialize(){}
  
  void render()
  {
    background(255);
  }
  
  void onMousePressed(){}
  
  void onKeyPressed(int k){}
}