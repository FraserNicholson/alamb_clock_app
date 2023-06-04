import 'package:flutter/material.dart';
import 'filter_chip.dart';

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
        void _selectFilter(String filter, List<String> selectedFilters,
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

        void _resetFilters() {
          setState(() {
            selectedGenderFilters.clear();
            selectedLevelFilters.clear();
            selectedFormatFilters.clear();
          });
        }

        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filters',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Gender',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilterChipWidget(
                options: ['Female', 'Male'],
                selectedFilters: selectedGenderFilters,
                onSelectionChanged: (selectedFilters) {
                  _selectFilter(selectedFilters.first, selectedGenderFilters,
                      (selected) {
                    selectedGenderFilters = selected;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Level',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilterChipWidget(
                options: ['Domestic', 'International'],
                selectedFilters: selectedLevelFilters,
                onSelectionChanged: (selectedFilters) {
                  _selectFilter(selectedFilters.first, selectedLevelFilters,
                      (selected) {
                    selectedLevelFilters = selected;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Format',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FilterChipWidget(
                options: ['Test/First class', 'One day', 'T20', '100'],
                selectedFilters: selectedFormatFilters,
                onSelectionChanged: (selectedFilters) {
                  _selectFilter(selectedFilters.first, selectedFormatFilters,
                      (selected) {
                    selectedFormatFilters = selected;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    _resetFilters();
                  },
                  child: Text('Reset Filters'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
