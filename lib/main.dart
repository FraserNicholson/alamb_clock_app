import 'package:flutter/material.dart';
import 'matches_page.dart'; // Import Page1
import 'notifications_page.dart'; // Import Page2

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
      routes: {
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Expanded(
            flex: 1,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/page1');
                        },
                        child: Icon(
                          Icons.sports_cricket,
                          size: 100.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Matches',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            flex: 1,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/page2');
                        },
                        child: Icon(
                          Icons.notifications,
                          size: 100.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Notifications',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
