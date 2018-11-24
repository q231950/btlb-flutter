import 'package:rxdart/rxdart.dart';
import '../models/settings.dart';

class SettingsBloc {
  final BehaviorSubject<Settings> _settings =
      BehaviorSubject<Settings>(seedValue: Settings());

  Observable<Settings> get settings => _settings.stream;

  void selectTheme(ThemeSelection selection) {
    _settings.value.themeSelection = selection;
    _settings.add(_settings.value);
  }

  void dispose() {
    _settings.close();
  }
}
