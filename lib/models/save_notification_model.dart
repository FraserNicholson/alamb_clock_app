class SaveNotificationModel {
  String matchId;
  String notificationType;
  String teamInQuestion;
  int? numberOfWickets;

  SaveNotificationModel(this.matchId, this.notificationType,
      this.teamInQuestion, this.numberOfWickets);

  Map<String, dynamic> toJson() {
    return {
      'matchId': matchId,
      'notificationType': notificationType.replaceAll(' ', ''),
      'teamInQuestion': teamInQuestion,
      'numberOfWickets': numberOfWickets
    };
  }
}
