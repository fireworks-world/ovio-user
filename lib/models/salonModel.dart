import 'package:flutter/material.dart';

class SalonModel {
  SalonModel(
    this.salonid,
    this.category,
    this.salonname,
    this.admin,
    this.longitude,
    this.latitude,
    this.phonenumber,
    this.workerdetails,
    this.number_of_seats,
    this.amenities,
    this.type_served,
    this.services,
    this.package,
    this.working_days,
    this.working_hours,
    this.reviews,
    this.bank_detail,
    this.status,
    this.date, {
    this.salonimage1,
    this.salonimage2,
    this.salonimage3,
  });

  String salonid = "";
  String category = "";
  String salonname = "";
  String salonimage1 = "";
  String salonimage2 = "";
  String salonimage3 = "";
  String admin = "";
  double longitude;
  double latitude;
  int phonenumber;
  int workerdetails;
  int number_of_seats;
  String amenities = "";
  String type_served;
  String services = "";
  String package = "";
  int working_days;
  TimeOfDay working_hours;
  int reviews;
  String bank_detail = "";
  int status;
  String date;
}
