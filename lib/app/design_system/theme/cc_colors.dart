import 'package:flutter/material.dart';

class CCColors {
  CCColors._();

  static const white = Colors.white;
  static const azulH = Color(0xff0F2F57);
  static const haklesa = Color(0xff483D56);
  static const brightGray = Color(0xff3E4651);
  static const lightGray = Color(0xffEEEEEE);
  static const softAmber = Color(0xffCCC1B4);
  static const hak = Color(0xff686C96);
  static const info = Color(0xFF17a2b8);

  static const attachBorder = Color(0xFF4D555F);

  static Color success(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      //TODO implementar cor de success para thema dark
    }

    return const Color(0xff3EA316);
  }

  static Color warning(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      //TODO implementar cor de warning para thema dark
    }

    return const Color(0xffff8212);
  }

  static Color danger(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      //TODO implementar cor de danger para thema dark
    }

    return const Color(0xfff64a4a);
  }

  static const error = Color(0xFFdc3545);
  static const errorR1 = Color(0xFFD40000);
  static const errorR2 = Color(0xFFFF9797);
  static const backgroudpinInputField = Color(0xffE5E5E5);
  static const laranjaH = Color(0xffE63323);
  static const neutralN6 = Color(0xffDDE0E8);
  static const neutralN5 = Color(0xffECEDF2);
  static const neutralN4 = Color(0xffC4C9D6);
  static const neutralN3 = Color(0xffA1A9BA);
  static const neutralN2 = Color(0xff697081);
  static const neutralN1 = Color(0xff58595B);

  static const neutralBlack = Color(0xff1D1D1D);
  static const haklesc = Color(0xffFCDFDB);
  static const primaryVariant = Color(0xff6B6F98);
  static const primaryVariantDisabled = Color(0xff6F829A);
  static const secondary = Color(0xffE63323);
  static const secondaryS3 = Color(0xff4D555F);
  static const secondaryS4 = Color(0xff71777F);
  static const backgroundDisableLight = Color(0xffECEDF2);
  static const disableLight = Color(0xffC4C9D6);
  static const backgroundDisableDark = Color(0xff364559);
  static const disableDark = Color(0xff03223B);
  static const borderDotted = Color(0xffCCC1B4);
  static const borderHeader = Color(0xffBCBDBD);
  static const backgroundWhite = Color(0xffF1F1F1);
  static const backgroundSuccess = Color(0xffA7FFC5);
  static const backgroundError = Color(0xffFDD3C8);
  static const backgroundNotificationUnread = Color(0xffF2FAFD);

  static const primaryDark = Color(0xff161849);
  static const primaryP3 = Color(0xffCCC1B4);
  static const primaryP2 = Color(0xff386D82);
  static const primaryP1 = Color(0xff3E4651);
  static const basicBlack = Color(0xff2C2C2C);
  static const basicYellow = Color(0xffF5D87D);
  static const basicGreen = Color(0xffA0DA8C);
  static const basicGrey = Color(0xffBCBDBD);
  static const successPure = Color(0xff008820);
  static const errorPure = Color(0xffD40000);

  static const blueDefault = Color(0xff0D3148);
  static const blueDark = Color(0xff00263E);
  static const yellowDark = Color(0xffFDC32F);
  static const yellowBrand = Color(0xffFDC339);
  static const yellowDarkPressed = Color(0xffFFB700);
  static const blueDisabled = Color(0xff19435D);
  static const blueBackgroundColor = Color(0xff0D3148);
  static const greyBackgroundColor = Color(0xffECEDF2);
  static const headerAvatarColor = Color(0xffCCC2B6);
  static const headerAvatarTextColor = Color(0xff332921);
  static const headerColor = Color(0xff3F454E);
  static const headerInfoTextColor = Color(0xffC1C8CD);
  static const headerTitleTextColor = Color(0xffF9FFFF);
  static const blueB3 = Color(0xff005599);
  static const blueB1 = Color(0xff03223B);
  static const brown = Color(0xff666666);
  static const brandColor = Color(0xFF014C8B);
  static const brandColorLight = Color(0xFFCFF4FF);
  static const feedbackColor = Color(0xFF004281);

  static const greenDark = Color(0xff5A7E68);
  static const basicRed = Color(0xffC25343);

  static const blueCondoConta = Color(0xff005599);

  static Color? shimmerBaseColor = Colors.grey[300];
  static Color? shimmerHighlightColor = Colors.grey[50];
  static Color shimmerDarkBaseColor = CCColors.blueDefault;
  static Color shimmerDarkHighlightColor = Colors.white.withOpacity(0.1);

  static const accent = Color(0xff62e1fc);
  static const successLight = Color(0xffe6f4e9);

  static const warningLight = Color(0xffffecdc);

  static const infoLight = Color(0xffe8f0fd);

  static const dangerLight = Color(0xfffce8e6);
  static const gray = Color(0xffc2c7cf);
  static const black = Color(0xff000000);

  static const Gradient primaryGradient = LinearGradient(
    colors: [
      Color(0xff4186DC),
      Color(0xffFF8C7D),
      Color(0xffFF594A),
    ],
  );
  static Gradient backgroundGradientSplash() {
    return const LinearGradient(
      colors: [
        Color(0xff005599),
        Color(0xff03223B),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static const int _primaryValue = 0xFF386D82;
  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFF386D82),
      100: Color(0xFF386D82),
      200: Color(0xFF386D82),
      300: Color(0xFF386D82),
      400: Color(0xFF386D82),
      500: Color(_primaryValue),
      600: Color(0xFF386D82),
      700: Color(0xFF386D82),
      800: Color(0xFF386D82),
      900: Color(0xFF386D82),
    },
  );
}
