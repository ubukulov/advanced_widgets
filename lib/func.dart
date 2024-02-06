import 'dart:math';

double calculateOpacity(double x) {
  if (x < 0.7) {
    return 0.0;
  } else {
    double a = 1.428571;
    double b = -1.0;
    return min(max(a * x + b, 0.0), 1.0);
  }
}