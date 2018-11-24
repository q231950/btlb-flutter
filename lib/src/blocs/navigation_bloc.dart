import 'package:rxdart/rxdart.dart';
import '../mixins/titled_page_mixin.dart';

class NavigationBloc {
  NavigationBloc({
    int selectedIndex,
    List<TitledPage> widgets,
  }) : _widgets = widgets ?? [] {
    _selectedIndex = BehaviorSubject<int>(seedValue: selectedIndex);
    _selectedWidget = BehaviorSubject<TitledPage>();

    setSelectedIndex(selectedIndex);
  }

  static BehaviorSubject<int> _selectedIndex;
  static BehaviorSubject<TitledPage> _selectedWidget;

  final List<TitledPage> _widgets;

  Observable<int> get selectedIndex => _selectedIndex.distinct();
  Observable<TitledPage> get selectedWidget => _selectedWidget.distinct();

  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
    _selectedWidget.add(_widgets[index]);
  }
}
