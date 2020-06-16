import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/const/customColor.dart';
import 'package:islami/const/lang.dart';
import 'package:islami/modules/articles/screens/add_article_view.dart';
import 'package:islami/modules/home/widgets/articles_item.dart';
import 'package:islami/modules/home/widgets/custom_appbar.dart';
import 'package:islami/modules/home/widgets/name_and_hello.dart';
import 'package:islami/modules/home/widgets/quotes_image.dart';
import 'package:islami/modules/home/widgets/tab_categories.dart';
import 'package:islami/modules/question_and_answer/screens/ask_view.dart';
import 'package:islami/modules/quotes/screens/add_photo_view.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProv = Provider.of<LoginService>(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              CustomAppBar(
                urlimage: profileProv.profileModel.urlimage,
              ),
              NameAndHello(
                name: profileProv.profileModel.name,
              ),
              SizedBox(height: 25),
              // TabCategories(title: xKategori),
              // SizedBox(height: 20),
              QuotesImage(title: xRekomendasi),
              SizedBox(height: 20),
              ArticlesItems(title: xArtikelMenarik),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        backgroundColor: Color(primaryColor),
        child: Icon(Icons.add),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                IconButtomModal(
                  name: xUploadGambar,
                  icon: xUrlUploadQuotesIcon,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPhotoView(),
                        ));
                  },
                ),
                IconButtomModal(
                  name: xBuatArtikel,
                  icon: xUrlArticlesIcon,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddArticleView(),
                        ));
                  },
                ),
                IconButtomModal(
                  name: xBuatPertanyaan,
                  icon: xUrlQuestionIcon,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AskView(),
                        ));
                  },
                ),
              ],
            ),
          );
        });
  }
}

class IconButtomModal extends StatelessWidget {
  final String name;
  final String icon;
  final Function onTap;
  IconButtomModal({this.icon, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SvgPicture.asset(icon, height: 30),
        title: Text(name),
        onTap: onTap);
  }
}
