import 'package:alamb_clock_app/models/match_model.dart';
import 'package:alamb_clock_app/widgets/set_notification_popup.dart';
import 'package:flutter/material.dart';

class MatchDetailsPopup extends StatelessWidget {
  final MatchModel match;

  const MatchDetailsPopup({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    match.matchTitle,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NotificationPopup(
                          notificationId: null,
                          matchId: match.id,
                          selectedNotificationType: '',
                          selectedTeam: '',
                          selectedWicketCount: null,
                          teams: [match.team1, match.team2],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text('Match type: ${match.matchType}'),
            const SizedBox(height: 8.0),
            Text('Match start time : ${match.matchStartsAt}')
          ],
        ),
      ),
    );
  }
}
