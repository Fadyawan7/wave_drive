import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/data/models/ride_request/ride_request_model.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/timer_count_down.dart';
import 'package:wave_drive/modules/main_wrapper.dart';
import 'package:wave_drive/modules/ride/cubit/ride_cubit.dart';

class UserRequestBottomsheet extends StatefulWidget {
  final RideRequestModel ride;
  const UserRequestBottomsheet({super.key, required this.ride});

  @override
  State<UserRequestBottomsheet> createState() => _UserRequestBottomsheetState();
}

class _UserRequestBottomsheetState extends State<UserRequestBottomsheet> {
  final int totalSeconds = 200;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -4))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //  _buildTimerSection(context),
            // Background bar
            Countdown(
              seconds: totalSeconds,
              build: (_, count) {
                final double progressFraction = 1 - (count / totalSeconds); // grows left -> right
                return Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // Background bar
                    Container(
                      height: 63,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: const Color(0xffAED6FF).withOpacity(0.29), // background color
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                    ),

                    // Dynamic progress bar
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 63,
                        width: screenWidth * progressFraction,
                        decoration: const BoxDecoration(
                          color: Color(0xFF002D72),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                      ),
                    ),

                    // Countdown text aligned left with padding
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Accept in ${count.toStringAsFixed(0)}',
                        style: AppTextStyles.text16.copyWith(fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
              onFinished: () {
                context.read<RideCubit>().clearRide();
                // Timer finished action
                Navigator.pop(context);
              },
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [_buildTripInfo(), _buildLocationDetails(context)]),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  Widget _buildTripInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoText('${widget.ride.distance} min'),
        _divider(),
        _buildInfoText('${widget.ride.distance} km'),
        _divider(),
        _buildInfoText('${widget.ride.fare} kr'),
      ],
    );
  }

  Widget _buildInfoText(String title) {
    return Text(
      title,
      style: AppTextStyles.text10.copyWith(color: AppColors.primarycolor, fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  Widget _divider() {
    return const SizedBox(height: 25, child: VerticalDivider(color: AppColors.strockcolor, thickness: 1));
  }

  // ---------------------------------------------------------
  Widget _buildLocationDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Icon(Icons.trip_origin, color: AppColors.primarycolor, size: 18),
                  Container(width: 1, height: 50, color: AppColors.strockcolor),
                  const Icon(Icons.location_on, color: AppColors.primarycolor, size: 22),
                ],
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pickup point", style: AppTextStyles.text10),
                    Text(widget.ride.pickLocation.address??"", style: GoogleFonts.poppins(fontSize: 14)),
                    const Divider(),
                    Text("Dropout point", style: AppTextStyles.text10),
                    Text(widget.ride.dropLocation.address??"", style: GoogleFonts.poppins(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),

          const Gap(16),
          _buildRatingInfo(),
          const Gap(20),

          RoundedButton(title: 'Accept', onpress: () {
            context.read<RideCubit>().onAcceptRide();
          }, buttonColor: AppColors.primarycolor),
        ],
      ),
    );
  }

  Widget _buildRatingInfo() {
    return Row(
      children: [
        Text(
          "Wave - 5.0",
          style: AppTextStyles.text10.copyWith(color: AppColors.primarycolor, fontWeight: FontWeight.w300),
        ),
        const Gap(4),
        const Icon(Icons.star, size: 16, color: Colors.orange),
        const Gap(4),
        const Text("(3 Reviews)", style: TextStyle(color: Colors.grey)),
      ],
    );
  }



Future<String> getAddress(LatLng latLng) async {
  final List<Placemark> placemarks =
      await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

  final place = placemarks.first;

  return '${place.street}, ${place.locality}, ${place.country}';
}



}
