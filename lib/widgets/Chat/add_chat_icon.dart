import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/values/values.dart';

class AppAddIcon extends StatelessWidget {
  final StatelessWidget? page;
  final Color? color;
  final double? scale;

  const AppAddIcon({
    Key? key,
    this.page,
    this.scale,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (page != null) Get.to(() => page!);
      },
      child: Container(
          width: 50 * (scale == null ? 1.0 : scale!),
          height: 50 * (scale == null ? 1.0 : scale!),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? Colors.transparent,
              border: Border.all(width: 2, color: color ?? AppColors.greyBlue)),
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}
