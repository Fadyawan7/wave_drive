import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  void setCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  

 
}



@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(0) int currentIndex,
   
   
  }) = _DashboardState;
}