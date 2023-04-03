import 'dart:convert' as asr;
import 'dart:io' as ioo;

class CsvReader {
  static Future<List<Map<String, dynamic>>> readCsvFile(String filePath) async {
    
    final file = ioo.File(filePath);
    final contents = await file.readAsString();
    final lines = asr.LineSplitter().convert(contents);

    final header = lines[0].split(',');
    final List<Map<String, dynamic>> data = [];
    
    for (var i = 1; i < lines.length; i++) {
      final values = lines[i].split(',');
      final item = <String, dynamic>{};

      for (var j = 0; j < values.length; j++) {
        final value = values[j];
        final key = header[j];
        item[key] = value;
      }
      data.add(item);
    }

    return data;
  }

  static Map<String, List<dynamic>> convertlist(List<Map<String, dynamic>> ob) {
    // print(ob);
    List<String?> header = List<String?>.from(ob[0].keys);
    // print(header);
    Map<String, List<dynamic>> mapp = {};
    for (var i = 0; i < header.length; i++) {
      mapp[header[i]!] = [];
      for (var j = 0; j < ob.length; j++) {
        mapp[header[i]!]!.add(ob[j][header[i]]);
      }
    }
    // um.parse(
    // print(mapp);
    return mapp;
  }

  static List<List<num>> todolist(
      List<String?> head, Map<String, List<dynamic>> objectt) {
    List<List<num>> x = [];
    for (var i = 0; i < head.length; i++) {
      List<num> xi = [];
      print(head);
      print(objectt.keys);
      print(objectt);
      print(objectt["sqft_lot15"]);
      for (var j = 0; j < objectt[head[0]]!.length; j++) {
        xi.add(num.parse(objectt[head[i]]![j]));
      }
      x.add(xi);
    }
    return x;
  }
}
