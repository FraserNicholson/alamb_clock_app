import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final List<String> items = ['Item A', 'Item B', 'Item C', 'Item D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              // Perform actions when item is tapped
              print('Selected: ${items[index]}');
            },
          );
        },
      ),
    );
  }
}
