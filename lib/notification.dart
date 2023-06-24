class NotificationModel {
  late String matchTitle;
  String notificationType;
  String teamInQuestion;
  String team1;
  String team2;
  int? numberOfWickets;

  NotificationModel(this.notificationType, this.teamInQuestion, this.team1,
      this.team2, this.numberOfWickets) {
    matchTitle = "$team1 vs $team2";
  }
}
