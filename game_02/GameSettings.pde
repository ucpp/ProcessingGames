class GameSettings
{
  final int fontSize = 20;
  
  void initialize()
  {
    frameRate(30);
    background(0);
    stroke(255);
    initializeTextSettings();
  }
  
  void initializeTextSettings()
  {
    PFont guiFont = createFont("Arial", fontSize);
    textAlign(CENTER, CENTER);
    textFont(guiFont);
  }
}