import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  AccountPage();

  static const routeName = "/account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Column(
        children: <Widget>[
          Center(child: Text("account data")),
          FlatButton.icon(
            label: Text('done'),
            icon: Icon(Icons.assignment_turned_in),
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
