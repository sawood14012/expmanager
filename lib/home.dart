import 'package:expmanager/historyView.dart';
import 'package:expmanager/primaryView.dart';
import 'package:expmanager/profileView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

final RouteStateProvider = StateProvider<int>((ref) {
  return 0;
});

class _HomeState extends ConsumerState<Home> {
  final screens = [
    const Primary(),
    const History(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    final routeIndex = ref.watch(RouteStateProvider);
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, 
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: ()=>{}, icon: const Icon(Icons.notifications_none_outlined, color: Colors.black, size: 34,))
        ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: routeIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedIconTheme: const IconThemeData(size: 34),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home', ),
          BottomNavigationBarItem(icon: Icon(Icons.history_outlined), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Profile'),
        ],
        onTap: (int? i) {
          ref.read(RouteStateProvider.state).state = i!;
        },
      ),
      body: Center(
        child: screens[routeIndex]
      ),
    );
  }
}
