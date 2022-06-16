import 'package:flutter/material.dart';
import 'package:message_app/values/values.dart';

import 'package:message_app/widgets/Search/active_task_card.dart';
import 'package:message_app/widgets/Search/inactive_task_card.dart';

class SearchTaskCard extends StatelessWidget {
  final bool activated;
  final String header;
  final String subHeader;
  final String date;
  const SearchTaskCard(
      {Key? key, required this.date, required this.activated, required this.header, required this.subHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool newBool = activated;
    ValueNotifier<bool> _totalDueTrigger = ValueNotifier(newBool);

    return ValueListenableBuilder(
        valueListenable: _totalDueTrigger,
        builder: (BuildContext context, _, __) {
          return _totalDueTrigger.value
              ? Column(children: [
                  InactiveTaskCard(header: header, notifier: _totalDueTrigger, subHeader: subHeader, date: date),
                  AppSpaces.vertical10
                ])
              : Column(children: [
                  ActiveTaskCard(header: header, notifier: _totalDueTrigger, subHeader: subHeader, date: date),
                  AppSpaces.vertical10
                ]);
        });
  }
}
