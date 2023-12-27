import 'package:flutter/material.dart';

class NotificationItemPage extends StatelessWidget {
  final String title;
  final String description;
  final DateTime timestamp;

  NotificationItemPage({
    required this.title,
    required this.description,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(title),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(description),
            SizedBox(height: 20),
            Text(
              'Time:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${timestamp.toLocal()}',
            ),
          ],
        ),
      ),
    );
  }
}
