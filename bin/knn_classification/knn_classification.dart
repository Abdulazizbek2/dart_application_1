import 'dart:math';

import '../data_sets/data_set1.dart';

class KnnClassification {
  int k;
  DataSet? data;
  KnnClassification({this.k = 3});
  void fit(var x, List<dynamic> y) {
    data = DataSet(x, y);
  }
  
  predict_y(var x) {
    if (x is num && data?.x is List<num>) {
      List y = _predict(x);
      return mapClpred(y.sublist(0,k));
    } else if (x is List<num> && data?.x is List<List<num>>) {
      List y = _predictList(x);
      return mapClpred(y.sublist(0,k));
    } else if (x is List<num> && data?.x is List<num>) {
      List sum_list = [];
      for (var j = 0; j < x.length; j++) {
        List y = _predict(x[j]);
        sum_list.add(mapClpred(y.sublist(0,k)));
      }
      return sum_list;
    } else if (x is List<List<num>> && data?.x is List<List<num>>) {
      List sum_list = [];
      print("ishladi");
      for (var j = 0; j < x.length; j++) {
        List y = _predictList(x[j]);
        sum_list.add(mapClpred(y.sublist(0,k)));
      }
      return sum_list;
    } else {
      print("Type x does not match the previous");
    }
  }

  List _predictList(List<num> x) {
    int len = data!.x.length;
    List<num> y_ = [...data!.y];
    // List<double> y_ = [];
    // y_.addAll(data!.y);

    List x_dis = [];
    for (int i = 0; i < len; i++) {
      x_dis.add(distance(x, data!.x[i] as List<num>));
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
    return y_;
  }

  List _predict(num x) {
    int len = data!.x.length;
    List<num> y_ = [...data!.y];
    List x_dis = [];
    for (int i = 0; i < len; i++) {
      x_dis.add(distance([x], [data!.x[i]]));
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
    return y_;
  }
  
  mapClpred(List y_list){
    Map elMap = {};
    for (var element in y_list) {
      if (elMap.containsKey(element)) {
        elMap[element]++;
      }else{
        elMap[element] = 1;
      }
    }
    dynamic maxKey = y_list[0];
    int maxvalue = elMap[maxKey];
    elMap.forEach((key, value) {
     if (maxvalue<value) {
       maxKey = key;
       maxvalue = value;
     }});
     return maxKey;
  }

  num distance(List<num> x1, List<num> x2) {
    num sum = 0;
    for (int i = 0; i < x1.length; i++) {
      sum += pow(x1[i] - x2[i], 2);
    }
    return (sqrt(sum));
  }
}

