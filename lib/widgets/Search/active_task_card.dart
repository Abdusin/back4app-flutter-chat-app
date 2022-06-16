import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/values/values.dart';

class ActiveTaskCard extends StatelessWidget {
  final String header;
  final String subHeader;
  final ValueNotifier<bool> notifier;
  final String date;
  const ActiveTaskCard(
      {Key? key, required this.header, required this.notifier, required this.subHeader, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () {
          notifier.value = !notifier.value;
        },
        child: Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(color: AppColors.primaryBackgroundColor, borderRadius: BorderRadius.circular(10)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                  child: ClipOval(
                    child: Center(
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.pink, AppColors.lightMauveBackgroundColor]),
                              shape: BoxShape.circle),
                          child: Center(
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                                  child: Center(
                                      child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration:
                                              const BoxDecoration(color: Colors.white, shape: BoxShape.circle)))))),
                    ),
                  ),
                ),
                AppSpaces.horizontal20,
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(header,
                          style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)),
                      Text(subHeader, style: GoogleFonts.lato(color: AppColors.greyBlue2))
                    ])
              ]),
              Text(date, style: GoogleFonts.lato(color: const Color(0xffF5A3FF)))
            ])),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          //caption: 'More',
          color: HexColor.fromHex("B1FEE2"),
          icon: Icons.share,

          // onTap: () => _showSnackBar('More'),
        ),
        const IconSlideAction(
          //caption: 'Delete',
          iconWidget: Icon(Icons.delete, size: 35),
          color: Color(0xffF5A3FF),

          // onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }
}
