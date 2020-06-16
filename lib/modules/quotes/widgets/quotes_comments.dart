import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islami/modules/quotes/services/quotes_service.dart';
import 'package:islami/modules/quotes/models/quotes_model.dart';
import 'package:islami/modules/quotes/models/comments_model.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';

class QuotesComments extends StatelessWidget {
  final QuotesModel quotes;
  QuotesComments({this.quotes});
  @override
  Widget build(BuildContext context) {
    final quotesProv = Provider.of<QuotesService>(context);
    final loginProv = Provider.of<LoginService>(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: FutureBuilder<List<CommentModel>>(
          future: quotesProv.getComments(quotes.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: CircularProgressIndicator());
            }

            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final comment = snapshot.data[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.black12,
                        backgroundImage: NetworkImage(comment.urlimage),
                      ),
                      title: Text(
                        comment.name,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      subtitle: Text(
                        comment.comment,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      trailing: comment.nameId == loginProv.profileModel.id
                          ? IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: FlatButton(
                                        child: Text("Hapus"),
                                        onPressed: () {
                                          quotesProv
                                              .removeComment(
                                                  quotes.id, comment.id)
                                              .then((value) =>
                                                  quotesProv.showToast(
                                                      "Berhasil dihapus",
                                                      context));
                                        },
                                      ),
                                      actions: <Widget>[],
                                    );
                                  },
                                );
                              },
                            )
                          : null,
                    );
                  }),
            );
          }),
    );
  }
}
