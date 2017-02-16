//алгоритм взял здесь http://grafika.me/node/31

int i = 0;

void setup()
{
  size(300, 200);
  frameRate(10);
}

void draw()
{
    i += 3;
    background(0);
    drawFractal(300, 200, i%60);
}

//функция зарисовки фрактала
public void drawFractal(int w, int h, int countIteration) 
{
  // при каждой итерации, вычисляется znew = zold² + С
  // вещественная  и мнимая части постоянной C
  double cRe, cIm;
  // вещественная и мнимая части старой и новой
  double newRe, newIm, oldRe, oldIm;
  // Можно увеличивать и изменять положение
  double zoom = 1, moveX = 0, moveY = 0;
  //Определяем после какого числа итераций функция должна прекратить свою работу
  int maxIterations = countIteration;
 
  //выбираем несколько значений константы С, это определяет форму фрактала Жюлиа
  cRe = -0.70176;
  cIm = -0.3842;
 
  //"перебираем" каждый пиксель
  for (int x = 0; x < w; x++)
  {
    for (int y = 0; y < h; y++)
    {
      //вычисляется реальная и мнимая части числа z
      //на основе расположения пикселей,масштабирования и значения позиции
      newRe = 1.5 * (x - w / 2) / (0.5 * zoom * w) + moveX;
      newIm = (y - h / 2) / (0.5 * zoom * h) + moveY;
      //i представляет собой число итераций 
      int i;
      //начинается процесс итерации
      for (i = 0; i < maxIterations; i++)
      {
        //Запоминаем значение предыдущей итерации
        oldRe = newRe;
        oldIm = newIm;
        // в текущей итерации вычисляются действительная и мнимая части 
        newRe = oldRe * oldRe - oldIm * oldIm + cRe;
        newIm = 2 * oldRe * oldIm + cIm;
        // если точка находится вне круга с радиусом 2 - прерываемся
        if ((newRe * newRe + newIm * newIm) > 4) break;
      }
      //определяем цвета
      stroke(255, (i * 9) % 255, 0, (i * 9) % 255);
      //рисуем пиксель
      point(x, y);
   }
  }
}