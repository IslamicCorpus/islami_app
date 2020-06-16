import 'package:flutter/material.dart';
import 'package:islami/modules/profile/services/profile_services.dart';
import 'package:islami/modules/sign_in/services/login_service.dart';
import 'package:islami/const/customColor.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class ProfileImageWidget extends StatefulWidget {
  final String urlimage;
  ProfileImageWidget({this.urlimage});

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    final profileProv = Provider.of<ProfileService>(context);
    final loginProv = Provider.of<LoginService>(context);
    void showToast(String msg, {int duration, int gravity}) {
      Toast.show(msg, context, duration: duration, gravity: gravity);
    }

    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.black12,
            backgroundImage: NetworkImage(widget.urlimage),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color(primaryColor),
                child: IconButton(
                  icon: Icon(Icons.camera_enhance),
                  color: Colors.white,
                  iconSize: 25,
                  onPressed: () {
                    profileProv
                        .chooseFile(loginProv.profileModel.id)
                        .then((value) {
                      showToast(
                        "Foto profile berhasil diubah.\nRestart aplikasi untuk memperbarui",
                        duration: Toast.LENGTH_LONG,
                      );
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }
}
