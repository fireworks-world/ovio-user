import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:ovio_user/salondetailed.dart';

import 'main.dart';

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

class _BrowserState extends State<Browser> {
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
        child: SingleChildScrollView(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: liss.map((f) => ListItem(context, f)).toList(),
              ),
            ],
          ),
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
  String name;
  String eta;
  double rating;
  object obj;
  BuildContext context;
  ListItem(this.context, this.obj);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width * .95 * 2 / 3;
    double width = MediaQuery.of(context).size.width * .95;
    name = obj.name;
    eta = obj.eta;
    rating = obj.rating;
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
                                builder: (context) => new SalonDetailed(obj)));
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
