import 'package:flutter/material.dart';
import 'notification.dart';
import 'set_notification_popup.dart';

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
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () => _showSetNotificationPopup(context, item),
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
                      item.matchTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Notification type: ${item.notificationType}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Team in question: ${item.teamInQuestion}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Visibility(
                        visible: item.numberOfWickets != null,
                        child: Text(
                          'Number of wickers: ${item.numberOfWickets.toString()}',
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

  void _showSetNotificationPopup(BuildContext context, NotificationModel item) {
    List<String> teams = [item.team1, item.team2];
    print(item.numberOfWickets);

    showDialog(
      context: context,
      builder: (context) => NotificationPopup(
        selectedNotificationType: item.notificationType,
        selectedTeam: item.teamInQuestion,
        selectedWicketCount: item.numberOfWickets,
        teams: teams,
      ),
    );
  }
}

final List<NotificationModel> items = [
  NotificationModel('Wicket Count', 'Team1', 'Team1', 'Team2', 2),
  NotificationModel('Innings Started', 'Team1', 'Team1', 'Team2', null),
  NotificationModel('Wicket Count', 'Team1', 'Team1', 'Team2', 5),
];
