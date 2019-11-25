import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'dart:async';

import 'homepage.dart';

class CitySelection extends StatefulWidget {
  @override
  _ExampleFormState createState() => _ExampleFormState();
}

class _ExampleFormState extends State<CitySelection> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;
  List<String> cities = [
    'Bangalore',
    'Chennai',
    'New York',
    'Mumbai',
    'Delhi',
    'Tokyo',
  ];
  List<String> countries = [
    'INDIA',
    'USA',
    'JAPAN',
  ];

  _ExampleFormState() {
    formData = {
      'City': 'Bangalore',
      'Country': 'INDIA',
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buildFutures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.data != null)
                  return Scaffold(
                      appBar: AppBar(
                        titleSpacing: 5.0,
                        title: Text(
                          'Location',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        actions: <Widget>[
                          Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                  icon: const Icon(Icons.check),
                                  iconSize: 20.0,
                                  tooltip: 'Save',
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new Homepage()));
                                      // showDialog<String>(
                                      //     context: context,
                                      //     builder:
                                      //         (BuildContext dialogContext) =>
                                      //             AlertDialog(
                                      //               content: Text(
                                      //                   'Data submitted is \n${formData.toString()}'),
                                      //             ));
                                    }
                                  });
                            },
                          )
                        ],
                      ),
                      body: Container(
                        color: Colors.white,
                        constraints: BoxConstraints.expand(),
                        child: Form(
                            key: _formKey,
                            autovalidate: false,
                            child: SingleChildScrollView(
                                child: Column(
                              children: <Widget>[
                                Divider(
                                    height: 10.0,
                                    color: Theme.of(context).primaryColor),
                                DropDownField(
                                    value: formData['City'],
                                    icon: Icon(Icons.location_city),
                                    required: true,
                                    hintText: 'Choose a city',
                                    labelText: 'City *',
                                    items: cities,
                                    strict: false,
                                    setter: (dynamic newValue) {
                                      formData['City'] = newValue;
                                    }),
                                Divider(
                                    height: 10.0,
                                    color: Theme.of(context).primaryColor),
                                DropDownField(
                                    value: formData['Country'],
                                    icon: Icon(Icons.map),
                                    required: false,
                                    hintText: 'Choose a country',
                                    labelText: 'Country',
                                    items: countries,
                                    setter: (dynamic newValue) {
                                      formData['Country'] = newValue;
                                    }),
                              ],
                            ))),
                      ));
                else
                  return LinearProgressIndicator();
              }
          }
        });
  }

  Future<bool> buildFutures() async {
    return true;
  }
}
