class run {
  float millisStart = millis();
  
  int size;
  
  int counter = 0;
  int counterSaved = 0;
  
  boolean optimized;
  
  int[][] cost;
  int[][] savedCost;

  run(int initSize, boolean initOptimized) {
    size = initSize;
    optimized = initOptimized;
    
    savedCost = new int[size][size];
    cost = generateCostMatrix(size);
    
    printFormatedMatrix(cost);
    
    println ("Günstigster Weg: " + minCost(size-1, size-1));
    println("Aufrufe der Rekursion: " + counter, "von denen ", counterSaved, "schon gespeichert waren");
    println("Laufdauer: " + (millis() - millisStart)/1000, "s");
  }
  
  int minCost(int m, int n) {
    counter++;
    
    if(savedCost[m][n] != 0 && optimized) {
      counterSaved++;
      return savedCost[m][n];
    }
    
    int nextMinCost = 0;
    
    if(n > 0 && m > 0) {
      nextMinCost = min(minCost(m-1,n), minCost(m,n-1));
    } else if(n > 0) {
      nextMinCost = minCost(m,n-1);
    } else if(m > 0) {
      nextMinCost = minCost(m-1,n);
    } else {
      savedCost[m][n] = cost[m][n];
      return cost[m][n];
    }
    int returnNow = cost[m][n] + nextMinCost;
    savedCost[m][n] = returnNow;
    return returnNow;
  }
}
