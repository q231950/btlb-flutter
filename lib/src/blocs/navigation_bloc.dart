import 'package:rxdart/rxdart.dart';
import '../mixins/titled_page_mixin.dart';

class NavigationBloc {
  NavigationBloc({
    int selectedIndex,
    List<TitledPage> widgets,
  }) : _widgets = widgets ?? [] {
    _selectedIndex = BehaviorSubject<int>(seedValue: selectedIndex);
    _selectedNavigationItem = BehaviorSubject<TitledPage>();

    setSelectedIndex(selectedIndex);
  }

  static BehaviorSubject<int> _selectedIndex;
  static BehaviorSubject<TitledPage> _selectedNavigationItem;

  final List<TitledPage> _widgets;

  Observable<int> get selectedIndex => _selectedIndex.distinct();
  Observable<TitledPage> get selectedWidget =>
      _selectedNavigationItem.distinct();

  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
    _selectedNavigationItem.add(_widgets[index]);
  }
}
