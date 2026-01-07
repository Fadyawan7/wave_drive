import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/data/models/ride_request/ride_request_model.dart';
import 'package:wave_drive/core/services/socketIo/socket_service.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/injector_setup.dart';

part 'ride_cubit.freezed.dart';

part 'ride_state.dart';

class RideCubit extends Cubit<RideState> {
  RideCubit() : super(const RideState());
  final socketService = injector<SocketService>();

  void onRideIncoming(RideRequestModel model) {
    emit(state.copyWith(rideModel: model));
  }

  void clearRide() {
    emit(state.copyWith(rideModel: null));
  }

  void onAcceptRide() {
    socketService.emitEvent("ride:accept", {"rideId": state.rideModel!.rideId});
  }

  void onCancleRide() {
    socketService.emitEvent("ride:cancelled", {"rideId": state.rideModel!.rideId});
    clearRide();
  }




   void onStartRide() {
    socketService.emitEvent("ride:start", {"rideId": state.rideModel!.rideId});
  }

   void onEndRide() {
    socketService.emitEvent("ride:end", {"rideId": state.rideModel!.rideId});
  }
}
