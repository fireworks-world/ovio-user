import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:ovio_user/genderselection.dart';
import 'package:ovio_user/customColors.dart';

class IntroSlider extends StatelessWidget {
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
      body: Text(
        'Caption',
      ),
      title: Text(
        'Heading3',
      ),
      mainImage: Image.asset(
        'lib/images/taxi.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
