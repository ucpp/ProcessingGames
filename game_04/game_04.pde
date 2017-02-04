static PApplet pApplet;
static ScenesManager sm;
GameSettings settings = new GameSettings();

void setup() 
{
  size(256, 256);
  settings.initialize();
  pApplet = this;
  sm = new ScenesManager();
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