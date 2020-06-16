import 'package:flutter/material.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/modules/articles/services/article_service.dart';
import 'package:islami/modules/profile/services/profile_services.dart';
import 'package:islami/modules/question_and_answer/services/ask_service.dart';
import 'package:islami/modules/quotes/services/quotes_service.dart';
import 'package:islami/modules/shalat/services/shalat_services.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:islami/modules/splash/screens/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Islami',
        theme: ThemeData(primaryColor: Color(primaryColor)),
        home: SplashView(),
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => LoginService.instance()),
        ChangeNotifierProvider(create: (context) => ProfileService()),
        ChangeNotifierProvider(create: (context) => ShalatService()),
        ChangeNotifierProvider(create: (context) => QuotesService()),
        ChangeNotifierProvider(create: (context) => ArticleService()),
        ChangeNotifierProvider(create: (context) => AskService()),
      ],
    );
  }
}
