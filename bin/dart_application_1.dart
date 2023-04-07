import 'csv_reader/csv_reader.dart';
import 'knn_classification/knn_classification.dart';
import 'knn_reg/knn.dart';
import 'liner_regression/liner_regression.dart';

void main(List<String> args) async {
  List<double> X = [1, 2, 3, 4, 5];
  List<double> y = [2, 4, 5, 4, 5];
  LinearRegression lr = LinearRegression();
  lr.fit(X, y);
  double prediction = lr.predict(6);
  print(prediction);
//   final df = await Pandas.readCsvFile("bin/wine.csv",head:["class", "Alcohol","Malic acid","Ash","Alcalinity of ash","Magnesium","Total phenols","flavanoids","Nonflavanoid phenols", "Proanthocyanins","Color intensity","Hue","OD280/OD315 of diluted wines","Proline"]);
// // print(objec["sqft_living15"]);
// // ["class", "Alcohol","Malic acid","Ash","Alcalinity of ash","Magnesium","Total phenols","flavanoids","Nonflavanoid phenols", "Proanthocyanins","Color intensity","Hue","OD280/OD315 of diluted wines","Proline"]);
// // print(objec["sqft_lot15"]);
// // print(df.dataList);
//   // List<List<num>> x = df.value(["Alcohol","Ash"]);
//   // // print(x);
//   // List<num>? y = df.value("class");
//   // print(y);
//   List<List<num>> x = df.value(["Alcohol","Ash"]);
//   List<num>? y = df.value("class");
   
//   KnnClassification clf = KnnClassification(k: 3);
//   // [[1,2,21,212],[1,121,2,12,12]];
//   // print(df.dataList);
//   clf.fit(x, y!);
//   print(clf.predict_y([[11.5,2.8],[13.25,2]]));
//   // print([[11.5,2.8],[13.25,2]].runtimeType);
//   clf.k = 2;


//  List<List<num>> x = df.value(["x","y"]);
//   List<num>? y = df.value("class");
   
//   KnnClassification clf = KnnClassification(k: 3);
//   clf.fit(x, y!);
//   print(clf.predict_y([[2,5],[3,5],[6,5],[2,2]]));
//   // print([[11.5,2.8],[13.25,2]].runtimeType);
//   clf.k = 2;


  // print(clf.predict_y([4, 5]));
  // clf.k = 3;
  // print(clf.predict_y([4, 5]));
  // clf.k = 4;
  // print(clf.predict_y([4, 5]));
  // clf.k = 5;
  // print(clf.predict_y([4, 5]));

  // y = [4, 4, 3, 3, 3];

  // clf.fit(x, y);
  // print(clf.predict_y([11.5,2.8]));
  // clf.k = 2;
  // print(clf.predict_y([11.5,2.8]));
  // clf.k = 3;
  // print(clf.predict_y([11.5,2.8]));
  // clf.k = 4;
  // print(clf.predict_y([11.5,2.8]));
  // clf.k = 5;
  // print(clf.predict_y([11.5,2.8]));
}
