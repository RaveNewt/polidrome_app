import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polidrome/bloc/user/user_bloc.dart';
import 'package:polidrome/model/user_model.dart';
import 'package:polidrome/pages/second_page.dart';
import 'package:polidrome/theme.dart';
import 'package:polidrome/widget/card_user.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context);
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
                'Third Screen',
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

    Widget listUser() {
      return BlocProvider(
        create: (context) => UserBloc()..add(UserGet()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Container(
                child: Column(
                  children: state.users.map((user) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              first_name: user.first_name,
                              last_name: user.last_name,
                              user: user,
                            ),
                          ),
                        );
                      },
                      child: CardUser(user: user),
                    );
                  }).toList(),
                ),
              );
            } else {
              return Center(
                child: Text('Error'),
              );
            }
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                statusBar(),
                header(),
                listUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
