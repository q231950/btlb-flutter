enum ThemeSelection { light, dark }

class Settings {
  Settings() {
    themeSelection = ThemeSelection.light;
  }
  ThemeSelection themeSelection;
}