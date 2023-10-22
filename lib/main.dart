import 'package:alamb_clock_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import 'pages/matches_page.dart';
import 'pages/notifications_page.dart';

void main() async {
  await dotenv.load(fileName: "lib/.env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primaryColor: Colors.white),
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
              child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/matches')},
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sports_cricket,
                            size: 100.0,
                            color: Colors.white,
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
                  )),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/notifications')},
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 100.0,
                            color: Colors.white,
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
                  )),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
