import 'package:alamb_clock_app/widgets/filter_chip.dart';
import 'package:flutter/material.dart';

typedef StringCallback = void Function(String string);

class MatchesFiltersModal extends StatefulWidget {
  final StringCallback onFormatFilterChanged;

  const MatchesFiltersModal({super.key, required this.onFormatFilterChanged});

  @override
  State<MatchesFiltersModal> createState() => _MatchesFiltersModalState();
}

class _MatchesFiltersModalState extends State<MatchesFiltersModal> {
  List<String> selectedGenderFilters = [];

  List<String> selectedLevelFilters = [];

  String selectedFormatFilter = '';

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        void selectFilter(String filter, String selectedFilter,
            Function(String) onSelectionChanged) {
          setState(() {
            if (filter == selectedFilter) {
              selectedFilter = '';
            } else {
              selectedFilter = filter;
            }
          });

          onSelectionChanged(selectedFilter);
        }

        void resetFilters() {
          setState(() {
            selectedGenderFilters.clear();
            selectedLevelFilters.clear();
            selectedFormatFilter = '';
          });
        }

        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filters',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilterChipWidget(
                options: const ['Test/First class', 'One day', 'T20'],
                selectedFilter: selectedFormatFilter,
                onSelectionChanged: (selectedFilter) {
                  selectFilter(selectedFilter, selectedFormatFilter,
                      (selected) {
                    selectedFormatFilter = selected;
                  });
                  widget.onFormatFilterChanged(selectedFormatFilter);
                },
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    resetFilters();
                    widget.onFormatFilterChanged('');
                  },
                  child: const Text('Reset Filters'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
