class ScenesManager
{
  BaseScene currentScene = null;
  
  void initialize()
  {
    currentScene = new StartScene();
  }
  
  void render()
  {
    currentScene.render();
  }
 
  void onMousePressed()
  {
    if(currentScene instanceof StartScene)
      currentScene = new GameScene();
    else if(currentScene instanceof WinScene || currentScene instanceof LoseScene || currentScene instanceof DeadHeatScene)
      currentScene = new StartScene();
    else if(currentScene instanceof GameScene)
      currentScene.onMousePressed();
   }
   
   void Win()
   {
     currentScene = new WinScene();
   }
   
   void Lose()
   {
     currentScene = new LoseScene();
   }
   
   void DeadHeat()
   {
     currentScene = new DeadHeatScene();
   }
}