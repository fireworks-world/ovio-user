import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:ovio_user/browser.dart';

import 'customColors.dart';
import 'main.dart';

class SalonDetailed extends StatefulWidget {
  object obj;
  SalonDetailed(this.obj);
  @override
  _SalonDetailedState createState() => _SalonDetailedState(obj);
}

class _SalonDetailedState extends State<SalonDetailed> {
  String salonName;
  int price;
  String info;
  double rating;
  object obj;

  _SalonDetailedState(this.obj);

  @override
  void initState() {
    super.initState();
    salonName = obj.name;
    price = obj.price;
    rating = obj.rating;
    info = obj.info;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            color: customColor1,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                onPressed: () {
                  debugPrint('Calendar Clicked!');
                },
              ),
            ),
          ),
          Positioned(
            top: height / 8,
            left: height / 8,
            right: height / 8,
            child: Container(
              height: height / 3,
              width: height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/logo.png'))),
            ),
          ),
          Positioned(
            top: height / 2,
            child: Container(
              decoration: BoxDecoration(
                  color: customColor2,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0))),
              height: height / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width,
                    margin: EdgeInsets.fromLTRB(0, height * .01, 0, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        salonName,
                        style: TextStyle(
                            color: Colors.white, fontSize: height * .05),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: StarRating(
                              size: 20.0,
                              rating: rating,
                              color: Colors.orange,
                              borderColor: Colors.grey,
                              starCount: 5,
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(rating.toString()))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        info,
                        style: customTheme.textTheme.title,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  price.toString() + ' INR',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              )),
          InkWell(
            onTap: () {
              debugPrint('Booked');
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: height / 14,
                width: height / 14 * 3,
                child: Center(
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: customColor1,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
