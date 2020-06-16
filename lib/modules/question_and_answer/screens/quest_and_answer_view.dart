import 'package:flutter/material.dart';
import 'package:islami/modules/question_and_answer/services/ask_service.dart';

import 'package:islami/modules/question_and_answer/widgets/header_q_and_a.dart';
import 'package:islami/modules/question_and_answer/widgets/q_and_a_card.dart';
import 'package:provider/provider.dart';

class QuestAndAnswerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final askProv = Provider.of<AskService>(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            HeaderQAndA(),
            FutureBuilder(
                future: askProv.getDataCollection(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return QAndACard(ask: snapshot.data[index]);
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
