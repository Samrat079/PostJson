import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Models/User/User.dart';
import 'ProfileInfoListTile.dart';

class Profileinfocard extends StatelessWidget {
  final User user;

  const Profileinfocard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ProfileInfoListTile(leading: "Username", trailing: user.username),
          ProfileInfoListTile(leading: "Firstname", trailing: user.firstName),
          ProfileInfoListTile(leading: "Lastname", trailing: user.lastName),
          ProfileInfoListTile(leading: "Email", trailing: user.email),
          ProfileInfoListTile(leading: "Phone", trailing: user.phone),
          ProfileInfoListTile(leading: "BirthDay", trailing: user.birthDate),
        ],
      ),
    );
  }
}
