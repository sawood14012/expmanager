import 'package:expmanager/providers/dataprovider.dart';
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
    final _data = ref.watch(historyDataProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "History",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 30),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 34,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        _data.when(
          data: (_data) {
            return Column(
              children: [
                ..._data.map(
                  (e) => ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Material(
                          elevation: 5.0,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () => {},
                            child: ListTile(
                              isThreeLine: true,
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                    'assets/images/${getProperImg(e.company)}'),
                              ),
                              title: Text(
                                e.name,
                                style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              trailing: Text(
                                e.price.toString(),
                                style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.sub,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      e.date,
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

  String getProperImg(String? company) {
    if (company == 'Deepcloud') {
      return "deep1.png";
    }
    return "cloudAdda.png";
  }
}
