import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/services/auth.dart';
import '../appBar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.auth, this.onSignedIn});
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
        print('validated');
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in : ($userId)');
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.adb, color: Colors.black),
          onPressed: () {},
          iconSize: 40,
        ),
        actions: [
          Icon(
            Icons.arrow_back_ios,
            color: Colors.pink,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  Text(
                    'Hey',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            _formType == FormType.login ? messageBuilder('Login Now.') :messageBuilder('Register Now.'),
            _formType == FormType.login ? navigationBuilder('If you are new / ','Create New',moveToRegister) : navigationBuilder('Already have an account / ','Login Page',moveToLogin) ,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        title: TextFormField(
                          cursorHeight: 30,
                          decoration: InputDecoration(
                              labelText: "Email",
                              isCollapsed: true,
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontWeight: FontWeight.w300),
                              hasFloatingPlaceholder: false),
                          validator: (value) =>
                              value.isEmpty ? 'Email can\'t be empty' : null,
                          onSaved: (value) => _email = value,
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        title: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: InputBorder.none,
                              isCollapsed: true,
                              labelStyle: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontWeight: FontWeight.w300),
                              hasFloatingPlaceholder: false),
                          validator: (value) =>
                              value.isEmpty ? 'Password can\'t be empty' : null,
                          obscureText: true,
                          onSaved: (value) => _password = value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _formType == FormType.login
                ? Row(children: [
                    Text(
                      'Forgot Password? / ',
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.w100),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  ])
                : Container(),
            SizedBox(height: 50),
            Container(
                color: Colors.pink,
                height: 50,
                child: _formType == FormType.login
                    ? buildElevatedButton('Login')
                    : buildElevatedButton('Create an Account')),
          ],
        ),
      ),
    );
  }

  Row messageBuilder(text1) {
    return Row(
            children: [
              Text(
                text1,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
  }

  Padding navigationBuilder(String text1, String text2, Function navigationFunction) {
    return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      color: Colors.black26,
                      fontSize: 15,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.w100),
                ),
                GestureDetector(
                  onTap: () {
                    navigationFunction();
                  },
                  child: Text(
                    text2,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w200),
                  ),
                )
              ],
            ),
          );
  }

  // Widget buildSubmitButtons() {
  //
  // }

  ElevatedButton buildElevatedButton(String text) {
    return ElevatedButton(
      onPressed: validateAndSubmit,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          primary: Colors.pinkAccent,
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
