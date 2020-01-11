import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:ovio_user/browser.dart';
import 'package:ovio_user/finalBooking.dart';
import 'package:ovio_user/models/salonModel.dart';

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

class SalonDetailedNewUI extends StatefulWidget {
  SalonModel obj;
  SalonDetailedNewUI(this.obj);
  @override
  _SalonDetailedNewUIState createState() => _SalonDetailedNewUIState(obj);
}

class _SalonDetailedNewUIState extends State<SalonDetailedNewUI> {
  SalonModel obj;
  _SalonDetailedNewUIState(this.obj);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: height * .5,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://salonvivo.com/wp-content/uploads/2014/07/salon.jpg?x51305'),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      // Text(
                      //   ' ',
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       fontFamily: 'WorkSans',
                      //       fontWeight: FontWeight.bold),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          obj.salonname,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Near Kharar Bus Stand',
                          style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      color: customColor1,
                      margin: EdgeInsets.only(
                          left: 8.0, bottom: 8.0, top: 8.0, right: 8.0),
                      alignment: Alignment.center,
                      height: height * .05,
                      width: width * .27,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '3.3',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Text(
                              ' | 95',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Amenities',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'WorkSans',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Center(child: Text('AC'))),
                    Expanded(flex: 1, child: Center(child: Text('Free WiFi')))
                  ],
                )
              ],
            )
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Column(
            //     children: <Widget>[],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new FinalBooking()));
        },
        label: Text('Book for INR400'),
        icon: Icon(Icons.book),
        backgroundColor: customColor1,
      ),
    );
  }
}
