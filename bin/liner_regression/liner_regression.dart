class LinearRegression {
  List<double>? X;
  List<double>? y;
  double? slope;
  double? intercept;

  LinearRegression();

  void fit(List<double> X, List<double> y) {
    this.X = X;
    this.y = y;
    double n = X.length.toDouble();
    double sumX = X.fold(0, (prev, curr) => prev + curr);
    double sumY = y.fold(0, (prev, curr) => prev + curr);
    double sumXY = 0.0;
    double sumX2 = 0.0;

    for (int i = 0; i < n; i++) {
      sumXY += X[i] * y[i];
      sumX2 += X[i] * X[i];
    }

    slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX);
    intercept = (sumY - slope! * sumX) / n;
  }

  double predict(double x) {
    return slope! * x + intercept!;
  }
}

