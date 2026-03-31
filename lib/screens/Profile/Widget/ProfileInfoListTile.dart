import 'package:flutter/material.dart';

class ProfileInfoListTile extends StatelessWidget {
  final String leading, trailing;

  const ProfileInfoListTile({
    super.key,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leading,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
      ),
    );
  }
}
