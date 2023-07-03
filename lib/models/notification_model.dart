class NotificationModel {
  String id;
  String matchId;
  late String matchTitle;
  String notificationType;
  String teamInQuestion;
  String team1;
  String team2;
  late DateTime matchStartsAt;
  int? numberOfWickets;

  NotificationModel(
      this.id,
      this.matchId,
      this.notificationType,
      this.teamInQuestion,
      this.team1,
      this.team2,
      this.numberOfWickets,
      String unformattedDate) {
    matchTitle = "$team1 vs $team2";
    matchStartsAt = DateTime.parse(unformattedDate);
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        json['id'],
        json['matchId'],
        json['notificationType'],
        json['teamInQuestion'],
        json['team1'],
        json['team2'],
        json['numberOfWickets'],
        json['matchStartsAt']);
  }
}
