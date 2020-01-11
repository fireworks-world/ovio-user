import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/line_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:ovio_user/customColors.dart';

class FinalBooking extends StatefulWidget {
  @override
  _FinalBookingState createState() => _FinalBookingState();
}

class _FinalBookingState extends State<FinalBooking> {
  Future<bool> _getFutureBool() {
    return Future.delayed(Duration(milliseconds: 3000), () {
      int orderCount;
      DocumentReference count =
          Firestore.instance.collection('orderCount').document('count');

      count.get().then(
        (onValue) {
          orderCount = int.parse(onValue['count'].toString());
          orderCount++;
          debugPrint('orderCount : ' + orderCount.toString());
          Firestore.instance
              .collection('salonBooking')
              .document(orderCount.toString())
              .setData({
            'orderNo': orderCount,
            'otp': 12343,
            'name': 'Dummy User',
            'desc': 'Sample Description'
          });

          Firestore.instance
              .collection('orderCount')
              .document('count')
              .setData({'count': orderCount});
        },
      );
    }).then((onValue) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: _getFutureBool(),
          builder: (BuildContext c, AsyncSnapshot x) {
            if (x.connectionState == ConnectionState.done) {
              return (!x.data)
                  ? Center(
                      child: Loading(
                        indicator: LineScaleIndicator(),
                        color: customColor1,
                      ),
                    )
                  : Center(child: Text('OTP : 12343\nName : Dummy User'));
            } else
              return Center(
                child: Loading(
                  indicator: LineScaleIndicator(),
                  color: customColor1,
                ),
              );
          },
        ));
  }
}
