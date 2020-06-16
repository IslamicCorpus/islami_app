import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/const/lang.dart';
import 'package:islami/modules/question_and_answer/screens/ask_view.dart';

class HeaderQAndA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(
          xUrlAskIcon,
          width: double.infinity,
          height: 200,
        ),
        Center(
          child: Text(
            "Mau tanya apa ?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AskView(),
                  ));
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            color: Color(primaryColor),
            child: Text(
              "Tanya",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
