import 'package:alamb_clock_app/clients/api_client.dart';
import 'package:alamb_clock_app/models/notification_model.dart';
import 'package:alamb_clock_app/widgets/set_notification_popup.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    notificationsList = getNotifications();
  }

  late Future<List<NotificationModel>> notificationsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: FutureBuilder<List<NotificationModel>>(
        future: notificationsList,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!.isNotEmpty
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final notification = snapshot.data![index];
                      return GestureDetector(
                        onTap: () =>
                            _showSetNotificationPopup(context, notification),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.matchTitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Match start time: ${notification.matchStartsAt}',
                                style: const TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                'Notification type: ${notification.notificationType}',
                                style: const TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                'Team in question: ${notification.teamInQuestion}',
                                style: const TextStyle(fontSize: 14.0),
                              ),
                              Visibility(
                                  visible: notification.numberOfWickets != null,
                                  child: Text(
                                    'Number of wickets: ${notification.numberOfWickets.toString()}',
                                    style: const TextStyle(fontSize: 14.0),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No notifications found',
                      style: TextStyle(fontSize: 25),
                    ),
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _showSetNotificationPopup(
      BuildContext context, NotificationModel notification) {
    List<String> teams = [notification.team1, notification.team2];

    showDialog(
      context: context,
      builder: (context) => NotificationPopup(
        notificationId: notification.id,
        matchId: notification.matchId,
        selectedNotificationType: notification.notificationType,
        selectedTeam: notification.teamInQuestion,
        selectedWicketCount: notification.numberOfWickets,
        teams: teams,
      ),
    ).then((value) => setState(() {
          notificationsList = getNotifications();
        }));
  }
}
