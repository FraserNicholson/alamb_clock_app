import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

// ignore: must_be_immutable
class NotificationPopup extends StatefulWidget {
  final String? notificationId;
  final List<String> notificationTypes = ['Innings Started', 'Wicket Count'];
  String selectedNotificationType;
  final List<String> teams;
  String selectedTeam;
  int? selectedWicketCount;
  bool showWicketCountSelector = false;
  String? notificationTitleText;

  NotificationPopup(
      {super.key,
      required this.notificationId,
      required this.selectedNotificationType,
      required this.selectedTeam,
      required this.selectedWicketCount,
      required this.teams}) {
    showWicketCountSelector = selectedNotificationType == 'Wicket Count';
    notificationTitleText = selectedNotificationType != ''
        ? 'Update Notification'
        : 'Add Notification';
  }

  @override
  State<NotificationPopup> createState() => _NotificationPopupState();
}

class _NotificationPopupState extends State<NotificationPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const SizedBox(height: 16.0),
            _buildNotificationTypeDropdown(),
            _buildTeamInQuestionDropdown(),
            Visibility(
              visible: widget.showWicketCountSelector,
              child: _buildWicketCountDropdown(),
            ),
            const SizedBox(height: 16.0),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          widget.notificationTitleText!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(width: 48.0),
      ],
    );
  }

  Widget _buildNotificationTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notification type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<String>(
          value: widget.selectedNotificationType == ''
              ? null
              : widget.selectedNotificationType,
          items: widget.notificationTypes
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (value) {
            widget.selectedNotificationType = value!;
            setState(() {
              widget.showWicketCountSelector =
                  widget.selectedNotificationType == 'Wicket Count';
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamInQuestionDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        const Text(
          'Team in question',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<String>(
          value: widget.selectedTeam == '' ? null : widget.selectedTeam,
          items: widget.teams
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (value) {
            widget.selectedTeam = value!;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildWicketCountDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        const Text(
          'Wicket Count',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<int>(
          value: widget.selectedWicketCount,
          items: List.generate(
            10,
            (index) => DropdownMenuItem<int>(
              value: index + 1,
              child: Text((index + 1).toString()),
            ),
          ),
          onChanged: (value) {
            widget.selectedWicketCount = value!;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _saveNotification();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: const Text(
        'Save',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }

  void _saveNotification() {
    var (notificationIsValid, errorMessage) = _validateNotification();

    if (!notificationIsValid) {
      _showErrorNotification(errorMessage);
      return;
    }

    _showSuccessNotification('Notification successfully saved');
    Navigator.pop(context);
  }

  (bool, String) _validateNotification() {
    if (widget.selectedNotificationType == '') {
      return (false, 'Notification type must be supplied');
    }

    if (widget.selectedTeam == '') {
      return (false, 'Team in question must be supplied');
    }

    if (widget.selectedNotificationType == 'Wicket Count' &&
        widget.selectedWicketCount == null) {
      return (
        false,
        'Wicket count must be supplied when notification type is wicket count'
      );
    }

    return (true, '');
  }

  void _showErrorNotification(String text) {
    showSimpleNotification(
      Text(text),
      background: Colors.red,
      duration: const Duration(seconds: 4),
      trailing: Builder(builder: (context) {
        return TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              OverlaySupportEntry.of(context)?.dismiss();
            },
            child: const Text('Dismiss'));
      }),
    );
  }

  void _showSuccessNotification(String text) {
    showSimpleNotification(
      Text(text),
      background: Colors.green,
      trailing: Builder(builder: (context) {
        return TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              OverlaySupportEntry.of(context)?.dismiss();
            },
            child: const Text('Dismiss'));
      }),
    );
  }
}
