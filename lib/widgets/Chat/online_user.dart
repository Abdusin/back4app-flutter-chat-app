import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Chat/online_user_profile.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class OnlineUser extends StatelessWidget {
  final ParseUser user;
  final VoidCallback onTap;
  const OnlineUser({Key? key, required this.user, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Row(children: [
          OnlineUserProfile(
            image: 'assets/memoji/${user.get('image', defaultValue: '1')}.png',
            imageBackground: 'DACFFE',
          ),
          AppSpaces.horizontal20,
          Text(
            user.username ?? '',
            style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          )
        ]),
      ),
    );
  }
}
