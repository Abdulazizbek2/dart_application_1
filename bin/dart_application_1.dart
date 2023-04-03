import 'csv_reader/csv_reader.dart';
import 'knn_reg2/knn2.dart';

void main(List<String> args) async {
  final df = await Pandas.readCsvFile("bin/wine.csv",head: ["class", "Alcohol","Malic acid","Ash","Alcalinity of ash","Magnesium","Total phenols","flavanoids","Nonflavanoid phenols", "Proanthocyanins","Color intensity","Hue","OD280/OD315 of diluted wines","Proline"]);
// print(objec["sqft_lot15"]);
// print(objec["sqft_living15"]);

  List<List<num>> x = df.value(List<String>.from(["Alcohol", "Ash"]));
  print(x);
  List<num>? y = df.value("class");
  print(y);
  KnnRegretion2 clf = KnnRegretion2(k: 1);
  // [[1,2,21,212],[1,121,2,12,12]];
  print(df.dataList);
  clf.fit(x, y!);
  print(clf.predict_y([4, 5]));
  clf.k = 2;
  print(clf.predict_y([4, 5]));
  clf.k = 3;
  print(clf.predict_y([4, 5]));
  clf.k = 4;
  print(clf.predict_y([4, 5]));
  clf.k = 5;
  print(clf.predict_y([4, 5]));

  // y = [4, 4, 3, 3, 3];

  clf.fit(x, y);
  print(clf.predict_y([11.5,2.8]));
  clf.k = 2;
  print(clf.predict_y([11.5,2.8]));
  clf.k = 3;
  print(clf.predict_y([11.5,2.8]));
  clf.k = 4;
  print(clf.predict_y([11.5,2.8]));
  clf.k = 5;
  print(clf.predict_y([11.5,2.8]));
}
