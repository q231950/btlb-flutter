import 'package:rxdart/rxdart.dart';

/// The [NavigationSelection] is used to specify the currently selected navigation element
enum NavigationSelection { Accounts, Settings }

/// The [NavigationBloc] governs the main navigation of the app.
class NavigationBloc {
  /// The [NavigationBloc] is initialised with the [NavigationSelection] of the currently
  /// selected item, the [selection].
  NavigationBloc({
    NavigationSelection selection,
  }) {
    _selection = BehaviorSubject<NavigationSelection>(seedValue: selection);
    setSelection(selection);
  }

  /// A [BehaviorSubject] of the selection.
  static BehaviorSubject<NavigationSelection> _selection;

  /// The publicly observable selection.
  Observable<NavigationSelection> get selection => _selection.distinct();

  void setSelection(NavigationSelection selection) {
    _selection.add(selection);
  }
}
