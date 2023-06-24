import 'package:alamb_clock_app/set_notification_popup.dart';
import 'package:flutter/material.dart';

class ItemDetailsPopup extends StatelessWidget {
  final String item;

  ItemDetailsPopup({required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NotificationPopup(
                          selectedNotificationType: '',
                          selectedTeam: '',
                          selectedWicketCount: null,
                          teams: [],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Field 1: Value 1'),
            SizedBox(height: 8.0),
            Text('Field 2: Value 2'),
            SizedBox(height: 8.0),
            Text('Field 3: Value 3'),
            SizedBox(height: 8.0),
            Text('Field 4: Value 4'),
          ],
        ),
      ),
    );
  }
}
