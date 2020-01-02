import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:ovio_user/auth/auth_screen.dart';
import 'package:ovio_user/genderselection.dart';
import 'package:ovio_user/customColors.dart';
import 'auth/auth_bloc_provider.dart';
import 'citySelection.dart';
import 'main.dart';

class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

Widget dummyContainer = LoginSlideNumber();

class _IntroSliderState extends State<IntroSlider> {
  static String verificationId;
  static double height;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      cursorColor: Colors.white,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.0389),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new CitySelection()));
        },
        padding: EdgeInsets.all(12),
        color: customTheme.primaryColor,
        child: Text('Log In', style: customTheme.textTheme.button),
      ),
    );

    final forgotLabel = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: customColor1,
      child: Text(
        'Signup',
        style: customTheme.textTheme.button,
      ),
      onPressed: () {},
    );

    final pages = [
      PageViewModel(
          pageColor: customColor1,
          bubble: Image.asset('lib/images/sampleLogo.png'),
          body: Text(
            'Cut the Chase Go Online',
          ),
          title: Text(
            'Heading1',
          ),
          mainImage: Image.asset(
            'lib/images/airplane.png',
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          )),
      PageViewModel(
        pageColor: Colors.amberAccent,
        bubble: Image.asset('lib/images/sampleLogo.png'),
        body: Text(
          'Unique & Success booking system developed to connect salons with you ',
        ),
        title: Text(
          'Heading2',
        ),
        mainImage: Image.asset(
          'lib/images/hotel.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      PageViewModel(
          pageColor: const Color(0xFF607D8B),
          bubble: Image.asset('lib/images/sampleLogo.png'),
          body: forgotLabel,
          title: Text(
            'Login',
          ),
          mainImage: AuthBlocProvider(child: AuthScreen())),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GenderSelection(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Ma
  }
}

class LoginSlideOTP extends StatefulWidget {
  @override
  _LoginSlideOTPState createState() => _LoginSlideOTPState();
}

class _LoginSlideOTPState extends State<LoginSlideOTP> {
  String smsCode;
  TextEditingController smsCodeEditor;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   children: <Widget>[
    //     SizedBox(height: height * .2),
    //     TextFormField(
    //       keyboardType: TextInputType.number,
    //       autofocus: false,
    //       controller: smsCodeEditor,
    //       cursorColor: Colors.white,
    //       decoration: InputDecoration(
    //         hintText: 'SMS Code',
    //         contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
    //         focusedBorder: OutlineInputBorder(
    //           borderSide: const BorderSide(color: Colors.white, width: 2.0),
    //           borderRadius: BorderRadius.circular(25.0),
    //         ),
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(32.0),
    //         ),
    //       ),
    //     ),
    //     SizedBox(height: 24.0),
    //     Padding(
    //       padding: EdgeInsets.symmetric(vertical: height * 0.0389),
    //       child: RaisedButton(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(24),
    //         ),
    //         onPressed: () {},
    //         padding: EdgeInsets.all(12),
    //         color: customTheme.primaryColor,
    //         child: Text('Verify', style: customTheme.textTheme.button),
    //       ),
    //     )
    //   ],
    // );
    return AuthScreen();
  }
}

class LoginSlideNumber extends StatefulWidget {
  @override
  _LoginSlideState createState() => _LoginSlideState();
}

class _LoginSlideState extends State<LoginSlideNumber> {
  String phoneNo;
  TextEditingController phoneEditor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.number,
          autofocus: false,
          controller: phoneEditor,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        SizedBox(height: 24.0),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.0389),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              setState(() {
                dummyContainer = LoginSlideOTP();
              });
              // phoneNo = phoneEditor.value.toString();
            },
            padding: EdgeInsets.all(12),
            color: customTheme.primaryColor,
            child: Text('Login', style: customTheme.textTheme.button),
          ),
        )
      ],
    );
  }
}
