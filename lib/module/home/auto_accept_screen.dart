import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class AutoAcceptScreen extends StatefulWidget {
  const AutoAcceptScreen({super.key});

  @override
  State<AutoAcceptScreen> createState() => _AutoAcceptScreenState();
}

class _AutoAcceptScreenState extends State<AutoAcceptScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        appBar: AppBar(
          backgroundColor: AppColors.whitecolor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Auto-Accept',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // onToggle(!isEnabled);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Auto Accept",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        Transform.scale(
                          scaleX: 0.7,
                          scaleY: 0.6,
                          child: Switch(
                            value: false,
                            onChanged: (bool value) {},
                            activeThumbColor: AppColors.white,
                            activeTrackColor: AppColors.primarycolor,
                            inactiveThumbColor: AppColors.primarycolor,
                            inactiveTrackColor: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "When enabled, incoming ride requests are automatically accepted , unless they are optional (e.g. outside your radius).",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Auto-Accept feature will be disabled when you decline, cancel or miss a ride request.",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
