
import 'package:flutter/material.dart';
import 'package:spotegal/respository/loginRepository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginRespository loginRespository = LoginRespository();
  login() async {
    await loginRespository.handleSignIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: login,
          child: Image.asset(
            "././assets/img/google.png",
            height: 60,
          ),
        ),
      ),
    );
  }
}
