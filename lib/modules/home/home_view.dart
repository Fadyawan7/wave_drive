import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/services/socketIo/socket_service.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/category_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/driver_preference_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/home/cubit/home_cubit.dart';
import 'package:wave_drive/modules/home/widgets/bottom_sheet_widget.dart';
import 'package:wave_drive/modules/home/widgets/online_status_toggle.dart';
import 'package:wave_drive/modules/main_wrapper.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final drawerService = DrawerServices();
  final _userCubit = injector<UserCubit>();
    final _socketService = injector<SocketService>();


  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool showWavepopup = false;
    final buildMylocationButton = _buildMylocationButton(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),

      body: Stack(
        children: [
          Positioned.fill(
            bottom: context.height * .28,
            child: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) => previous.locationState.position != current.locationState.position,
              builder: (context, state) {
                final position = state.locationState.position;

                if (position == null) {
                  return const AppLoading();
                }
                final cameraPosition = CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 12);

                return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, s) {
                    return GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: cameraPosition,
                      markers: s.markers,

                      onMapCreated: context.read<HomeCubit>().onMapCreated,
                    );
                  },
                );
              },
            ),
          ),
          // Top bar
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              children: [
                _menuButton(),
                const Gap(40),
                OnlineStatusToggle(
                  isOnline: false,
                  onTap: (status) {

                    _socketService.emitEvent("status:update", {
                      "status": status == true ? "available" : "offline"
                    });
                  
                    
                  },
                ),
              ],
            ),
          ),

          // Floating icons
          Positioned(
            top: context.height * .5,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildFloatingIconImage(context, 'assets/images/Vector.png', 'Preferences', () {}),
                const Spacer(),
                Column(
                  spacing: 12,
                  children: [
                    buildMylocationButton,
                    _buildFloatingIconImage(context, 'assets/images/flatter.png', 'Other Action', () {
                      DriverPreferenceBotonSheet.show(
                        context,
                        onTakePhoto: () {},
                        onChoosePhoto: () {},
                        onChooseCategory: () {
                          CategoryListBotonSheet.show(
                            context,
                            onChange: (String selectedCat) {
                            },
                          );
                        },
                        onAutoAccept: (bool p1) {},
                        autoAccept: true,
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),

          if (showWavepopup == true)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 100,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Automatic approval is disabled. You get runs from Wave',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.text10,
                  ),
                ),
              ),
            )
          else
            const BottomSheetWidget(),
        ],
      ),
    );
  }

  /// Menu button placeholder
  Widget _menuButton() {
    return InkWell(
      onTap: () {
        _scaffoldKey.currentState?.openDrawer();
      },
      child: Container(
        height: 44,
        width: 44,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,

          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        ),
        child: const Icon(Icons.menu, color: Colors.black),
      ),
    );
  }

  /// Floating icon widget
  Widget _buildFloatingIconImage(BuildContext context, String imagePath, String label, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(88),
        child: Container(
          height: 44,
          width: 44,
          color: Colors.white,
          child: Center(child: Image.asset(imagePath, height: 20, width: 20, fit: BoxFit.contain)),
        ),
      ),
    );
  }

  Widget _buildMylocationButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().updateMap();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ActiveRideScreen(
        //       ride: RideModel(
        //         pickupLocation: const LatLng(29.93, 73.14),
        //         dropLocation: const LatLng(31.58, 74.32),
        //         driverLocation: const LatLng(29.7713000, 72.85772000),
        //         distanceKm: 10,
        //         durationMin: 20,
        //         pickAddress: 'HoroonAbad',
        //         dropAddress: 'Lahore',
        //         totalAmount: 200,
        //       ),
        //     ),
        //   ),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('My location tapped')));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(88),
        child: Container(
          height: 44,
          width: 44,
          color: Colors.white,
          child: const Center(child: Icon(Icons.my_location, color: Colors.black)),
        ),
      ),
    );
  }
}
