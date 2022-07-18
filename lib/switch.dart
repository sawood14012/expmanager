import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expmanager/login.dart';
import 'package:expmanager/home.dart';

class Switcher extends ConsumerStatefulWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  ConsumerState<Switcher> createState() => _SwitcherState();
}

final LoginStateProvider = StateProvider<bool>((ref) {
  return false;
});

class _SwitcherState extends  ConsumerState<Switcher> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final isLoggedin = ref.watch(LoginStateProvider);
    if (!isLoggedin) {
      return const Scaffold(
        body: Login(),
      );
    }
    return const Home();
  }
}
