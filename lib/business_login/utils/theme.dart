import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostinoThemes {
  static const Color _lightCursorColor = Color(0xff34AD64);
  static const Color _lightAccentColor = Color(0xff34AD64);
  static const Color _lightScaffoldColor = Colors.white;
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color(0xFFe5e5e5);
  static const Color _lightIconColor = Color(0xff8C8E8D);
  static const Color _lightColorSchemePrimary = Color(0xfffabc57);

  static const Color _darkCursorColor = Color(0xff34AD64);
  static const Color _darkAccentColor = Color(0xff34AD64);
  static const Color _darkScaffoldColor = Color(0xff18191A);
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkIconColor = Colors.white70;
  static const Color _darkColorSchemePrimary = Color(0xfffabc57);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightScaffoldColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _lightCursorColor,
    ),
    primaryColor: _lightPrimaryColor,
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    fontFamily: 'product-sans',
    textTheme: _lightTextTheme,
    inputDecorationTheme: _lightInputDecor,
    colorScheme: const ColorScheme.light(
      primaryVariant: _lightPrimaryVariantColor,
      primary: _lightColorSchemePrimary,
      secondary: Color(0xffF5F5F5),
      secondaryVariant: _darkScaffoldColor,
    ).copyWith(secondary: _lightAccentColor),
  );

  static final darkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _darkCursorColor,
    ),
    scaffoldBackgroundColor: _darkScaffoldColor,
    primaryColor: _darkPrimaryColor,
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    fontFamily: 'product-sans',
    textTheme: _darkTextTheme,
    inputDecorationTheme: _darkInputDecor,
    colorScheme: const ColorScheme.dark(
      primaryVariant: _darkPrimaryVariantColor,
      primary: _darkColorSchemePrimary,
      secondary: Colors.black,
      secondaryVariant: _lightScaffoldColor,
    ).copyWith(secondary: _darkAccentColor),
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline4: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontSize: 24.0,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Nunito',
      fontSize: 28,
    ),
    headline6: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: 'Nunito',
      color: Color(0xFF2128BD),
    ),
    bodyText1: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: Color(0xFF2128BD),
      fontSize: 18.0,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      color: Color(0xFF2128BD),
      fontSize: 18.0,
    ),
    caption: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      color: Color(0xFF2128BD),
      fontSize: 18.0,
    ),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headline6: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Color(0xFF2128BD),
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFF2128BD),
      fontSize: 18.0,
    ),
  );

  static const InputDecorationTheme _lightInputDecor = InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF008A37)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorMaxLines: 3,
  );
  static const InputDecorationTheme _darkInputDecor = InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF008A37)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorMaxLines: 3,
  );

  static final ThemeData lightTheme1 = ThemeData(
    brightness: Brightness.light,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    primaryColor: const Color(0xffEDD5B3),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: const Color(0x1aF5E0C3),
    primaryColorDark: const Color(0xff936F3E),
    canvasColor: const Color(0xffE09E45),
    scaffoldBackgroundColor: const Color(0xffB5BFD3),
    bottomAppBarColor: const Color(0xff6D42CE),
    cardColor: const Color(0xaaF5E0C3),
    dividerColor: const Color(0x1f6D42CE),
    focusColor: const Color(0x1aF5E0C3),
    hoverColor: const Color(0xffDEC29B),
    highlightColor: const Color(0xff936F3E),
    splashColor: const Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
    selectedRowColor: Colors.grey,
    unselectedWidgetColor: Colors.grey.shade400,
    disabledColor: Colors.grey.shade200,
    buttonTheme: const ButtonThemeData(
        //button themes
        ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
        //toggle button theme
        ),
    secondaryHeaderColor: Colors.grey,
    backgroundColor: const Color(0xff457BE0),
    dialogBackgroundColor: Colors.white,
    indicatorColor: const Color(0xff457BE0),
    hintColor: Colors.grey,
    errorColor: Colors.red,
    toggleableActiveColor: const Color(0xff6D42CE),
    textTheme: const TextTheme(
        //text themes that contrast with card and canvas
        ),
    primaryTextTheme: const TextTheme(
        //text theme that contrast with primary color
        ),
    inputDecorationTheme: const InputDecorationTheme(
        // default values for InputDecorator, TextField, and TextFormField
        ),
    iconTheme: const IconThemeData(
        //icon themes that contrast with card and canvas
        ),
    primaryIconTheme: const IconThemeData(
        //icon themes that contrast primary color
        ),
    sliderTheme: const SliderThemeData(
        // slider themes
        ),
    tabBarTheme: const TabBarTheme(
        // tab bat theme
        ),
    tooltipTheme: const TooltipThemeData(
        // tool tip theme
        ),
    cardTheme: const CardTheme(
        // card theme
        ),
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0xff936F3E),
      disabledColor: Color(0xaaF5E0C3),
      shape: StadiumBorder(),
      brightness: Brightness.light,
      labelPadding: EdgeInsets.all(8),
      labelStyle: TextStyle(),
      padding: EdgeInsets.all(8),
      secondaryLabelStyle: TextStyle(),
      secondarySelectedColor: Colors.white38,
      selectedColor: Colors.white,
      // chip theme
    ),
    platform: TargetPlatform.android,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    applyElevationOverlayColor: true,
    pageTransitionsTheme: const PageTransitionsTheme(
        //page transition theme
        ),
    appBarTheme: const AppBarTheme(
        //app bar theme
        ),
    bottomAppBarTheme: const BottomAppBarTheme(
        // bottom app bar theme
        ),
    snackBarTheme: const SnackBarThemeData(
        // snack bar theme
        ),
    dialogTheme: const DialogTheme(
        // dialog theme
        ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        // floating action button theme
        ),
    colorScheme: const ColorScheme(
      primary: Color(0xffEDD5B3),
      primaryVariant: Color(0x1aF5E0C3),
      secondary: Color(0xffC9A87C),
      secondaryVariant: Color(0xaaC9A87C),
      brightness: Brightness.light,
      background: Color(0xffB5BFD3),
      error: Colors.red,
      onBackground: Color(0xffB5BFD3),
      onError: Colors.red,
      onPrimary: Color(0xffEDD5B3),
      onSecondary: Color(0xffC9A87C),
      onSurface: Color(0xff457BE0),
      surface: Color(0xff457BE0),
    ),
    navigationRailTheme: const NavigationRailThemeData(
        // navigation rail theme
        ),
    typography: Typography.material2018(),
    cupertinoOverrideTheme: const CupertinoThemeData(
        //cupertino theme
        ),
    bottomSheetTheme: const BottomSheetThemeData(
        //bottom sheet theme
        ),
    popupMenuTheme: const PopupMenuThemeData(
        //pop menu theme
        ),
    bannerTheme: const MaterialBannerThemeData(
        // material banner theme
        ),
    dividerTheme: const DividerThemeData(
        //divider, vertical divider theme
        ),
    buttonBarTheme: const ButtonBarThemeData(
        // button bar theme
        ),
    fontFamily: 'ROBOTO',
    splashFactory: InkSplash.splashFactory,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff936F3E),
      selectionColor: Color(0xffB5BFD3),
      selectionHandleColor: Color(0xff936F3E),
    ),
  );

  static final ThemeData darkTheme1 = ThemeData(
    brightness: Brightness.dark,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    primaryColor: const Color(0xff5D4524),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: const Color(0x1a311F06),
    primaryColorDark: const Color(0xff936F3E),
    canvasColor: const Color(0xffE09E45),
    scaffoldBackgroundColor: const Color(0xffB5BFD3),
    bottomAppBarColor: const Color(0xff6D42CE),
    cardColor: const Color(0xaa311F06),
    dividerColor: const Color(0x1f6D42CE),
    focusColor: const Color(0x1a311F06),
    hoverColor: const Color(0xa15D4524),
    highlightColor: const Color(0xaf2F1E06),
    splashColor: const Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
    selectedRowColor: Colors.grey,
    unselectedWidgetColor: Colors.grey.shade400,
    disabledColor: Colors.grey.shade200,
    buttonTheme: const ButtonThemeData(
//button themes
        ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
//toggle button theme
        ),
    secondaryHeaderColor: Colors.grey,
    backgroundColor: const Color(0xff457BE0),
    dialogBackgroundColor: Colors.white,
    indicatorColor: const Color(0xff457BE0),
    hintColor: Colors.grey,
    errorColor: Colors.red,
    toggleableActiveColor: const Color(0xff6D42CE),
    textTheme: const TextTheme(
//text themes that contrast with card and canvas
        ),
    primaryTextTheme: const TextTheme(
//text theme that contrast with primary color
        ),
    inputDecorationTheme: const InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
        ),
    iconTheme: const IconThemeData(
//icon themes that contrast with card and canvas
        ),
    primaryIconTheme: const IconThemeData(
//icon themes that contrast primary color
        ),
    sliderTheme: const SliderThemeData(
        // slider themes
        ),
    tabBarTheme: const TabBarTheme(
        // tab bat theme
        ),
    tooltipTheme: const TooltipThemeData(
        // tool tip theme
        ),
    cardTheme: const CardTheme(
        // card theme
        ),
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0xff2F1E06),
      disabledColor: Color(0xa15D4524),
      shape: StadiumBorder(),
      brightness: Brightness.dark,
      labelPadding: EdgeInsets.all(8),
      labelStyle: TextStyle(),
      padding: EdgeInsets.all(8),
      secondaryLabelStyle: TextStyle(),
      secondarySelectedColor: Colors.white38,
      selectedColor: Colors.white
      // chip theme
      ,
    ),
    platform: TargetPlatform.android,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    applyElevationOverlayColor: true,
    pageTransitionsTheme: const PageTransitionsTheme(
        //page transition theme
        ),
    appBarTheme: const AppBarTheme(
        //app bar theme
        ),
    bottomAppBarTheme: const BottomAppBarTheme(
        // bottom app bar theme
        ),
    snackBarTheme: const SnackBarThemeData(
        // snack bar theme
        ),
    dialogTheme: const DialogTheme(
        // dialog theme
        ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        // floating action button theme
        ),
    colorScheme: const ColorScheme(
      primary: Color(0xff5D4524),
      primaryVariant: Color(0x1a311F06),
      secondary: Color(0xff457BE0),
      secondaryVariant: Color(0xaa457BE0),
      brightness: Brightness.dark,
      background: Color(0xffB5BFD3),
      error: Colors.red,
      onBackground: Color(0xffB5BFD3),
      onError: Colors.red,
      onPrimary: Color(0xff5D4524),
      onSecondary: Color(0xff457BE0),
      onSurface: Color(0xff457BE0),
      surface: Color(0xff457BE0),
    ),
    navigationRailTheme: const NavigationRailThemeData(
        // navigation rail theme
        ),
    typography: Typography.material2018(),
    cupertinoOverrideTheme: const CupertinoThemeData(
        //cupertino theme
        ),
    bottomSheetTheme: const BottomSheetThemeData(
        //bottom sheet theme
        ),
    popupMenuTheme: const PopupMenuThemeData(
        //pop menu theme
        ),
    bannerTheme: const MaterialBannerThemeData(
        // material banner theme
        ),
    dividerTheme: const DividerThemeData(
        //divider, vertical divider theme
        ),
    buttonBarTheme: const ButtonBarThemeData(
        // button bar theme
        ),
    fontFamily: 'ROBOTO',
    splashFactory: InkSplash.splashFactory,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff483112),
      selectionColor: Color(0x1a483112),
      selectionHandleColor: Color(0xff483112),
    ),
  );
}
