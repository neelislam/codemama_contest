import 'dart:io';
import 'dart:math';

void main() {
  List<int> firstLine = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int N = firstLine[0];
  int W = firstLine[1];
  List<int> weights = [];
  List<int> values = [];


  for (int i = 0; i < N; i++) {
    List<int> itemLine = stdin.readLineSync()!.split(' ').map(int.parse).toList();
    weights.add(itemLine[0]);
    values.add(itemLine[1]);
  }

  List<List<int>> dp = List.generate(2, (_) => List.filled(W + 1, 0));

  for (int i = 0; i < N; i++) {
    int currentWeight = weights[i];
    int currentValue = values[i];
    int currentRow = (i + 1) % 2;
    int prevRow = i % 2;

    for (int j = 0; j <= W; j++) {
      dp[currentRow][j] = dp[prevRow][j];
      if (j >= currentWeight) {
        dp[currentRow][j] = max(dp[currentRow][j], dp[prevRow][j - currentWeight] + currentValue);
      }
    }
  }
  print(dp[N % 2][W]);
}






/*
Knapsack 1

EN
বাং
Problem Statement
You are given N items. Every item has a weight and a value. You are also given an integer W. You have to choose some items from the given items so that their total weights do not exceed W and the sum of their values is maximum.

Input
The input consists of N+1 lines. First one having two integers N and W. Then the next N lines will have two integers
the weight and value of the ith item .

Output
Print one integer, maximum value you can get.
Example 1:
Input:
6 15
6 5
5 6
6 4
6 6
3 5
7 2
Output:
17
Example 2:
Input:
3 9
6 15
5 8
4 8
Output:
16 */
