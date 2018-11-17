import 'package:rxdart/rxdart.dart';
import 'package:flutter/widgets.dart';

class NavigationBloc {
  NavigationBloc({
    int selectedIndex,
    List<String> titles,
    List<Widget> widgets,
  }) : _widgets = widgets ?? [], 
  _titles = titles ?? [] {
    _selectedIndex = BehaviorSubject<int>(seedValue: selectedIndex);
    _selectedWidget = BehaviorSubject<Widget>(seedValue: _emptyWidget());
    _selectedTitle = BehaviorSubject<String>(seedValue: '');

    setSelectedIndex(selectedIndex);
  }

  static BehaviorSubject<int> _selectedIndex;
  static BehaviorSubject<Widget> _selectedWidget;
  static BehaviorSubject<String> _selectedTitle;
  final List<Widget> _widgets;
  final List<String> _titles;

  Observable<int> get selectedIndex => _selectedIndex.distinct();
  Observable<Widget> get selectedWidget => _selectedWidget.distinct();
  Observable<String> get selectedTitle => _selectedTitle.distinct();

  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
    _selectedWidget.add(_widgets[index]);
    _selectedTitle.add(_titles[index]);
  }

  Widget _emptyWidget() => Text('nothing to see here');
}
