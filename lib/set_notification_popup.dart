import 'package:flutter/material.dart';

class NotificationPopup extends StatelessWidget {
  final String item;

  NotificationPopup({required this.item});

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
            Text(
              'New notification',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Match: $item',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text('Notification type'),
            DropdownButton<String>(
              value: null,
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: <String>[
                'Innings started',
                'Wicket count',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text('Team in question'),
            DropdownButton<String>(
              value: null,
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: <String>[
                'Team A',
                'Team B',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text('Wicket count'),
            DropdownButton<int>(
              value: null,
              onChanged: (int? newValue) {
                // Handle dropdown value change
              },
              items: List<DropdownMenuItem<int>>.generate(10, (int index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text((index + 1).toString()),
                );
              }),
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Save button logic
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  primary: Colors.green,
                ),
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
