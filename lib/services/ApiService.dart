import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:expmanager/models/HistoryModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class apiService {
  String endpoint = "http://localhost:3000/data";

  Future<List<HistroyModel>> getHistory() async {
    List<HistroyModel> res = [];
    try {
      var response = await Dio().get(endpoint);
      Iterable l = json.decode(json.encode(response.data));
      print(l);
      res = List<HistroyModel>.from(
          l.map((model) => HistroyModel.fromJson(model)));
      print(res);
      //print(result);
      /* print(result);
      result.map((e) => {
            res.add(HistroyModel(
                e['name'], e['sub'], e['date'], e['price'], e['company']))
          });
      return res; */
    } catch (e) {
      print(e);
    }
    return res;
  }
}

final ApiServiceProvider = Provider<apiService>((ref) => apiService());
