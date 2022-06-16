import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:message_app/data/data_model.dart';
import 'package:message_app/values/values.dart';
import 'package:message_app/widgets/dummy/profile_dummy.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class StackedWidgets extends StatelessWidget {
  final List<Widget> items;
  final TextDirection direction;
  final double size;
  final double xShift;

  const StackedWidgets(
      {Key? key, required this.items, this.direction = TextDirection.ltr, this.size = 100, this.xShift = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - xShift;

          final value = Container(
            width: size,
            height: size,
            child: item,
            margin: EdgeInsets.only(left: left * index),
          );

          return MapEntry(index, value);
        })
        .values
        .toList();

    return Stack(
      children: direction == TextDirection.ltr ? allItems.reversed.toList() : allItems,
    );
  }
}

class BuildStackedImages extends StatelessWidget {
  const BuildStackedImages({
    Key? key,
    this.direction = TextDirection.ltr,
    required this.users,
    this.addMore,
  }) : super(key: key);
  final TextDirection direction;
  final List<ParseUser> users;
  final bool? addMore;
  final size = 50.0;
  final xShift = 20.0;
  @override
  Widget build(BuildContext context) {
    Container lastContainer = Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(
        child: Text(
          users.length.toString(),
          style: GoogleFonts.lato(
            color: HexColor.fromHex("226AFD"),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    Container iconContainer = Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(color: AppColors.primaryAccentColor, shape: BoxShape.circle),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );

    final items = List.generate(
      min(users.length, 4),
      (index) => ProfileDummy(
        color: AppData.groupBackgroundColors[index],
        dummyType: ProfileDummyType.image,
        image: "assets/memoji/${users[index].get('image', defaultValue: '1')}.png",
        scale: 1.0,
      ),
    );

    return StackedWidgets(
      direction: direction,
      items: [...items, lastContainer, (addMore != null) ? iconContainer : const SizedBox()],
      size: size,
      xShift: xShift,
    );
  }
}
