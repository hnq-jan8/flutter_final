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
  int selectedIndex = 0;

  List screen = [
    [
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
    ],
    [
      'globe 0',
      'globe 1',
      'globe 2',
      'globe 3',
      'globe 4',
      'globe 5',
    ],
    [
      'triangle 0',
      'triangle 1',
      'triangle 2',
      'triangle 3',
      'triangle 4',
    ],
  ];

  List<String> foundValues = [];

  @override
  void initState() {
    foundValues = screen[selectedIndex];
    super.initState();
  }

  void changeScreen(int index) {
    setState(() {
      selectedIndex = index;
      foundValues = screen[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: const Text('Search will be here soon'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: TextField(
                onChanged: (value) => updateFilter(value),
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: '\tSearch',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: foundValues.length,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[800],
              ),
              onPressed: () => debugPrint('Press ${selectedIndex + 1} $index'),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(foundValues[index]),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => changeScreen(index),
          iconSize: 25,
          unselectedItemColor: Colors.grey[500],
          // showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.square_rounded),
              label: 'Square',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle_rounded),
              label: 'Circle',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.signal_cellular_4_bar_rounded),
              label: 'Triangle',
            ),
          ],
        ));
  }

  void updateFilter(String enteredWord) {
    List<String> results = [];
    if (enteredWord.isEmpty) {
      results = screen[selectedIndex];
    } else {
      screen[selectedIndex].forEach((element) {
        if (element.toLowerCase().contains(enteredWord.toLowerCase().trim())) {
          results.add(element);
        }
      });
    }

    setState(() {
      foundValues = results;
    });
  }
}
