public static PApplet pApplet;
ScenesManager sm = new ScenesManager();
GameSettings settings = new GameSettings();

void setup() 
{
  size(256, 256);
  settings.initialize();
  pApplet = this;
  sm.initialize();
  sm.render();
}

void draw() 
{
  sm.render();
}

void mousePressed()
{
  sm.onMousePressed();
}