class SaveNotificationModel {
  String matchId;
  String notificationType;
  String teamInQuestion;
  String? notificationId;
  int? numberOfWickets;

  SaveNotificationModel(this.notificationId, this.matchId,
      this.notificationType, this.teamInQuestion, this.numberOfWickets);

  Map<String, dynamic> toJson() {
    return {
      'notificationId': notificationId,
      'matchId': matchId,
      'notificationType': notificationType.replaceAll(' ', ''),
      'teamInQuestion': teamInQuestion,
      'numberOfWickets': numberOfWickets
    };
  }
}
