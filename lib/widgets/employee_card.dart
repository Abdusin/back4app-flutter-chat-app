import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'active_employee_card.dart';
import 'inactive_employee_card.dart';

class EmployeeCard extends StatelessWidget {
  final ParseUser user;
  final bool selected;
  const EmployeeCard({
    Key? key,
    required this.user,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: selected ? ActiveEmployeeCard(user: user) : InactiveEmployeeCard(user: user),
      ),
    );
  }
}
