
import 'package:expmanager/services/ApiService.dart';
import 'package:expmanager/historyView.dart';
import 'package:expmanager/models/HistoryModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyDataProvider = FutureProvider<List<HistroyModel>>((ref) async {
  return ref.read(ApiServiceProvider).getHistory();
});