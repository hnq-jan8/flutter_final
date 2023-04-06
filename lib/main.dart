import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeWidget(),
    );
  }

  List<String> foundValues = [];
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<String> boxes = [
    'box 0',
    'box 1',
    'box 2',
    'box 3',
    'box 4',
    'box 5',
    'box 6',
    'box 7',
    'box 8',
    'box 9',
    'box 10',
    'box 11',
    'box 12',
    'box 13',
    'box 14',
  ];

  List<String> foundBoxes = [];

  @override
  void initState() {
    foundBoxes = boxes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        // title: const Text('Search will be here soon'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) => updateFilter(value),
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: ' Search',
                fillColor: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: foundBoxes.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () => print('Press ${index}'),
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(foundBoxes[index]),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  void updateFilter(String enteredWord) {
    List<String> results = [];
    if (enteredWord.isEmpty) {
      results = boxes;
    } else {
      results = boxes
          .where((box) => box.toLowerCase().contains(enteredWord.toLowerCase()))
          .toList();
    }

    setState(() {
      foundBoxes = results;
    });
  }
}
