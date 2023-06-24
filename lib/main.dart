import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'matches_page.dart';
import 'notifications_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
      routes: {
        '/matches': (context) => const MatchesPage(),
        '/notifications': (context) => const NotificationsPage(),
      },
    ));
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALamb Clock'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
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
                          Navigator.pushNamed(context, '/matches');
                        },
                        child: const Icon(
                          Icons.sports_cricket,
                          size: 100.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
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
          const SizedBox(height: 20.0),
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
                          Navigator.pushNamed(context, '/notifications');
                        },
                        child: const Icon(
                          Icons.notifications,
                          size: 100.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
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
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
