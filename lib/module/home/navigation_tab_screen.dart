import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class NavigationTabScreen extends StatefulWidget {
  const NavigationTabScreen({super.key});

  @override
  State<NavigationTabScreen> createState() => _NavigationTabScreenState();
}

class _NavigationTabScreenState extends State<NavigationTabScreen> {
  bool roastingEnabled = true;

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
            'Navigation',
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
              // Select default navigation
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.strockcolor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select default navigation',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.graycolor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Roasting function toggle
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      roastingEnabled = !roastingEnabled;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Roasting function',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),

                      Transform.scale(
                        scaleX: 0.8,
                        scaleY: 0.7,
                        child: Switch(
                          value: roastingEnabled,
                          onChanged: (value) {
                            setState(() {
                              roastingEnabled = value;
                            });
                          },
                          activeThumbColor: AppColors.white,
                          activeTrackColor: AppColors.primarycolor,
                          inactiveThumbColor: Colors.grey[400],
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
