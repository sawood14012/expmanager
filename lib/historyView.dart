import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class History extends ConsumerStatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<History> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  final screens = [];
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return const Text("history hello");
  }
}
