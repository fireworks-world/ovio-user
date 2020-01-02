import 'package:flutter/material.dart';
import 'citySelection.dart';
import 'login_page.dart';

class GenderSelection extends StatefulWidget {
  GenderSelection({Key key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: new AssetImage('lib/images/selectionScreenBg.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new LoginPage()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.25,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/images/male_circle.png'))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new CitySelection()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.25,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/images/female_circle.png'))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
