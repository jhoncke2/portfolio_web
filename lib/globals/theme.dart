import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff29638a),
      surfaceTint: Color(0xff29638a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcbe6ff),
      onPrimaryContainer: Color(0xff004b71),
      secondary: Color(0xff0b6780),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb9eaff),
      onSecondaryContainer: Color(0xff004d62),
      tertiary: Color(0xff8f4c36),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdbd0),
      onTertiaryContainer: Color(0xff723521),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff181c20),
      onSurfaceVariant: Color(0xff41474d),
      outline: Color(0xff72787e),
      outlineVariant: Color(0xffc1c7ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff97ccf8),
      primaryFixed: Color(0xffcbe6ff),
      onPrimaryFixed: Color(0xff001e30),
      primaryFixedDim: Color(0xff97ccf8),
      onPrimaryFixedVariant: Color(0xff004b71),
      secondaryFixed: Color(0xffb9eaff),
      onSecondaryFixed: Color(0xff001f29),
      secondaryFixedDim: Color(0xff89d0ed),
      onSecondaryFixedVariant: Color(0xff004d62),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff3a0b00),
      tertiaryFixedDim: Color(0xffffb59e),
      onTertiaryFixedVariant: Color(0xff723521),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffe0e3e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003a58),
      surfaceTint: Color(0xff29638a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3a729a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003b4c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff26768f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5d2512),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa15a43),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff0e1215),
      onSurfaceVariant: Color(0xff31373d),
      outline: Color(0xff4d5359),
      outlineVariant: Color(0xff686e74),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff97ccf8),
      primaryFixed: Color(0xff3a729a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1c5980),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff26768f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff005c74),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa15a43),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff83432e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c7cc),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffe5e8ed),
      surfaceContainerHigh: Color(0xffdadde2),
      surfaceContainerHighest: Color(0xffcfd2d7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002f49),
      surfaceTint: Color(0xff29638a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff064e73),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00313f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005065),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff501b09),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff753723),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272d32),
      outlineVariant: Color(0xff444a50),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff97ccf8),
      primaryFixed: Color(0xff064e73),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003653),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005065),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003847),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff753723),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff58220f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6b9be),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef1f6),
      surfaceContainer: Color(0xffe0e3e8),
      surfaceContainerHigh: Color(0xffd2d4da),
      surfaceContainerHighest: Color(0xffc4c7cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff97ccf8),
      surfaceTint: Color(0xff97ccf8),
      onPrimary: Color(0xff00344f),
      primaryContainer: Color.fromARGB(255, 0, 26, 40),
      onPrimaryContainer: Color(0xffcbe6ff),
      secondary: Color.fromARGB(255, 0, 8, 15),
      onSecondary: Color(0xff003544),
      secondaryContainer: Color(0xff004d62),
      onSecondaryContainer: Color(0xffb9eaff),
      tertiary: Color(0xffffb59e),
      onTertiary: Color(0xff561f0d),
      tertiaryContainer: Color(0xff723521),
      onTertiaryContainer: Color(0xffffdbd0),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color.fromARGB(255, 25, 34, 41),
      onSurface: Color(0xffe0e3e8),
      onSurfaceVariant: Color(0xffc1c7ce),
      outline: Color(0xff8b9198),
      outlineVariant: Color(0xff41474d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e8),
      inversePrimary: Color.fromARGB(255, 39, 78, 104),
      primaryFixed: Color(0xffcbe6ff),
      onPrimaryFixed: Color(0xff001e30),
      primaryFixedDim: Color(0xff97ccf8),
      onPrimaryFixedVariant: Color(0xff004b71),
      secondaryFixed: Color(0xffb9eaff),
      onSecondaryFixed: Color(0xff001f29),
      secondaryFixedDim: Color(0xff89d0ed),
      onSecondaryFixedVariant: Color(0xff004d62),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff3a0b00),
      tertiaryFixedDim: Color(0xffffb59e),
      onTertiaryFixedVariant: Color(0xff723521),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff363a3e),
      surfaceContainerLowest: Color(0xff0b0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff262a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbee0ff),
      surfaceTint: Color(0xff97ccf8),
      onPrimary: Color(0xff00283f),
      primaryContainer: Color(0xff6096c0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color.fromARGB(255, 1, 16, 30),
      onSecondary: Color.fromARGB(255, 246, 253, 255),
      secondaryContainer: Color(0xff519ab5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd3c6),
      onTertiary: Color(0xff471505),
      tertiaryContainer: Color(0xffcb7c64),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101417),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd7dde4),
      outline: Color(0xffadb2ba),
      outlineVariant: Color(0xff8b9198),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e8),
      inversePrimary: Color(0xff034c72),
      primaryFixed: Color(0xffcbe6ff),
      onPrimaryFixed: Color(0xff001321),
      primaryFixedDim: Color(0xff97ccf8),
      onPrimaryFixedVariant: Color(0xff003a58),
      secondaryFixed: Color(0xffb9eaff),
      onSecondaryFixed: Color(0xff00141b),
      secondaryFixedDim: Color(0xff89d0ed),
      onSecondaryFixedVariant: Color(0xff003b4c),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff280500),
      tertiaryFixedDim: Color(0xffffb59e),
      onTertiaryFixedVariant: Color(0xff5d2512),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff414549),
      surfaceContainerLowest: Color(0xff05080b),
      surfaceContainerLow: Color(0xff1a1e22),
      surfaceContainer: Color(0xff24282c),
      surfaceContainerHigh: Color(0xff2f3337),
      surfaceContainerHighest: Color(0xff3a3e42),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe5f1ff),
      surfaceTint: Color(0xff97ccf8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff93c8f4),
      onPrimaryContainer: Color(0xff000c18),
      secondary: Color(0xffdcf4ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff85cce9),
      onSecondaryContainer: Color(0xff000d13),
      tertiary: Color(0xffffece7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffaf97),
      onTertiaryContainer: Color(0xff1e0300),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101417),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffebf0f8),
      outlineVariant: Color(0xffbdc3ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e3e8),
      inversePrimary: Color(0xff034c72),
      primaryFixed: Color(0xffcbe6ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff97ccf8),
      onPrimaryFixedVariant: Color(0xff001321),
      secondaryFixed: Color(0xffb9eaff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff89d0ed),
      onSecondaryFixedVariant: Color(0xff00141b),
      tertiaryFixed: Color(0xffffdbd0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb59e),
      onTertiaryFixedVariant: Color(0xff280500),
      surfaceDim: Color(0xff101417),
      surfaceBright: Color(0xff4d5055),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1c2024),
      surfaceContainer: Color(0xff2d3135),
      surfaceContainerHigh: Color(0xff383c40),
      surfaceContainerHighest: Color(0xff43474b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
