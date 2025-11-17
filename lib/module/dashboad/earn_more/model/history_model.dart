import 'package:flutter/material.dart';

class HistoryModel {
  String? dateTime;
  String? destination;
  IconData? voiletIccon;
  String? location;
  String? ruppes;

  HistoryModel({
    this.destination,
    this.voiletIccon,
    this.location,
    this.ruppes,
    this.dateTime,
  });
}

List<HistoryModel> momentPostList = [
  HistoryModel(
    dateTime: '12 Aug, 10:00',
    location: 'Near Docentgatan, Malmö...',
    destination: "Ride Finished",
    ruppes: "100",
    voiletIccon: Icons.video_stable_outlined,
  ),
  HistoryModel(
    dateTime: '8 Feb 11:00',
    location: 'Near Hansagatan, Lund...',
    destination: "Passenger did not show up",
    ruppes: "60",
    voiletIccon: Icons.video_stable_outlined,
  ),
  HistoryModel(
    dateTime: '12 Aug 12:10',
    location: 'Near Docentgatan, Malmö...',
    destination: "Ride Finished",
    ruppes: "90",
    voiletIccon: Icons.video_stable_outlined,
  ),
  HistoryModel(
    dateTime: '12 Aug 10:00',
    location: 'Near Docentgatan, Malmö...',
    destination: "Passenger Cancelled",
  ),
  HistoryModel(
    dateTime: '12 Aug 10:00',
    location: 'Near Docentgatan, Malmö...',
    destination: "Passenger Cancelled",
    ruppes: "120",
    voiletIccon: Icons.video_stable_outlined,
  ),
];
