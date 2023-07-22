class MatchModel {
  String id;
  late String matchType;
  late DateTime matchStartsAt;
  String team1;
  String team2;
  late String matchTitle;

  MatchModel(this.id, this.team1, this.team2, String matchTypeFromJson,
      String unformattedDate) {
    matchStartsAt = DateTime.parse(unformattedDate);
    matchType = matchTypeFromJson.isNotEmpty
        ? matchTypeFromJson[0].toUpperCase() + matchTypeFromJson.substring(1)
        : '';
    matchTitle = "$team1 vs $team2";
  }

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(json['id'], json['team1'], json['team2'],
        json['matchType'], json['dateTimeGmt']);
  }
}
