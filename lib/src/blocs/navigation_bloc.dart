import 'package:rxdart/rxdart.dart';
import '../mixins/navigatable_page_mixin.dart';

/// The [NavigationBloc] governs the main navigation of the app.
class NavigationBloc {
  /// The [NavigationBloc] is initialised with the index of the currently
  /// selected [NavigatablePage] named [selectedIndex] and a [List<NavigatablePage>]
  /// of [NavigatablePage] instance available for selection, named [pages].
  NavigationBloc({
    int selectedIndex,
    List<NavigatablePage> pages,
  }) : _pages = pages ?? [] {
    _selectedIndex = BehaviorSubject<int>(seedValue: selectedIndex);
    _selectedNavigatablePage = BehaviorSubject<NavigatablePage>();

    setSelectedIndex(selectedIndex);
  }

  /// A [BehaviorSubject] of the selected index.
  static BehaviorSubject<int> _selectedIndex;

  /// A [BehaviorSubject] of the selected [NavigatablePage].
  static BehaviorSubject<NavigatablePage> _selectedNavigatablePage;

  /// The list of [NavigatablePage] instances available to the app.
  final List<NavigatablePage> _pages;

  /// The publicly observable selected index.
  Observable<int> get selectedIndex => _selectedIndex.distinct();

  /// The publicly observable selected [NavigatablePage].
  Observable<NavigatablePage> get selectedNavigatablePage =>
      _selectedNavigatablePage.distinct();

  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
    _selectedNavigatablePage.add(_pages[index]);
  }
}
