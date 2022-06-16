import 'package:flutter/material.dart';
import 'package:message_app/values/values.dart';

class OutlinedButtonWithText extends StatelessWidget {
  final String content;
  final double width;
  final VoidCallback? onPressed;
  const OutlinedButtonWithText({Key? key, required this.content, required this.width, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: 45,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.heavyDarkBlue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: HexColor.fromHex("246EFE"), width: 2)))),
            child: Center(child: Text(content, style: const TextStyle(fontSize: 17, color: Colors.white)))));
  }
}
