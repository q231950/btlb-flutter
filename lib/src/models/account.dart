class Account {
  Account({String identifier, String password}) : 
  _identifier = identifier,
  _password = password;

  final String _identifier;
  String get identifier => _identifier;

  final String _password;
  String get password => _password;
}
