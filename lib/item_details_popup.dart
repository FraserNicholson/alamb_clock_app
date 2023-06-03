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
                        return NotificationModal(item: item);
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

class NotificationModal extends StatelessWidget {
  final String item;

  NotificationModal({required this.item});

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
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text('Match: $item'),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: 'Innings started',
              onChanged: (value) {},
              items: [
                DropdownMenuItem(
                  value: 'Innings started',
                  child: Text('Innings started'),
                ),
                DropdownMenuItem(
                  value: 'Wicket count',
                  child: Text('Wicket count'),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: 'Team A',
              onChanged: (value) {},
              items: [
                DropdownMenuItem(
                  value: 'Team A',
                  child: Text('Team A'),
                ),
                DropdownMenuItem(
                  value: 'Team B',
                  child: Text('Team B'),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            DropdownButton<int>(
              value: 1,
              onChanged: (value) {},
              items: List.generate(10, (index) {
                return DropdownMenuItem(
                  value: index + 1,
                  child: Text((index + 1).toString()),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
