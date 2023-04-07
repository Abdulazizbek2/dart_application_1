// import 'dart:math';

// class KNNClassifier {
//   int k;
//   List<List<double>>? X;
//   List<String>? y;

//   KNNClassifier(this.k);

//   void fit(List<List<double>> X, List<String> y) {
//     this.X = X;
//     this.y = y;
//   }

//   String predict(List<double> sample) {
//     List<double> distances = [];

//     for (int i = 0; i < X!.length; i++) {
//       double distance = euclideanDistance(X![i], sample);
//       distances.add(distance);
//     }

//     List<int> nearestNeighbors = getIndicesOfSmallest(distances, k);
//     List<String> nearestLabels = [];

//     for (int i = 0; i < nearestNeighbors.length; i++) {
//       int index = nearestNeighbors[i];
//       nearestLabels.add(y![index]);
//     }

//     return mostCommon(nearestLabels);
//   }

//   double euclideanDistance(List<double> a, List<double> b) {
//     double sum = 0;

//     for (int i = 0; i < a.length; i++) {
//       sum += pow(a[i] - b[i], 2);
//     }

//     return sqrt(sum);
//   }

//   List<int> getIndicesOfSmallest(List<double> a, int n) {
//     List<int> indices = List.generate(a.length, (i) => i);
//     indices.sort((i, j) => a[i].compareTo(a[j]));
//     return indices.sublist(0, n);
//   }

//   String? mostCommon(List<String> a) {
//     Map<String, int> counts = {};

//     for (int i = 0; i < a.length; i++) {
//       if (counts.containsKey(a[i])) {
//         counts[a[i]]++;
//       } else {
//         counts[a[i]] = 1;
//       }
//     }

//     String? mostCommonValue;
//     int highestCount = 0;

//     counts.forEach((key, value) {
//       if (value > highestCount) {
//         mostCommonValue = key;
//         highestCount = value;
//       }
//     });

//     return mostCommonValue;
//   }
// }

// // void main() {
// //   List<List<double>> X = [
// //     [1, 2],
// //     [2, 1],
// //     [4, 5],
// //     [5, 4]
// //   ];
// //   List<String> y = ['A', 'A', 'B', 'B'];
// //   KNNClassifier knn = KNNClassifier(3);
// //   knn.fit(X, y);
// //   String prediction = knn.predict([3, 3]);
// //   print(prediction);
// // }