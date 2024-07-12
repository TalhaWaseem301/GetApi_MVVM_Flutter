import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, RoutesName.home);
          },
          child: Text("Click"),
        ),
      )
    );
  }
}