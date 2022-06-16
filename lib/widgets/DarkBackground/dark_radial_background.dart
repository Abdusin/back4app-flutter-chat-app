import 'package:flutter/material.dart';
import 'package:message_app/values/values.dart';

class DarkRadialBackground extends StatelessWidget {
  final Color color;
  final Alignment? position;

  const DarkRadialBackground({
    Key? key,
    this.position,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _color = HexColor.fromHex("1D192D");
    return Center(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [_color, _color, _color, color],
              center: position ?? const Alignment(-1.0, -1.0),
            ),
          ),
        ),
      ),
    );
  }
}
