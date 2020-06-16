import 'package:flutter/material.dart';
import 'package:islami/modules/quotes/models/quotes_model.dart';
import 'package:islami/modules/quotes/widgets/image_appbar_quotes.dart';
import 'package:islami/modules/quotes/widgets/postDescription.dart';
import 'package:islami/modules/quotes/widgets/quotes_comments.dart';
import 'package:provider/provider.dart';
import 'package:islami/modules/quotes/services/quotes_service.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';

class QuotesDetailView extends StatelessWidget {
  final QuotesModel quotes;
  QuotesDetailView({this.quotes});

  @override
  Widget build(BuildContext context) {
    final quotesProv = Provider.of<QuotesService>(context);
    final loginProv = Provider.of<LoginService>(context);

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 9,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ImageAndAppbarQuotes(quotes: quotes),
                    SizedBox(height: 20),
                    PostDescription(quotes: quotes),
                    QuotesComments(quotes: quotes),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: quotesProv.commentCtrl,
                        decoration: InputDecoration(
                          hintText: "Tulis komentar..",
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        quotesProv.addComment(quotes.id, {
                          "name": loginProv.profileModel.name,
                          "nameId": loginProv.profileModel.id,
                          "urlimage": loginProv.profileModel.urlimage,
                          "comment": quotesProv.commentCtrl.text,
                        }).then((value) {
                          quotesProv.commentCtrl.clear();
                        });
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
