import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  final List<String> options;
  final List<String> selectedFilters;
  final Function(List<String>) onSelectionChanged;

  const FilterChipWidget({
    super.key,
    required this.options,
    required this.selectedFilters,
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
            List<String> selectedFilters = [filter];
            widget.onSelectionChanged(selectedFilters);
          },
          selected: widget.selectedFilters.contains(filter),
          selectedColor: Colors.blue,
        );
      }).toList(),
    );
  }
}
