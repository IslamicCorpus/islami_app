import 'package:flutter/material.dart';

class AnswerView extends StatelessWidget {
  final String question;
  AnswerView({this.question});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jawab Pertanyaan"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black12,
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                child: Text(
                  question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 17.0),
                  width: double.infinity,
                  child: TextField(
                    maxLines: 10,
                    maxLength: 100,
                    decoration: InputDecoration(
                      hintMaxLines: 5,
                      labelText: "Tulis jawabanmu di sini",
                      helperMaxLines: 10,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
