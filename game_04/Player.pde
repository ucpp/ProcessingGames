class Player
{
  private int[][] winStrategy = {{1,2,3}, {4,5,6}, {7,8,9}, // horizontal lines
                                 {1,4,7}, {2,5,8}, {3,6,9}, // vertical lines
                                 {1,5,9}, {3,5,7}}; // diagonals
  private IntList steps = new IntList();
  
  boolean move(int num)
  {
    if(!steps.hasValue(num))
    {
      steps.append(num);
      steps.sort();
      return true;
    }   
    return false;
  }
  
  int checkWin()
  {
    if(steps.size() >= 3)
    {
       for(int i = 0; i < winStrategy.length; i++)
       { 
         for(int j = 0; j < winStrategy[i].length; j++)
         {
           if(!steps.hasValue(winStrategy[i][j]))
             break;
           else if(j == winStrategy[i].length-1)
             return i;
         }
       }
    }
    return -1;
  }
}