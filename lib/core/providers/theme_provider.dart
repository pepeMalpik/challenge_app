import 'package:challenge_app/core/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _customLightTheme;
  ThemeData? _customDarkTheme;

  ThemeData? _theme;
  ThemeData? get theme => _theme;

  ThemeProvider() {
    setupCustomLightTheme();
    setupCustomDarkTheme();
    if (SchedulerBinding.instance?.window.platformBrightness ==
        Brightness.dark) {
      _theme = _customDarkTheme!;
      notifyListeners();
    }
  }

  onChangeApparience({@required Brightness? brightness}) {
    if (brightness == Brightness.dark && _theme != _customDarkTheme) {
      _theme = _customDarkTheme!;
      notifyListeners();
    } else if (brightness == Brightness.light && _theme != _customLightTheme) {
      _theme = _customLightTheme!;
      notifyListeners();
    }
  }

  setupCustomLightTheme() {
    this._customLightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      cardTheme: CardTheme().copyWith(
        color: Colors.grey[300],
        elevation: 0,
      ),
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Rubik',
          ),
      primaryTextTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Rubik',
          ),
      accentTextTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Rubik',
          ),
      primaryColor: AppColors.primary,
      accentColor: AppColors.accent,
      floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.accent,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return AppColors.challenge_purple.withOpacity(0.05);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return AppColors.challenge_purple.withOpacity(0.05);
              return null; // Defer to the widget's default.
            },
          ),
        ),
      ),
    );
    _theme = _customLightTheme!;
  }

  setupCustomDarkTheme() {
    this._customDarkTheme = ThemeData.dark().copyWith(
      // scaffoldBackgroundColor: AppColors.background_dark,
      primaryColor: AppColors.primary_dark,
      accentColor: AppColors.accent_dark,
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Rubik',
          ),
      primaryTextTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Rubik',
          ),
      accentTextTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Rubik',
          ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.primary_dark),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return AppColors.primary_dark.withOpacity(0.05);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return AppColors.primary_dark.withOpacity(0.05);
              return null; // Defer to the widget's default.
            },
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData().copyWith(
        fillColor: MaterialStateProperty.all<Color>(AppColors.primary_dark),
      ),
    );
  }
}
