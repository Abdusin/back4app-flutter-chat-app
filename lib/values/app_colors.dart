part of values;

class AppColors {
  static List<List<Color>> ballColors = [
    [
      const Color(0xff87D3DF),
      const Color(0xffDEABEF),
    ],
    [
      const Color(0xffFC946E),
      const Color(0xffFFD996),
    ],
    [
      const Color(0xff87C76F),
      const Color(0xff87C76F),
    ],
    [
      const Color(0xffE7B2EF),
      const Color(0xffEEFCCF),
    ],
    [
      const Color(0xff8CE0DF),
      const Color(0xff8CE0DF),
    ],
    [
      const Color(0xff353645),
      const Color(0xff1E2027),
    ],
    [
      const Color(0xffFDA7FF),
      const Color(0xffFDA7FF),
    ],
    [
      const Color(0xff899FFE),
      const Color(0xff899FFE),
    ],
    [
      const Color(0xffFC946E),
      const Color(0xffFFD996),
    ],
    [
      const Color(0xff87C76F),
      const Color(0xff87C76F),
    ],
  ];

  static const primaryBackgroundColor = Color(0xff262A34);
  static const lightMauveBackgroundColor = Color(0xffC395FC);
  static const primaryAccentColor = Color(0xff246CFD);
  static const labelColor = Color(0xff666A7A);
  static const heavyBlue = Color(0xff246CFE);
  static const darkBlue2 = Color(0xff3C3E49);
  static const darkBlue = Color(0xff31333D);
  static const heavyDarkBlue = Color(0xff181a1f);
  static const lightBlue = Color(0xff94F0F1);
  static const bluePurple = Color(0xff8D96FF);
  static const lightPink = Color(0xffFCA3FF);
  static const purple = Color(0xff9F69F9);
  static const greyBlue = Color(0xff616575);
  static const greyBlue2 = Color(0xff5A5E6D);
  static const darkGreyBlue = Color(0xff353742);
  static const lightGreen = Color(0xffBEF0B2);
  static const heavyLightGreen = Color(0xff94D57B);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

// ranges from 0.0 to 1.0

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
