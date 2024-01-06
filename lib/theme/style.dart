import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    fontFamily: 'Roboto',
    snackBarTheme: SnackBarThemeData(
      backgroundColor: lightColorScheme.primary,
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
      actionTextColor: Colors.white,
    ),
  );
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF8A05BE),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFC89BDC),
  onPrimaryContainer: Color(0xFF5E007A),
  secondary: Color(0xFF563867),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF7C4D92),
  onSecondaryContainer: Color(0xFF21122D),
  tertiary: Color(0xFF565656),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFDADADA),
  onTertiaryContainer: Color(0xFF2B2B2B),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF3E5F5),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFF3E5F5),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFEDE7F6),
  onSurfaceVariant: Color(0xFF121212),
  outline: Color(0xFF767680),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF303034),
  inversePrimary: Color(0xFFC89BDC),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF8A05BE),
  outlineVariant: Color(0xFFC6C5D0),
  scrim: Color(0xFF1D3744),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  onPrimaryContainer: Color(0xFFEADDFF),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: Color(0xFF4A4458),
  onSecondaryContainer: Color(0xFFE8DEF8),
  tertiary: Color(0xFFCEC2FF),
  onTertiary: Color(0xFF332D41),
  tertiaryContainer: Color(0xFF48435A),
  onTertiaryContainer: Color(0xFFE8DEF8),
  error: Color(0xFFCF6679),
  errorContainer: Color(0xFFB3261E),
  onError: Color(0xFF000000),
  onErrorContainer: Color(0xFFF9B2A3),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE4E1E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE4E1E6),
  surfaceVariant: Color(0xFF45464F),
  onSurfaceVariant: Color(0xFFC6C5D0),
  outline: Color(0xFF90909A),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE4E1E6),
  inversePrimary: Color(0xFF6750A4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF6750A4),
  outlineVariant: Color(0xFF45464F),
  scrim: Color(0xFF000000),
);
