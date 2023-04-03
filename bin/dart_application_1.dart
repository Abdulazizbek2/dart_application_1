import 'csv_reader/csv_reader.dart';
import 'knn_reg2/knn2.dart';

void main(List<String> args) async {
  final objec =
      CsvReader.convertlist(await CsvReader.readCsvFile("bin/kc_house.csv"));
  // print(objec);
  List<List<num>> x = CsvReader.todolist(
      List<String>.from(["sqft_lot15", "sqft_living15"]), objec);
  print(x);
  List<num> y = CsvReader.todolist(["bedrooms"], objec)[0];
  print(y);
  KnnRegretion2 clf = KnnRegretion2(k: 1);

  print(objec);
  // clf.fit(x, y);
  // print(clf.predict_y([4, 5]));
  // clf.k = 2;
  // print(clf.predict_y([4, 5]));
  // clf.k = 3;
  // print(clf.predict_y([4, 5]));
  // clf.k = 4;
  // print(clf.predict_y([4, 5]));
  // clf.k = 5;
  // print(clf.predict_y([4, 5]));

  // y = [4, 4, 3, 3, 3];

  // clf.fit(x, y);
  // print(clf.predict_y([4, 5]));
  // clf.k = 2;
  // print(clf.predict_y([4, 5]));
  // clf.k = 3;
  // print(clf.predict_y([4, 5]));
  // clf.k = 4;
  // print(clf.predict_y([4, 5]));
  // clf.k = 5;
  // print(clf.predict_y([4, 5]));
}
