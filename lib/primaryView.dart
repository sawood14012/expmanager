import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Primary extends ConsumerStatefulWidget {
  const Primary({Key? key}) : super(key: key);

  @override
  ConsumerState<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends ConsumerState<Primary> {
  final screens = [];
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return const Text("primary hello");
  }
}
