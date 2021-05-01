import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'current_state.dart';

class CurrentCubit extends Cubit<CurrentState> {
  CurrentCubit() : super(CurrentState());

  void changeCurrent(int current) {
    emit(CurrentState(current: current));
  }
}
