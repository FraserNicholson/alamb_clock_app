import 'package:alamb_clock_app/widgets/filter_chip.dart';
import 'package:flutter/material.dart';

class MatchesFiltersModal extends StatefulWidget {
  const MatchesFiltersModal({super.key});

  @override
  State<MatchesFiltersModal> createState() => _MatchesFiltersModalState();
}

class _MatchesFiltersModalState extends State<MatchesFiltersModal> {
  List<String> selectedGenderFilters = [];

  List<String> selectedLevelFilters = [];

  List<String> selectedFormatFilters = [];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        void selectFilter(String filter, List<String> selectedFilters,
            Function(List<String>) onSelectionChanged) {
          setState(() {
            if (selectedFilters.contains(filter)) {
              selectedFilters.remove(filter);
            } else {
              selectedFilters.add(filter);
            }
          });

          onSelectionChanged(selectedFilters);
        }

        void resetFilters() {
          setState(() {
            selectedGenderFilters.clear();
            selectedLevelFilters.clear();
            selectedFormatFilters.clear();
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
              const SizedBox(height: 16.0),
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilterChipWidget(
                options: const ['Female', 'Male'],
                selectedFilters: selectedGenderFilters,
                onSelectionChanged: (selectedFilters) {
                  selectFilter(selectedFilters.first, selectedGenderFilters,
                      (selected) {
                    selectedGenderFilters = selected;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Level',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilterChipWidget(
                options: const ['Domestic', 'International'],
                selectedFilters: selectedLevelFilters,
                onSelectionChanged: (selectedFilters) {
                  selectFilter(selectedFilters.first, selectedLevelFilters,
                      (selected) {
                    selectedLevelFilters = selected;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Format',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilterChipWidget(
                options: const ['Test/First class', 'One day', 'T20', '100'],
                selectedFilters: selectedFormatFilters,
                onSelectionChanged: (selectedFilters) {
                  selectFilter(selectedFilters.first, selectedFormatFilters,
                      (selected) {
                    selectedFormatFilters = selected;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    resetFilters();
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
