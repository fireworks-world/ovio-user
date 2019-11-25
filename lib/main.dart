import 'package:flutter/material.dart';
import 'customColors.dart';
import 'slider.dart';

final ThemeData customTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: customColor1,
    accentColor: customColor2,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: customColor1,
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme.light().copyWith(primary: customColor1)),
    scaffoldBackgroundColor: customBackgroundWhite,
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: customColor1),
    inputDecorationTheme: InputDecorationTheme(
//      border: CutCornersBorder(),
        ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline:
            base.headline.copyWith(fontWeight: FontWeight.w500, fontSize: 24.0),
        title: base.title.copyWith(fontSize: 20.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: customColor1,
        bodyColor: customBackgroundWhite,
      );
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      title: 'Ovio Admin',
      home: IntroSlider(),
    );
  }
}
