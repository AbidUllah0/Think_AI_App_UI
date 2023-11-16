import 'package:flutter/material.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  int _currentIndex = 0;

  // Define your pages/screens here
  final List<Widget> _pages = [
    // Replace these with your actual screens
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: TabBar(
        controller: controller,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.blue,
        onTap: (index) {},
        tabs: [
          Tab(icon: Icon(Icons.menu_rounded)),
          Tab(icon: Icon(Icons.piano)),
          Tab(icon: Icon(Icons.car_rental_rounded)),
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.settings_rounded)),
        ],
      ),
    );
  }
}
