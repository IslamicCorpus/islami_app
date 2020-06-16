import 'package:flutter/material.dart';
import 'package:islami/modules/quotes/models/quotes_model.dart';
import 'package:islami/modules/quotes/screens/edit_photo_view.dart';
import 'package:islami/modules/quotes/services/quotes_service.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';

class PostDescription extends StatelessWidget {
  final QuotesModel quotes;
  PostDescription({this.quotes});

  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginService>(context);
    final quotesProv = Provider.of<QuotesService>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black12,
            backgroundImage: NetworkImage(quotes.urlimagesender),
          ),
          title: Text(
            quotes.sender,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: quotes.senderId == loginProv.profileModel.id
              ? IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditPhotoView(quotes: quotes)));
                                  },
                                  child: Text("Edit"),
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    quotesProv
                                        .removeDocument(quotes.id)
                                        .then((value) => Navigator.pop(context))
                                        .then((value) => Navigator.pop(context))
                                        .then((value) => quotesProv.showToast(
                                            "Gambar berhasil dihapus",
                                            context));
                                  },
                                  child: Text("Hapus"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  })
              : null,
        ),
        SizedBox(height: 17),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            quotes.caption,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(height: 17),
      ],
    );
  }
}
