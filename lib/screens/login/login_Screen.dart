import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/services/auth.dart';
import '../appBar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.auth,this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum FormType { login, register }

class _LoginScreenState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in : ($userId)');
        } else {
          String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
          print('Created User : ($userId)');
        }
        widget.onSignedIn();
      } catch (e) {
        print(e);
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 0),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: "Email"),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        ElevatedButton(
          onPressed: validateAndSubmit,
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
            onPressed: moveToRegister,
            child: Text(
              'Create an account',
              style: TextStyle(fontSize: 20),
            ))
      ];
    } else {
      return [
        ElevatedButton(
          onPressed: validateAndSubmit,
          child: Text(
            'Create an Account',
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
            onPressed: moveToLogin,
            child: Text(
              'Have an Account? Login',
              style: TextStyle(fontSize: 20),
            ))
      ];
    }
  }
}
