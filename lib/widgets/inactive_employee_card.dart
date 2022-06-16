import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Chat/online_user_profile.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class InactiveEmployeeCard extends StatelessWidget {
  final ParseUser user;
  const InactiveEmployeeCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: AppColors.primaryBackgroundColor,
          // border: Border.all(color: AppColors.primaryBackgroundColor, width: 4),
          borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        OnlineUserProfile(
          image: 'assets/memoji/${user.get('image', defaultValue: '1')}.png',
          imageBackground: 'DACFFE',
        ),
        AppSpaces.horizontal20,
        Text(user.username ?? '',
            style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.4)),
      ]),
    );
  }
}
