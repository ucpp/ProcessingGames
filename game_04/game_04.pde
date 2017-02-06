/*
  Игра крестики-нолики
  yaroma.maryan@gmail.com
*/

static PApplet pApplet;
static ScenesManager sm;
GameSettings settings;

void setup() 
{
  size(256, 256);
  pApplet = this;
  settings = new GameSettings();
  settings.initialize();
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