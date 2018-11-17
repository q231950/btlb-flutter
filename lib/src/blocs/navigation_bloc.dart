import 'package:rxdart/rxdart.dart';
import 'package:flutter/widgets.dart';

class NavigationBloc {
  NavigationBloc({
    int selectedIndex,
    List<Widget> widgets,
  }) : _widgets = widgets ?? [] {
    _selectedIndex = BehaviorSubject<int>(seedValue: selectedIndex);
    _selectedWidget = BehaviorSubject<Widget>(seedValue: _emptyWidget());
    
    setSelectedIndex(selectedIndex);
  }

  static BehaviorSubject<int> _selectedIndex;
  static BehaviorSubject<Widget> _selectedWidget;
  final List<Widget> _widgets;
  
  Observable<int> get selectedIndex => _selectedIndex.distinct();
  Observable<Widget> get selectedWidget => _selectedWidget.distinct();
  
  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
    _selectedWidget.add(_widgets[index]);
  }

  Widget _emptyWidget() => Text('nothing to see here');
}