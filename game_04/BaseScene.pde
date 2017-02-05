abstract class BaseScene
{
  PImage imgBackground;
  
  public BaseScene()
  {
    initialize();
  }
  
  void initialize()
  {
    ResourceLoader res = ResourceLoader.getInstance();
    imgBackground = res.GetImage("bg");
  }
  
  void render()
  {
    image(imgBackground, 0, 0);
  }
  
  void onMousePressed(){}
}