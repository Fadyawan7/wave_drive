import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/services/socketIo/socket_service.dart';
import 'package:wave_drive/injector_setup.dart';

part 'socket_cubit.freezed.dart';

class SocketCubit extends Cubit<SocketState> {
  SocketCubit() : super(const SocketState());
  final _socketService = injector<SocketService>();

  Future<void> init() async {
    if (!injector<UserCubit>().state.isLoggedIn) {
      return;
    }

    _socketService.listenToMessages(
      "current_location",
      (msg) {},
    );
  }

  void emitEvent(String event, dynamic data) {
    _socketService.emitEvent(event, data);
  }
  
}




@freezed
abstract class SocketState with _$SocketState {
  const factory SocketState() = _SocketState;
}
