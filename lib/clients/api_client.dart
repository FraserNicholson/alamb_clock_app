import 'dart:convert';
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
