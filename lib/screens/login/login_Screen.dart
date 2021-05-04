import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/services/authProvider.dart';
import 'components/loginAppBar.dart';
import 'components/elevatedButton.dart';
import 'components/messageBuilder.dart';
import 'components/navigationBuilder.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.onSignedIn});
  final VoidCallback onSignedIn;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum FormType { login, register }

class _LoginScreenState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();
  bool _isLoading = false;

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      setState(() {
        _isLoading = false;
      });
      return false;
    }
  }

  void validateAndSubmit() async {
    setState(() {
      _isLoading = true;
    });
    if (validateAndSave()) {
      try {
        var auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          String userId =
              await auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in : ($userId)');
        } else {
          String userId = await auth
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
      appBar: buildLoginAppBar(),
      body: SafeArea(
        child: Padding(
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
                      style: GoogleFonts.zeyada(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              _formType == FormType.login
                  ? messageBuilder('Login Now.')
                  : messageBuilder('Register Now.'),
              _formType == FormType.login
                  ? navigationBuilder(
                      'If you are new / ', 'Create New', moveToRegister)
                  : navigationBuilder(
                      'Already have an account / ', 'Login Page', moveToLogin),
              formBuilder(),
              _formType == FormType.login
                  ? Row(children: [
                      Text(
                        'Forgot Password? / ',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ])
                  : SizedBox(
                      height: 24,
                    ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  child: _formType == FormType.login
                      ? buildElevatedButton(
                          'Login', Colors.blueAccent, validateAndSubmit,_isLoading)
                      : buildElevatedButton('Create an Account',
                          Colors.blueAccent, validateAndSubmit,_isLoading)),
            ],
          ),
        ),
      ),
    );
  }

  Padding formBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                  onSaved: (value) => _email = value,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
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
    );
  }
}
