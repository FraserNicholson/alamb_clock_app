import 'package:alamb_clock_app/widgets/filters_modal.dart';
import 'package:alamb_clock_app/widgets/item_details_popup.dart';
import 'package:flutter/material.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

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

  void _showItemDetailsPopup(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ItemDetailsPopup(item: item);
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showItemDetailsPopup(context, items[index]);
            },
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item: ${items[index]}',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Details: This is the details of ${items[index]}.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
