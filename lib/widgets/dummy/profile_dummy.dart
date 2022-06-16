import 'package:flutter/material.dart';

enum ProfileDummyType { icon, image, button }

class ProfileDummy extends StatelessWidget {
  final ProfileDummyType dummyType;
  final double scale;
  final String? image;
  final Color? color;
  const ProfileDummy({Key? key, required this.dummyType, required this.scale, required this.color, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40 * scale,
      height: 40 * scale,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: ClipOval(
        child: dummyType == ProfileDummyType.icon
            ? Icon(Icons.person, color: Colors.white, size: 30 * scale)
            : Image(
                fit: (scale == 1.2) ? BoxFit.cover : BoxFit.contain,
                image: AssetImage(
                  image!,
                ),
              ),
      ),
    );
  }
}
