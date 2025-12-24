import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/services/permission_handler_service.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/request_permission_dialog.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/dashboad/cubit/dashboard_cubit.dart';
import 'package:wave_drive/modules/earn_more/earn_more_view.dart';
import 'package:wave_drive/modules/dashboad/widgets/bottom_navigation_bar.dart';
import 'package:wave_drive/modules/home/help_view.dart';
import 'package:wave_drive/modules/home/home_view.dart';
import 'package:wave_drive/modules/home/travels_view.dart';



@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardScreen> {
  final _cubit = injector<DashboardCubit>();
    final _appCubit = injector<AppCubit>();
    final _permissionService = injector<PermissionHandlerService>();


  void _handleBackPress() {
    if (_cubit.state.currentIndex != 0) {
      _cubit.setCurrentIndex(0);
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  void initState() {
   _requestLocationPermission(context);
    super.initState();
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
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }



  Future<void> _requestLocationPermission(BuildContext context) async {
    await _permissionService.requestMissingLocationPermission();

    if (!await _permissionService.hasLocationPermission()) {
      if (context.mounted) {
        RequestPermissionDialog.show(
          context,
          title: '"WAVE" would like to access your location',
          description:
              'Granting location access allows this app to show your live location. Please enable location permissions in your device settings.',
        );
      }
      return;
    }
    _appCubit.startTracking();
  }




}
