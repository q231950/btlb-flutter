import 'package:rxdart/rxdart.dart';
import '../mixins/navigatable_page_mixin.dart';

/// The [NavigationBloc] governs the main navigation of the app.
class NavigationBloc {
  /// The [NavigationBloc] is initialised with the index of the currently
  /// selected [NavigatablePage] named [selectedIndex] and a [List<NavigatablePage>]
  /// of [NavigatablePage] instance available for selection, named [pages].
  NavigationBloc({
    int selectedIndex,
  }) {
    _selectedIndex = BehaviorSubject<int>(seedValue: selectedIndex);
    setSelectedIndex(selectedIndex);
  }

  /// A [BehaviorSubject] of the selected index.
  static BehaviorSubject<int> _selectedIndex;

  /// The publicly observable selected index.
  Observable<int> get selectedIndex => _selectedIndex.distinct();

  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
  }
}
