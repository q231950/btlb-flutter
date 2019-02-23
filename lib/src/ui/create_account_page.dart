import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateAccountPageState();

  static const String routeName = "create_account";
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var form = _form();
    return Scaffold(
      appBar: AppBar(
        title: Text("New Account"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            tooltip: "save",
            onPressed: () {
              _handleSave(context);
            },
          )
        ],
      ),
      body: form,
    );
  }

  void _handleSave(BuildContext context) {
    final FormState form = _formKey.currentState;
    var valid = form.validate();
    if (valid) {
      print("save...");
    } else {
      print("fill all fields");
    }
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[_accountFormField(), _passwordFormField()],
      ),
    );
  }

  FormField _accountFormField() {
    return FormField<String>(
      enabled: true,
      builder: (state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.account_box),
            labelText: 'Account',
          ),
          keyboardType: TextInputType.text,
          onSaved: (String value) {
            print("onSaved");
          },
          inputFormatters: <TextInputFormatter>[
            BlacklistingTextInputFormatter.singleLineFormatter
          ],
        );
      },
      validator: _filledFormFieldValidator,
    );
  }

  FormField _passwordFormField() {
    return FormField(
        enabled: true,
        builder: (state) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              icon: Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
            keyboardType: TextInputType.text,
            obscureText: _obscureText,
            autocorrect: false,
            validator: _filledFormFieldValidator,
          );
        });
  }

  String _filledFormFieldValidator(String s) {
    if (s != null) {
      return s.length > 0 ? null : "asd";
    }
    return "this field is required";
  }
}
