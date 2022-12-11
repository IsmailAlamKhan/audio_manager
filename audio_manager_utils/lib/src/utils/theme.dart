import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData themeDataFrom(Brightness brightness, [ColorScheme? colorScheme]) {
    colorScheme ??= colorSchemeFrom(brightness);

    final textTheme = GoogleFonts.poppinsTextTheme().apply(
      bodyColor: colorScheme.onBackground,
      displayColor: colorScheme.onBackground,
    );
    final theme = ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
      textTheme: textTheme,
    );
    return theme.copyWith(
      scrollbarTheme: ScrollbarThemeData(thumbVisibility: MaterialStateProperty.all(true)),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.onBackground.withOpacity(0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.onBackground.withOpacity(0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        errorStyle: textTheme.caption!.copyWith(color: colorScheme.error),
        labelStyle: textTheme.caption!.copyWith(color: colorScheme.onBackground.withOpacity(0.6)),
        hintStyle: textTheme.caption!.copyWith(color: colorScheme.onBackground.withOpacity(0.6)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      checkboxTheme: theme.checkboxTheme.copyWith(
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme!.onSurface.withOpacity(0.12);
            }
            return colorScheme!.primary;
          },
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
      outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom()),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),
    );
  }

  static const Color defaultSeed = Colors.blue;

  static ColorScheme colorSchemeFrom(Brightness brightness, [Color? seed]) {
    seed ??= defaultSeed;
    return ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
      // primary: brightness == Brightness.light ? const Color(0xFFd1cbb8) : null,
      // surface: brightness == Brightness.light ? const Color(0xFF68655c) : null,
      // background: brightness == Brightness.light ? const Color(0xFFfdf6e3) : null,
    );
  }

  static ThemeData darkThemeData([ColorScheme? colorScheme]) {
    return themeDataFrom(Brightness.dark, colorScheme);
  }

  static ThemeData lightThemeData([ColorScheme? colorScheme]) {
    return themeDataFrom(Brightness.light, colorScheme);
  }

  static const defaultDuration = Duration(milliseconds: 300);
}

extension InputBorderToShapeBorder on InputBorder {
  ShapeBorder toShapeBorder() {
    final border = this;
    BorderRadius? borderRadius;

    if (border is OutlineInputBorder) {
      borderRadius = border.borderRadius;
    }

    return RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.zero,
      side: borderSide,
    );
  }
}
