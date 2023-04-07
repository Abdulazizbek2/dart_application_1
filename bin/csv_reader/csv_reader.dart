import 'dart:convert' as asr;
import 'dart:io' as ioo;

class Pandas {
 List<Map<String, dynamic>> dataList = [];
  
  Pandas(this.dataList);
  static Future<Pandas> readCsvFile(String filePath ,{List<String>? head}) async {
    
    final file = ioo.File(filePath);
    final contents = await file.readAsString();
    final lines = asr.LineSplitter().convert(contents);

    final header =head??lines[0].split(',');
    
    for (var i = 0; i < header.length; i++) {
      if (header[i].endsWith('"')&&header[i].startsWith('"')) {
         header[i] = header[i].substring(1,header[i].length-1);
      }
    }
    final List<Map<String, dynamic>> data = [];
    
    for (var i = head == null ? 1 : 0; i < lines.length; i++) {
      final values = lines[i].split(',');
      final item = <String, dynamic>{};

      for (var j = 0; j < values.length; j++) {
        final value = values[j];
        final key = header[j];
        item[key] = value;
      }
      data.add(item);
    }

    return Pandas(data);
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
  value(dynamic head,{int? len}) {
     final dataMap = convertlist(dataList);
    if (head is List<String>) {  
    List<List<num>> x = [];
    for (var i = 0; i <  (len ?? dataMap[head[0]]!.length); i++) {
      List<num> xi = [];
      for (var j = 0; j < head.length; j++) {
        xi.add(num.parse(dataMap[head[j]]![i]));
      }
      x.add(xi);
    }
    return x;
  }if (head is String) {
    List<num> x = [];
    for (var i = 0; i <  dataMap[head]!.length; i++) {
        x.add(num.parse(dataMap[head]![i]));
    }
     return x;
   }
   return null;
}}