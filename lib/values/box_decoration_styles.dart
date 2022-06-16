part of values;

class BoxDecorationStyles {
  static final BoxDecoration fadingGlory = BoxDecoration(
    gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
      HexColor.fromHex("625B8B"),
      const Color.fromRGBO(98, 99, 102, 1),
      AppColors.heavyDarkBlue,
      AppColors.heavyDarkBlue
    ]),
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  );

  static final BoxDecoration fadingInnerDecor =
      BoxDecoration(color: AppColors.heavyDarkBlue, borderRadius: BorderRadius.circular(20));
}
