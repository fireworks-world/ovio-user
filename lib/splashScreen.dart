import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ovio_user/slider.dart';
import 'GenderSelection.dart';
import 'customColors.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => IntroSlider()));
  }

  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Theme.of(context).accentColor,
                  Theme.of(context).primaryColor
                ])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                      Container(
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            fit: BoxFit.cover,
//                            image: AssetImage('assets/images/sampleLogo.png'),
//                          ),
//                        ),
//                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 100.0,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      "When it comes to Salons OVIO is obvious",
                      style: customTheme.textTheme.title,
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: customTheme.primaryColor,
                      child: Text("Skip"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new IntroSlider()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
