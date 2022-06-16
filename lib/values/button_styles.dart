part of values;

class ButtonStyles {
  static final ButtonStyle blueRounded = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.heavyBlue),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: const BorderSide(color: AppColors.heavyBlue),
      ),
    ),
  );

  static final ButtonStyle imageRounded = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.heavyDarkBlue),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: const BorderSide(color: AppColors.labelColor, width: 1),
      ),
    ),
  );
}
