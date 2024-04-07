import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/rounded_button.dart';
import 'package:flash_chat/screen/login_screen.dart';
import 'package:flash_chat/screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.white, end: Colors.blueAccent)
        .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset('images/light.png', fit: BoxFit.fill),
                      height: 60.0,
                    ),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Chat Up',
                            speed: Duration(milliseconds: 400)),
                      ],
                      totalRepeatCount: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                  color: Colors.lightBlueAccent,
                  text: 'Log In',
                  Ontap: () {
                    setState(() {
                      Navigator.pushNamed(context, LoginScreen.id);
                    });
                  }),
              RoundedButton(
                color: Colors.blueAccent,
                text: 'Register',
                Ontap: () {
                  setState(() {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  });
                },
              )
            ],
          )),
    );
  }
}
