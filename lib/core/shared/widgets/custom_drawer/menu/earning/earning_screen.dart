import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/activity_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/earning/cubit/earning_cubit.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/widgets/earning_summary_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

@RoutePage()
class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  final _cubit = EarningCubit();

  @override
  void initState() {
    _cubit.loadEarning();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leadingColor: AppColors.black,
        titleWidget: Text("Earnings", style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: BlocProvider(
          create: (context) => _cubit,
          child: BlocBuilder<EarningCubit, EarningState>(
            builder: (context, state) {
              if (state.loadingState.isLoading || state.loadingState.isError) {
                return const Center(child: AppLoading());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(24),
                  // Header message
                  Text(
                    "Earnings",
                    style: AppTextStyles.text20.copyWith(fontWeight: FontWeight.w600, color: AppColors.black33),
                  ),
                  const Gap(8),
                  Text(
                    "Complete trips to see your earnings here",
                    style: AppTextStyles.text14.copyWith(fontWeight: FontWeight.w300, color: AppColors.gray51),
                  ),
                  const Gap(12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Earnings row
                          Row(
                            spacing: 16,
                            children: [
                              Expanded(
                                child: _earningBox(
                                  title: "Total Earnings",
                                  value: "${state.earningModel?.totalEarning} kr",
                                ),
                              ),

                              Expanded(
                                child: _earningBox(
                                  title: "Commission Fee",
                                  value: "${state.earningModel!.waveCommission} kr",
                                ),
                              ),
                            ],
                          ),
                          const Gap(12),

                          // View Summary button
                          Center(
                            child: TextButton(
                              onPressed: () => openSummaryBottomSheet(context),
                              child: Text(
                                "View Summary",
                                style: AppTextStyles.text12.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          const Gap(24),

                          // Earning Target Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Earning Target',
                                  style: AppTextStyles.text12.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black33,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  'Set income goal per day or week',
                                  style: AppTextStyles.text10.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.gray51,
                                  ),
                                ),
                                const Gap(16),
                                LinearProgressIndicator(
                                  value: state.earningModel!.earningTarget,
                                  backgroundColor: const Color(0xFFEFEFEF),
                                  color: AppColors.primary,
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                const Gap(8),
                                Text(
                                  '${state.earningModel!.earningTarget}% of goal achieved',
                                  style: AppTextStyles.text10.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.gray51,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(24),

                          // Activity section
                          Text(
                            'Activity',
                            style: AppTextStyles.text20.copyWith(fontWeight: FontWeight.w600, color: AppColors.black33),
                          ),
                          const Gap(16),

                          Row(
                            children: [
                              _activityBox(
                                title: "Hours",
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: List.generate(state.earningModel!.dayStates.length, (index) {
                                        return Column(
                                          children: [
                                            Container(
                                              width: 6,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFE0E0E0),
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                            ),
                                            const Gap(8),

                                            Text(
                                              state.earningModel!.dayStates[index].day,
                                              style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF666666)),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),

                              const Gap(16),
                              _activityBox(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ActivityView()),
                                  );
                                },
                                title: "Trips",
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${state.earningModel!.trip.completeRequests}/${state.earningModel!.trip.totalRequests}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF222222),
                                      ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      "Complete trips / All Requests",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF666666),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _earningBox({required String title, required String value}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.text12.copyWith(fontWeight: FontWeight.w500, color: AppColors.black33),
            ),
            const Gap(8),
            Text(
              value,
              style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w600, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activityBox({required String title, required Widget child, required Function() onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 160,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.text12.copyWith(fontWeight: FontWeight.w500, color: AppColors.black33),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: AppColors.grayA9, size: 16),
                ],
              ),
              const Gap(8),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

void openSummaryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    ),
    builder: (context) {
      return const EarningsSummaryBottomSheet();
    },
  );
}
