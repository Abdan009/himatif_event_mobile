import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event/models/models.dart';
import 'package:himatif_event/services/services.dart';

part 'joinevent_state.dart';

class JoineventCubit extends Cubit<JoineventState> {
  JoineventCubit() : super(JoineventInitial());

  Future<void> getAllJoinEvent() async {
    ApiReturnValue result = await JoinEventServicesApi.getJoinAllEvent();
    if (result.value != null) {
      emit(JoineventLoaded(allJointEvent: result.value));
    } else {
      emit(JoineventFailed(result.message));
    }
  }

  Future<void> getMyJoinEvent(int idUser) async {
    ApiReturnValue result = await JoinEventServicesApi.getMyJoinEvent(idUser);
    if (result.value != null) {
      emit(JoineventLoaded(myJoinEvent: result.value));
    } else {
      emit(JoineventFailed(result.message));
    }
  }

  Future<void> addJoinEvent(JoinEvent joinEvent) async {
    ApiReturnValue result = await JoinEventServicesApi.addJoinEvent(joinEvent);
    if (result.value != null) {
      emit(JoineventLoaded(
          myJoinEvent:
              (state as JoineventLoaded).myJoinEvent + [result.value]));
    } else {
      emit(JoineventFailed(result.message));
    }
  }
}
