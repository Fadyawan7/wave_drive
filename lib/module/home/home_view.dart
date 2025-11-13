import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/custom_drawer.dart';

// widgets (UI only placeholders)
import 'widgets/online_status_toggle.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kCameraposition = CameraPosition(
    target: LatLng(59.3293, 18.0686),
    zoom: 14.0,
  );
  @override
  void initState() {
    super.initState();

    // 👇 Make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness:
            Brightness.dark, // use light if background is dark
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buildMylocationButton = _buildMylocationButton(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          // Background placeholder instead of Google Map
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: _kCameraposition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          // Top bar
          Positioned(
            top: 50,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    return _menuButton(context);
                  },
                ),
                const Gap(40),
                OnlineStatusToggle(),
              ],
            ),
          ),

          // Floating icons
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildFloatingIconImage(
                  context,
                  'assets/images/Vector.png',
                  'Preferences',
                ),
                const Spacer(),
                Column(
                  spacing: 12,
                  children: [
                    buildMylocationButton,
                    _buildFloatingIconImage(
                      context,
                      'assets/images/flatter.png',
                      'Other Action',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom sheet placeholder
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: 180,
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black12,
          //           blurRadius: 8,
          //           spreadRadius: 2,
          //         ),
          //       ],
          //     ),
          //     child: const Center(
          //       child: Text(
          //         "Bottom Sheet Placeholder",
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  /// Menu button placeholder
  Widget _menuButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(Icons.menu, color: Colors.black),
      ),
    );
  }

  /// Floating icon widget
  Widget _buildFloatingIconImage(
    BuildContext context,
    String imagePath,
    String label,
  ) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label tapped')));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(88),
        child: Container(
          height: 44,
          width: 44,
          color: Colors.white,
          child: Center(
            child: Image.asset(
              imagePath,
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMylocationButton(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('My location tapped')));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(88),
        child: Container(
          height: 44,
          width: 44,
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.my_location, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
