import 'package:alamb_clock_app/models/match_model.dart';

class MatchesResponse {
  int matchesCount;
  int currentPageCount;
  late List<MatchModel> matches;

  MatchesResponse(
      this.matchesCount, this.currentPageCount, List<dynamic> matchesJsonList) {
    matches = matchesJsonList.map((m) => MatchModel.fromJson(m)).toList();
  }

  factory MatchesResponse.fromJson(Map<String, dynamic> json) {
    return MatchesResponse(
        json['count'], json['currentPageCount'], json['matches']);
  }
}
