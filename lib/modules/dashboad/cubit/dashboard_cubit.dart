import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/data/models/ride_request/ride_request_model.dart';
import 'package:wave_drive/core/services/socketIo/socket_service.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/ride/cubit/ride_cubit.dart';

part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());
  final _socketService = injector<SocketService>();
  final rideCubit = injector<RideCubit>();

  void setCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> lestenIncommingRide() async {
   
    _socketService.listenToMessages("ride:request", (data) {
      AppLogger.d("incoming ride data: $data");
      final ride = RideRequestModel.fromJson(data as Map<String, dynamic>);
      rideCubit.onRideIncoming(ride);
    });
  }
}

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({@Default(0) int currentIndex}) = _DashboardState;
}
