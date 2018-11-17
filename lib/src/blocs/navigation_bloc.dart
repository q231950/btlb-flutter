import 'package:rxdart/rxdart.dart';

class NavigationBloc {
  final _selectedIndex = BehaviorSubject<int>(seedValue: 0);
  
  Observable<int> get selectedIndex => _selectedIndex.distinct();
  
  void setSelectedIndex(int index) {
    _selectedIndex.add(index);
  }
}