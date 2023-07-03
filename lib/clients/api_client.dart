import 'dart:convert';
import 'package:alamb_clock_app/models/notification_model.dart';
import 'package:alamb_clock_app/models/save_notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import 'package:alamb_clock_app/models/matches_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<MatchesResponse> getMatches() async {
  var apiUrl = dotenv.env['API_URL'];
  var matchesEndpointUrl = Uri.parse('$apiUrl/matches/query-matches');

  Map data = {
    'matchType': 'test',
    'pageNumber': 1,
    'teamSearchTerm': 'england'
  };
  var body = json.encode(data);

  var apiKey = dotenv.env['API_KEY']!;

  final response = await http.post(matchesEndpointUrl,
      headers: {'Content-Type': 'application/json', 'X-ALamb-Api-Key': apiKey},
      body: body);

  if (response.statusCode == 200) {
    return MatchesResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading matches");
  }
}

Future<List<NotificationModel>> getNotifications() async {
  var apiUrl = dotenv.env['API_URL'];
  var registrationToken = await FirebaseMessaging.instance.getToken();

  var getNotificationsEndpointUrl = Uri.parse('$apiUrl/matches/notifications');

  var apiKey = dotenv.env['API_KEY']!;

  final response = await http.get(getNotificationsEndpointUrl, headers: {
    'Content-Type': 'application/json',
    'X-ALamb-Api-Key': apiKey,
    'registrationToken': registrationToken!
  });

  if (response.statusCode == 200) {
    Iterable jsonList = jsonDecode(response.body);
    var notifications = List<NotificationModel>.from(
        jsonList.map((x) => NotificationModel.fromJson(x)));
    return notifications;
  } else {
    throw Exception("Error loading notifications");
  }
}

Future<bool> saveNotification(SaveNotificationModel notification) async {
  var body = json.encode(notification);

  var apiUrl = dotenv.env['API_URL'];
  var registrationToken = await FirebaseMessaging.instance.getToken();

  var saveNotificationEndpointUrl = Uri.parse('$apiUrl/matches/notification');

  var apiKey = dotenv.env['API_KEY']!;

  final response = await http.post(saveNotificationEndpointUrl,
      headers: {
        'Content-Type': 'application/json',
        'X-ALamb-Api-Key': apiKey,
        'registrationToken': registrationToken!,
      },
      body: body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}
