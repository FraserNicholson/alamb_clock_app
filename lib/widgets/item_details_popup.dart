import 'package:alamb_clock_app/widgets/set_notification_popup.dart';
import 'package:flutter/material.dart';

class ItemDetailsPopup extends StatelessWidget {
  final String item;

  const ItemDetailsPopup({super.key, required this.item});

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
                Text(
                  item,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NotificationPopup(
                          selectedNotificationType: '',
                          selectedTeam: '',
                          selectedWicketCount: null,
                          teams: const ['Team1', 'Team2'],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Field 1: Value 1'),
            const SizedBox(height: 8.0),
            const Text('Field 2: Value 2'),
            const SizedBox(height: 8.0),
            const Text('Field 3: Value 3'),
            const SizedBox(height: 8.0),
            const Text('Field 4: Value 4'),
          ],
        ),
      ),
    );
  }
}
