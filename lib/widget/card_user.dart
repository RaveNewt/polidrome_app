import 'package:polidrome/model/user_model.dart';

import 'package:flutter/material.dart';
import 'package:polidrome/theme.dart';

class CardUser extends StatelessWidget {
  final UserModel user;
  const CardUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 80,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: blackColor,
          ),
          color: whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundImage: user.avatar == null || user.avatar!.isEmpty
                    ? const AssetImage(
                        'assets/ic_photo.png',
                      )
                    : NetworkImage(user.avatar!) as ImageProvider,
              ),
            ),
            Center(
              heightFactor: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.first_name} ${user.last_name}',
                    style: textBlack.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '${user.email}',
                    style: textBlack.copyWith(
                      fontSize: 15,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
