static class ResourceLoader
{
  private static ResourceLoader instance = null;
  public static ResourceLoader getInstance()
  {
    if(instance == null)
      instance = new ResourceLoader();
    return instance;
  }
  
  static String url = "res/";
  
  public PImage GetImage(String name)
  {
    return pApplet.loadImage(url + name + ".png");
  }
}