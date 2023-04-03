import '../data_sets/data_set1.dart';

class KnnRegretion {
  int k;
  DataSet? data;
  KnnRegretion({this.k = 3});
  void fit(List<double> x, List<double> y) {
    data = DataSet(x, y);
  }

  double predict_y(double x) {
    List y = _predict(x);
    double sum = 0;
    for (int i = 0; i < k; i++) {
      sum += y[i];
    }
    return (sum / k);
  }

  List _predict(double x) {
    int len = data!.x.length;
    List<double> y_ = [...data!.y];
    // List<double> y_ = [];
    // y_.addAll(data!.y);

    List x_dis = [];
    for (int i = 0; i < len; i++) {
      x_dis.add(distance(x, data!.x[i]));
    }
    for (int i = 0; i < len - 1; i++) {
      for (int j = 0; j < len - i - 1; j++) {
        if (x_dis[j] > x_dis[j + 1]) {
          var tempVar1 = y_[j];
          y_[j] = y_[j + 1];
          y_[j + 1] = tempVar1;
          var tempVar2 = x_dis[j];
          x_dis[j] = x_dis[j + 1];
          x_dis[j + 1] = tempVar2;
        }
      }
    }
    // print("dis: ");
    // print(x_dis);
    // print("\n y_; ");
    // print(y_);
    // print("");
    return y_;
  }

  double distance(double x1, double x2) {
    // double sum = 0;
    // for (int i = 0; i < x1.length; i++) {
    //   sum += pow(x1[i] - x2[i], 2);
    // }
    // return (sqrt(sum));
    return (x1 - x2).abs();
  }
}