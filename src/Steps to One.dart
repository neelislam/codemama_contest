import 'dart:io';
import 'dart:math';
void main() {
  int N = int.parse(stdin.readLineSync()!);

  if (N <= 1) {
    print(0);
    return;
  }
  List<int> dp = List.filled(N + 1, 0);
  dp[1] = 0;
  for (int i = 2; i <= N; i++) {
    int steps = dp[i - 1] + 1;

    if (i % 2 == 0) {

      steps = min(steps, dp[i ~/ 2] + 1);
    }
    if (i % 3 == 0) {

      steps = min(steps, dp[i ~/ 3] + 1);
    }
    dp[i] = steps;
  }
  print(dp[N]);
}

/*Steps to One

EN
বাং
Problem Statement
Given a positive integer n, write a program that returns the minimum number of steps to reach 1 by performing one of the following operations: Subtract 1 from it. If it is divisible by 2, divide it by 2. If it is divisible by 3, divide it by 3. For example- from 5 , subtracting 1 it will be 4, then it will be divided by 2 and become 2 then again it will be divided by 2 and become 1. Total 3 steps will be needed.

Input
The program will take an integer
N
N as input.

Output
The output will print the number of steps to become 1.

Constraints
0 ≤ |N| ≤ 1000
Example:
Enter number

Input:
5
Output:
3*/