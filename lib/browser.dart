import 'package:flutter/material.dart';

import 'main.dart';

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class object {
  String eta;
  String name;
  double rating;
  object(this.eta, this.rating, this.name);
}

List<object> liss = [
  new object("10", 4.5, "Salon1"),
  new object("12", 4.3, "Salon5"),
  new object("16", 4.2, "Salon3"),
  new object("18", 3.9, "Salon6"),
  new object("10", 4.6, "Salon2"),
  new object("9", 4.9, "Salon9"),
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
                height: 78,
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
                children: liss
                    .map((f) => ListItem(context, f.name, f.eta, f.rating))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  String name;
  String eta;
  double rating;
  BuildContext context;
  ListItem(this.context, this.name, this.eta, this.rating);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width * .95 * 2 / 3;
    double width = MediaQuery.of(context).size.width * .95;
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Text('ETA: ' + eta.toString())),
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
                        debugPrint('View Clicked');
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
