import 'package:intl/intl.dart';

class NotificationModel {
  String id;
  late String matchTitle;
  String notificationType;
  String teamInQuestion;
  String team1;
  String team2;
  late String matchStartsAt;
  int? numberOfWickets;

  NotificationModel(this.id, this.notificationType, this.teamInQuestion,
      this.team1, this.team2, this.numberOfWickets, DateTime unformattedDate) {
    matchTitle = "$team1 vs $team2";
    matchStartsAt =
        '${DateFormat('yyyy-mm-dd - kk:mm').format(unformattedDate)} GMT';
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        json['id'],
        json['notificationType'],
        json['teamInQuestion'],
        json['team1'],
        json['team2'],
        json['numberOfWickets'],
        json['matchStartsAt']);
  }
}
