import 'package:flutter/material.dart';

// ---------- COLOR SCHEMES ----------
final lightScheme = ColorScheme.fromSeed(
  seedColor: Colors.redAccent,
  brightness: Brightness.light,
);

final darkScheme = ColorScheme.fromSeed(
  seedColor: Colors.redAccent,
  brightness: Brightness.dark,
);

// ---------- LIGHT THEME ----------
final ThemeData light = ThemeData(
  useMaterial3: true,
  colorScheme: lightScheme,

  appBarTheme: AppBarTheme(
    backgroundColor: lightScheme.primaryContainer,
    foregroundColor: lightScheme.onSurface,
  ),

  cardTheme: CardThemeData(
    color: lightScheme.secondaryContainer,
    surfaceTintColor: lightScheme.primaryContainer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  drawerTheme: DrawerThemeData(
    backgroundColor: lightScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
    ),
  ),

  listTileTheme: ListTileThemeData(
    iconColor: lightScheme.primary,
    textColor: lightScheme.onSurface,
    selectedColor: lightScheme.primary,
    selectedTileColor: lightScheme.primaryContainer,
  ),

  iconTheme: IconThemeData(color: lightScheme.primary),
);

// ---------- DARK THEME ----------
final ThemeData dark = ThemeData(
  useMaterial3: true,
  colorScheme: darkScheme,

  appBarTheme: AppBarTheme(
    backgroundColor: darkScheme.primaryContainer,
    foregroundColor: darkScheme.onSurface,
  ),

  cardTheme: CardThemeData(
    color: darkScheme.secondaryContainer,
    surfaceTintColor: darkScheme.primaryContainer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  drawerTheme: DrawerThemeData(
    backgroundColor: darkScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
    ),
  ),

  listTileTheme: ListTileThemeData(
    iconColor: darkScheme.primary,
    textColor: darkScheme.onSurface,
    selectedColor: darkScheme.primary,
    selectedTileColor: darkScheme.primaryContainer,
  ),

  iconTheme: IconThemeData(color: darkScheme.primary),
);
