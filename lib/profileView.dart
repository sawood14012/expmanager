import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final screens = [];
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return const Text("Profile hello");
  }
}
