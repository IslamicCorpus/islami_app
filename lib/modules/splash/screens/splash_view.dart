import 'package:flutter/material.dart';
import 'package:islami/modules/sign_in/screens/sign_in_view.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';
import 'package:islami/modules/bottomNavBar.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);
    if (user.status == Status.Authenticated) {
      return BottonNavBar();
    }
    if (user.status == Status.Unauthenticated ||
        user.status == Status.Authenticating) return SignInView();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Hero(
            tag: 'logoapp',
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/logoapp.png'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black12,
            ),
          ),
        ),
      ),
    );
  }
}
