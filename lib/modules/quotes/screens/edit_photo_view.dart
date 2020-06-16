import 'package:flutter/material.dart';
import 'package:islami/modules/quotes/models/quotes_model.dart';
import 'package:islami/modules/quotes/services/quotes_service.dart';
import 'package:provider/provider.dart';

class EditPhotoView extends StatelessWidget {
  final QuotesModel quotes;
  EditPhotoView({this.quotes});

  @override
  Widget build(BuildContext context) {
    final quotesProv = Provider.of<QuotesService>(context);
    final captionCtrl = TextEditingController(text: quotes.caption);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Info"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.done,
              color: Colors.white,
            ),
            onPressed: () {
              quotesProv
                  .updateDocument(
                    quotes.id,
                    {"caption": captionCtrl.text},
                  )
                  .then((value) => Navigator.pop(context))
                  .then((value) =>
                      quotesProv.showToast("Caption berhasil diubah", context));
            },
          )
        ],
      ),
      body: Container(
        child: Form(
          key: quotesProv.formKey,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 12),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black12,
                          backgroundImage: NetworkImage(quotes.urlimagesender),
                        ),
                        title: Text(
                          quotes.sender,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 300.0,
                        child: Image.network(
                          quotes.urlimage,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    controller: captionCtrl,
                    decoration:
                        InputDecoration(hintText: "Tulis sebuah caption..."),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
