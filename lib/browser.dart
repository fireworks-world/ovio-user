import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:ovio_user/salondetailed.dart';
import 'package:http/http.dart' as http;
import 'package:skeleton_text/skeleton_text.dart';
import 'main.dart';
import 'dart:convert';

import 'models/salonModel.dart';

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class object {
  String eta;
  String name;
  double rating;
  int price;
  String info = 'Salon INFO';
  object(this.eta, this.rating, this.name, this.price);
}

List<object> liss = [
  new object("10", 4.1, "Salon1", 500),
  new object("12", 3.3, "Salon5", 900),
  new object("16", 4.2, "Salon3", 1500),
  new object("18", 3.9, "Salon6", 2000),
  new object("10", 4.6, "Salon2", 3500),
  new object("9", 4.9, "Salon9", 5000),
];

List<SalonModel> lisss = [];

class _BrowserState extends State<Browser> {
  List convert_time(String str) {
    int hour, minute, sec;
    String temp = '';
    int count = 1;
    for (int i = 0; i < str.length; i++) {
      if (str[i] == ':' || i == str.length - 1) {
        switch (count) {
          case 1:
            hour = int.parse(temp);
            break;
          case 2:
            minute = int.parse(temp);
            break;
          case 3:
            sec = int.parse(temp + str[i]);
            break;
        }
        count++;
        temp = '';
      } else {
        temp += str[i];
      }
      List lst = [hour, minute, sec];

      return lst;
    }
  }

  Future<List<SalonModel>> fetchSalons() async {
    final response = await http.get(
        Uri.parse('http://ignitedbrains.com/ovio/showSalon.php'),
        headers: {'accept': 'application/json'});
    if (response.statusCode == 200) {
      List<SalonModel> lisMe = [];
      List data = json.decode(response.body);
      debugPrint('Future LEN :: ' + data.length.toString());
      for (int i = 0; i < data.length; i++) {
        // var salon1=data[i]["salonName"];
        print('For Loop ::: ' + i.toString());
        print('Longitude ::: ' + data[i]['location_longitude'].toString());
        print('Salon Name ::: ' + data[i]['salonName']);
        var working_hours = data[i]["working_hours"];
        // print("length"+ data.length.toString());
        List time = convert_time(working_hours.toString());
        print('After time ');
        SalonModel obj = new SalonModel(
          data[i]['salon_id'],
          data[i]['category'],
          data[i]['salonName'],
          data[i]['admin'],
          double.parse(data[i]['location_longitude'].toString()),
          double.parse(data[i]['location_latitude'].toString()),
          int.parse(data[i]['phone_no'].toString()),
          int.parse(data[i]['worker_details'].toString()),
          int.parse(data[i]['no_of_seat'].toString()),
          data[i]['amenties'],
          data[i]['type_served'],
          data[i]['services'],
          data[i]['package'],
          int.parse(data[i]['working_days'].toString()),
          TimeOfDay(hour: time[0], minute: time[1]),
          int.parse(data[i]['reviews'].toString()),
          data[i]['bank_details'],
          int.parse(data[i]['status'].toString()),
          data[i]['date'],
        );

        print('After OBJ ');

        lisMe.add(obj);
      }
      print('LisMe Len ::: ' + lisMe.length.toString());
      lisss = lisMe;
      return lisMe;
    }
    return lisss;
  }

  getData() async {
    final response = await http.get(
        Uri.parse('http://ignitedbrains.com/ovio/showSalon.php'),
        headers: {'accept': 'application/json'});
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      debugPrint('LEN :: ' + data.length.toString());
      for (int i = 0; i < data.length; i++) {
        // var salon1=data[i]["salonName"];
        var working_hours = data[i]["working_hours"];
        // print("length"+ data.length.toString());
        List time = convert_time(working_hours.toString());
        SalonModel obj = new SalonModel(
          data[i]['salon_id'],
          data[i]['category'],
          data[i]['salonName'],
          data[i]['admin'],
          double.parse(data[i]['location_longitude'].toString()),
          double.parse(data[i]['location_latitude'].toString()),
          int.parse(data[i]['phone_no'].toString()),
          int.parse(data[i]['worker_details'].toString()),
          int.parse(data[i]['no_of_seat'].toString()),
          data[i]['amenties'],
          data[i]['type_served'],
          data[i]['services'],
          data[i]['package'],
          int.parse(data[i]['working_days'].toString()),
          TimeOfDay(hour: time[i], minute: time[1]),
          int.parse(data[i]['reviews'].toString()),
          data[i]['bank_details'],
          int.parse(data[i]['status'].toString()),
          data[i]['date'],
        );

        lisss.add(obj);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customTheme.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: Text(
          'OVIO',
          style: customTheme.textTheme.headline,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width / 5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int i) =>
                      TopItem(context)),
            ),
            Expanded(
              child: FutureBuilder<List<SalonModel>>(
                future: fetchSalons(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItem(
                              context,
                              snapshot.data[index].salonname,
                              snapshot.data[index]);
                          // return SampleView(snapshot.data[index].studentId, snapshot.data[index].name, snapshot.data[index].section, snapshot.data[index].deptt,snapshot.data[index].dp);
                        },
                      );
                    } else if (snapshot.hasError)
                      return Text('No Data ' + snapshot.error.toString());
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SkeletonWidget();
                      // return SampleView(snapshot.data[index].studentId, snapshot.data[index].name, snapshot.data[index].section, snapshot.data[index].deptt,snapshot.data[index].dp);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomList extends StatefulWidget {
  @override
  _BottomListState createState() => _BottomListState();
}

class _BottomListState extends State<BottomList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ListItem extends StatelessWidget {
  SalonModel obj;
  String name;
  String eta = "10";
  double rating = 4.0;
  BuildContext context;
  ListItem(this.context, this.name, this.obj);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width * .95 * 2 / 3;
    double width = MediaQuery.of(context).size.width * .95;
    debugPrint('SalonName : ' + name);
    return Container(
      margin: EdgeInsets.all(8.0),
      width: width,
      height: height,
      decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
      child: Column(
        children: <Widget>[
          Container(
            height: height * .7,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                image: DecorationImage(
                  image: AssetImage(
                    'lib/images/bd.jpeg',
                  ),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            height: height * .25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        StarRating(
                          size: 20.0,
                          rating: rating,
                          color: Colors.orange,
                          borderColor: Colors.grey,
                          starCount: 5,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Center(child: Text('ETA: ' + eta.toString()))),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        'View',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new SalonDetailedNewUI(obj)));
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopItem extends StatelessWidget {
  BuildContext context;
  TopItem(this.context);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black87),
          // borderRadius: BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(
              image: AssetImage('lib/images/bd.jpeg'), fit: BoxFit.cover)),
    );
  }
}

class SkeletonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width * .95 * 2 / 3;
    double width = MediaQuery.of(context).size.width * .95;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SkeletonAnimation(
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(
              children: <Widget>[
                SkeletonAnimation(
                  child: Container(
                    height: height * .7,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SkeletonAnimation(
                                child: Container(
                                  width: width * .4,
                                  height: height * .1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              SkeletonAnimation(
                                child: Container(
                                  width: width * .4,
                                  height: height * .1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SkeletonAnimation(
                            child: Container(
                              width: width * .4,
                              height: height * .2,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
