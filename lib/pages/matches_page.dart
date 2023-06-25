import 'package:alamb_clock_app/clients/api_client.dart';
import 'package:alamb_clock_app/models/match_model.dart';
import 'package:alamb_clock_app/models/matches_response.dart';
import 'package:alamb_clock_app/widgets/filters_modal.dart';
import 'package:alamb_clock_app/widgets/match_details_popup.dart';
import 'package:flutter/material.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  void initState() {
    super.initState();
    matchesResponse = getMatches();
  }

  late Future<MatchesResponse> matchesResponse;

  List<String> selectedGenderFilters = [];
  List<String> selectedLevelFilters = [];
  List<String> selectedFormatFilters = [];

  void _showFiltersModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const MatchesFiltersModal();
      },
    );
  }

  void _showItemDetailsPopup(BuildContext context, MatchModel match) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MatchDetailsPopup(match: match);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFiltersModal(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<MatchesResponse>(
        future: matchesResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.matchesCount,
              itemBuilder: (BuildContext context, int index) {
                final match = snapshot.data!.matches[index];
                return GestureDetector(
                  onTap: () {
                    _showItemDetailsPopup(context, match);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          match.matchTitle,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Match type: ${match.matchType}.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Match start time : ${match.matchStartsAt}.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
