import 'package:alamb_clock_app/models/notification_model.dart';
import 'package:alamb_clock_app/widgets/set_notification_popup.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return GestureDetector(
              onTap: () => _showSetNotificationPopup(context, notification),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                ),
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
                          'Number of wickers: ${notification.numberOfWickets.toString()}',
                          style: const TextStyle(fontSize: 14.0),
                        ))
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              )),
    );
  }

  void _showSetNotificationPopup(
      BuildContext context, NotificationModel notification) {
    List<String> teams = [notification.team1, notification.team2];

    showDialog(
      context: context,
      builder: (context) => NotificationPopup(
        notificationId: notification.id,
        selectedNotificationType: notification.notificationType,
        selectedTeam: notification.teamInQuestion,
        selectedWicketCount: notification.numberOfWickets,
        teams: teams,
      ),
    );
  }
}

final List<NotificationModel> notifications = [
  NotificationModel('notification-1', 'Wicket Count', 'Team1', 'Team1', 'Team2',
      2, DateTime.now()),
  NotificationModel('notification-2', 'Innings Started', 'Team1', 'Team1',
      'Team2', null, DateTime.now()),
  NotificationModel('notification-3', 'Wicket Count', 'Team1', 'Team1', 'Team2',
      5, DateTime.now()),
];
