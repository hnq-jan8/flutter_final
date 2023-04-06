import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<String> values = <String>[
    'value 0',
    'value 1',
    'value 2',
    'value 3',
    'value 4',
    'value 5',
    'value 6',
    'value 7',
    'value 8',
    'value 9',
    'value 10',
    'value 11',
    'value 12',
    'value 13',
    'value 14',
  ];
  // List<int> colorCodes = <int>[300, 200, 100];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          // title: const Text('Search will be here soon'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(26),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search',
                  // fillColor: Colors.black,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: values.length,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              onPressed: () => print('Press ${index}'),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(values[index]),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
