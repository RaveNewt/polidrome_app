import 'package:flutter/material.dart';
import 'package:polidrome/pages/second_page.dart';
import 'package:polidrome/theme.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _check = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String message = '';
    String value = 'First Screen';

    void functionMessage() async {
      String original = _check.text.replaceAll(' ', '');
      String reverse = original.replaceAll(' ', '').split('').reversed.join('');
      print(original);

      String status = '';
      if (original == reverse) {
        status = 'Its A Palindrome';
        print('true');
      }
      if (original != reverse) {
        status = 'Its A Not Palindrome';
        print(reverse);
        print('false');
      }
      setState((() => message = status));
      return showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Polidrome'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(status,
                        style: textBlack.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                            color: primaryColor)),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Done',
                      style: textBlack.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                          color: primaryColor)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    Widget background() {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget foto() {
      return Container(
        margin: EdgeInsets.only(top: 154),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ic_photo.png',
              width: 116,
              height: 116,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
          width: 310,
          margin: EdgeInsets.only(
            top: 58,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (text) {
                  value = text;
                },
                cursorColor: greyColor.withOpacity(0.3),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: textBlack.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Name',
                  hintStyle: textGrey.copyWith(
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ));
    }

    Widget checkInput() {
      return Container(
          width: 310,
          margin: EdgeInsets.only(top: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _check,
                cursorColor: greyColor.withOpacity(0.3),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: textBlack.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Polindrome',
                  hintStyle: textGrey.copyWith(
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ));
    }

    Widget checkButton() {
      return Container(
        margin: EdgeInsets.only(top: 45),
        width: 310,
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {
            functionMessage();
          },
          child: Text(
            'Check',
            style: textWhite.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget nextButton() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        width: 310,
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondPage(
                          value: value,
                        )));
          },
          child: Text(
            'Next',
            style: textWhite.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Stack(
      children: [
        background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              foto(),
              nameInput(),
              checkInput(),
              checkButton(),
              nextButton(),
            ],
          )),
        ),
      ],
    );
  }
}
