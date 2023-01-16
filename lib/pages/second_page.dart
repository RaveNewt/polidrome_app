import 'package:flutter/material.dart';
import 'package:polidrome/model/user_model.dart';
import 'package:polidrome/theme.dart';

class SecondPage extends StatefulWidget {
  final String? value;
  final String? first_name;
  final String? last_name;
  final UserModel? user;

  SecondPage({Key? key, this.value, this.first_name, this.last_name, this.user})
      : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final UserModel user;
    Widget statusBar() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Status_Bar.png',
              width: 375,
              height: 50,
            ),
          ],
        ),
      );
    }

    Widget header() {
      return Container(
        padding: EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Image.asset(
                'assets/Stroke_1.png',
                width: 18,
                height: 18,
              ),
            ),
            SizedBox(width: 84),
            Center(
              child: Text(
                'Second Screen',
                style: textBlack.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget welcome() {
      return Container(
        margin: EdgeInsets.only(top: 13),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text(
          'Welcome',
          style: textBlack.copyWith(
            fontSize: 12,
            fontWeight: regular,
          ),
        ),
      );
    }

    Widget getName() {
      return Container(
        margin: EdgeInsets.only(top: 4),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: widget.value == null || widget.value!.isEmpty
            ? Text(
                'Ihsan',
                style: textBlack.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              )
            : Text(
                widget.value.toString(),
                style: textBlack.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
      );
    }

    Widget userSelectedName() {
      return Expanded(
        child: Align(
          alignment: Alignment.center,
          heightFactor: 1,
          child: widget.first_name == null || widget.first_name!.isEmpty
              ? Text(
                  'Selected User Name',
                  style: textBlack.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                )
              : Text(
                  '${widget.first_name} ${widget.last_name}',
                  style: textBlack.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
        ),
      );
    }

    Widget chooseButton() {
      return Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 310,
            height: 48,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Text(
                'Choose a User',
                style: textWhite.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              statusBar(),
              header(),
              welcome(),
              getName(),
              userSelectedName(),
              chooseButton(),
            ],
          ),
        ),
      ),
    );
  }
}
