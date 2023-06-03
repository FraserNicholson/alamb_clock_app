import 'package:flutter/material.dart';
import 'filter_chip.dart';
import 'item_details_popup.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  List<String> selectedGenderFilters = [];
  List<String> selectedLevelFilters = [];
  List<String> selectedFormatFilters = [];

  void _showFiltersModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
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
                      _selectFilter(
                          selectedFilters.first, selectedGenderFilters,
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
                      _selectFilter(
                          selectedFilters.first, selectedFormatFilters,
                          (selected) {
                        selectedFormatFilters = selected;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
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
        title: Text('Page 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
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
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item: ${items[index]}',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
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
