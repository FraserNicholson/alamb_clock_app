import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  final List<String> options;
  final String selectedFilter;
  final Function(String) onSelectionChanged;

  const FilterChipWidget({
    super.key,
    required this.options,
    required this.selectedFilter,
    required this.onSelectionChanged,
  });

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.options.map((filter) {
        return FilterChip(
          label: Text(filter),
          onSelected: (isSelected) {
            String selectedFilter = filter;
            widget.onSelectionChanged(selectedFilter);
          },
          selected: widget.selectedFilter == filter,
          selectedColor: Colors.blue,
        );
      }).toList(),
    );
  }
}
