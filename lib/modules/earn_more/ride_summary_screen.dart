import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/marker_helper.dart';
import 'package:wave_drive/core/shared/widgets/app_divider.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/vertical_divider.dart';

class RideSummaryScreen extends StatefulWidget {
  const RideSummaryScreen({super.key});

  @override
  State<RideSummaryScreen> createState() => _RideSummaryScreenState();
}

class _RideSummaryScreenState extends State<RideSummaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleWidget: Text(
          "Ride Summary",
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "400.50Kr",
                    style: AppTextStyles.text20.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black33,
                    ),
                  ),
                  Text(
                    "Ride Finished",
                    style: AppTextStyles.text16.copyWith(color: Colors.green),
                  ),
                ],
              ),
              Gap(6),

              // Date and Time
              Row(
                children: [
                  Text(
                    "02 Feb. 21:21",
                    style: AppTextStyles.text14.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.grayA9,
                    ),
                  ),
                  Gap(10),
                  Text(
                    "10:45 PM",
                    style: AppTextStyles.text14.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.grayA9,
                    ),
                  ),
                ],
              ),
              AppDivider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn("Time", "5 min"),
                  _buildInfoColumn("Distance", "2 Km"),
                  _buildInfoColumn("Payment", "In App"),
                ],
              ),
              Gap(20),

              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.grayF8,
                ),
                clipBehavior: Clip.hardEdge,
                child: RideMapView(
                  enableScroll: true,

                  markers: [
                    Marker(
                      markerId: MarkerId("Lahore"),
                      infoWindow: InfoWindow(title: "Lahore"),
                      position: LatLng(32.49, 74.53),
                    ),
                  ],
                ),
              ),

              // Map placeholder
              Gap(20),

              // Pickup and Dropout points with connecting line
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // Pickup icon
                      const Icon(
                        Icons.stop_circle_rounded,
                        size: 24,
                        color: Colors.grey,
                      ),
                      // Vertical divider
                      AppVerticalDivider(height: 40),
                      // Dropout icon
                      const Icon(
                        Icons.location_on,
                        size: 24,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pickup point text
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pickup point",
                                style: AppTextStyles.text12.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.grayA9,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Jerikoveien 26, Oslo, 1067",
                                style: AppTextStyles.text14.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black33,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppDivider(),
                        // Dropout point text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dropout point",
                              style: AppTextStyles.text12.copyWith(
                                fontWeight: FontWeight.w300,
                                color: AppColors.grayA9,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "Jerikoveien 26, Oslo, 1067",
                              style: AppTextStyles.text14.copyWith(
                                fontWeight: FontWeight.w300,
                                color: AppColors.grayA9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppDivider(gap: 15),
              Text(
                "Having an Issue with Customer?",
                style: AppTextStyles.text16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black33,
                ),
              ),
              AppDivider(gap: 15),
              Text(
                "Other Help",
                style: AppTextStyles.text16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black33,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable info column widget
  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.text14.copyWith(
            fontWeight: FontWeight.w300,
            color: AppColors.grayA9,
          ),
        ),
        Gap(4),
        Text(
          value,
          style: AppTextStyles.text16.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.black33,
          ),
        ),
      ],
    );
  }
}

class RideMapView extends StatefulWidget {
  final List<Marker>? markers;
  final bool showPolylines;
  final bool enableScroll;
  final double zoom;

  const RideMapView({
    super.key,
    this.markers,
    this.showPolylines = true,
    this.enableScroll = false,
    this.zoom = 14,
  });

  @override
  State<RideMapView> createState() => _RideMapViewState();
}

class _RideMapViewState extends State<RideMapView> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _finalMarkers = {};
  Set<Polyline> _finalPolylines = {};

  @override
  void initState() {
    super.initState();
    _prepareMarkers();
    _preparePolylines();
  }

  void _prepareMarkers() {
    final list = <Marker>[];

    if (widget.markers != null) {
      list.addAll(widget.markers!);
    }

    _finalMarkers = list.toSet();
  }

  void _preparePolylines() {
    final list = <Polyline>[];

    // Example: Add a simple polyline connecting all markers if showPolylines is true
    if (widget.showPolylines && _finalMarkers.length > 1) {
      list.add(
        Polyline(
          polylineId: const PolylineId("route"),
          points: _finalMarkers.map((m) => m.position).toList(),
          width: 5,
          color: Colors.blue,
        ),
      );
    }

    _finalPolylines = list.toSet();
  }

  CameraPosition get _initialPosition {
    if (_finalMarkers.isNotEmpty) {
      final firstMarker = _finalMarkers.first.position;
      return CameraPosition(target: firstMarker, zoom: widget.zoom);
    }
    return const CameraPosition(target: LatLng(0, 0), zoom: 1);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      markers: _finalMarkers,
      polylines: _finalPolylines,
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
      zoomGesturesEnabled: widget.enableScroll,
      scrollGesturesEnabled: widget.enableScroll,
      zoomControlsEnabled: false,
      compassEnabled: false,
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      mapToolbarEnabled: false,
    );
  }
}
