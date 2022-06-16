import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/Chat/online_user_profile.dart';
import 'package:message_app/widgets/dummy/green_done_icon.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ActiveEmployeeCard extends StatelessWidget {
  final ParseUser user;
  const ActiveEmployeeCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink, AppColors.lightMauveBackgroundColor],
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.heavyDarkBlue),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    OnlineUserProfile(
                      image: 'assets/memoji/${user.get('image', defaultValue: '1')}.png',
                      imageBackground: 'DACFFE',
                    ),
                    AppSpaces.horizontal20,
                    Text(user.username!,
                        style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.2)),
                  ]),
                  const Align(alignment: Alignment.topCenter, child: GreenDoneIcon())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
