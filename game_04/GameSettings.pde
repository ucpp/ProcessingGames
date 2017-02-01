class GameSettings
{
  final int fontSize = 20;
  
  void initialize()
  {
    frameRate(30);
    background(255);
    fill(0);
    initializeTextSettings();
  }
  
  void initializeTextSettings()
  {
    PFont guiFont = createFont("Arial", fontSize);
    textAlign(CENTER, CENTER);
    textFont(guiFont);
  }
}