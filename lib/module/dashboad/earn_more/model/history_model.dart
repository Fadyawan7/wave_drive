import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';

class HistoryModel {
  String? dateTime;
  String? destination;
  Image? voiletImage;
  String? location;
  String? ruppes;

  HistoryModel({
    this.destination,
    this.voiletImage,
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
    voiletImage: Image.asset(AppImages.voileticon, height: 16, width: 16),
  ),
  HistoryModel(
    dateTime: '8 Feb 11:00',
    location: 'Near Hansagatan, Lund...',
    destination: "Passenger did not show up",
    ruppes: "60",
    voiletImage: Image.asset(AppImages.voileticon, height: 16, width: 16),
  ),
  HistoryModel(
    dateTime: '12 Aug 12:10',
    location: 'Near Docentgatan, Malmö...',
    destination: "Ride Finished",
    ruppes: "90",
    voiletImage: Image.asset(AppImages.voileticon, height: 16, width: 16),
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
    voiletImage: Image.asset(AppImages.voileticon, height: 16, width: 16),
  ),
];
