import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'back_button.dart';

class DefaultNav extends StatelessWidget {
  final String title;
  final Widget? action;
  const DefaultNav({Key? key, this.action, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        flex: 3,
        child: Row(children: const [AppBackButton()]),
      ),
      Expanded(
        flex: 5,
        child: Center(child: Text(title, style: GoogleFonts.lato(fontSize: 20, color: Colors.white))),
      ),
      Expanded(flex: 3, child: action ?? const SizedBox.shrink()),
    ]);
  }
}
