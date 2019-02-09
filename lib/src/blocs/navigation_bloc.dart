import 'package:rxdart/rxdart.dart';
import '../mixins/navigatable_page_mixin.dart';

class NavigationBloc {
  NavigationBloc({
    int selectedIndex,
    List<NavigatablePage> widgets,
  }) : _widgets = widgets ?? [] {
    _selectedIndex = BehaviorSubject<int>(seedValue: selectedIndex);
    _selectedNavigationItem = BehaviorSubject<NavigatablePage>();

    setSelectedIndex(selectedIndex);
  }

  static BehaviorSubject<int> _selectedIndex;
  static BehaviorSubject<NavigatablePage> _selectedNavigationItem;

  final List<NavigatablePage> _widgets;

  Observable<int> get selectedIndex => _selectedIndex.distinct();
  Observable<NavigatablePage> get selectedWidget =>
      _selectedNavigationItem.distinct();

  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
    _selectedNavigationItem.add(_widgets[index]);
  }
}
