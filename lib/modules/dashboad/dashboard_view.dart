import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/dashboad/cubit/dashboard_cubit.dart';
import 'package:wave_drive/modules/earn_more/earn_more_view.dart';
import 'package:wave_drive/modules/dashboad/widgets/bottom_navigation_bar.dart';
import 'package:wave_drive/modules/home/help_view.dart';
import 'package:wave_drive/modules/home/home_view.dart';
import 'package:wave_drive/modules/home/travels_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final _cubit = injector<DashboardCubit>();

  void _handleBackPress() {
    if (_cubit.state.currentIndex != 0) {
      _cubit.setCurrentIndex(0);
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleBackPress();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.currentIndex,
              children: const [
                HomeView(),
                EarnMoreView(),
                TravelsView(),
                HelpView(),
              ],
            );
          },
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
