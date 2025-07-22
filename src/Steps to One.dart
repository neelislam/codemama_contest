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