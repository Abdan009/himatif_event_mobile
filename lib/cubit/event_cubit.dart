import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event/models/models.dart';
import 'package:himatif_event/services/services.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  Future<void> getListEvent(int idUser) async {
    ApiReturnValue result = await EventServicesApi.getEvent();
    if (result.value != null) {
      emit(EventLoaded(listEvent: result.value));
      getListMyContributionEvent(idUser);
    } else {
      emit(EventFailed(result.message));
    }
  }

  void getListMyContributionEvent(int idUser) {
    List<EventInfo> listMyContribution = (state as EventLoaded)
        .listEvent
        .where((element) => element.idUser == idUser)
        .toList();
    emit((state as EventLoaded)
        .copyWith(myContributionEvent: listMyContribution));
  }

  Future<void> addEvent(EventInfo event, File filePoster) async {
    ApiReturnValue result = await EventServicesApi.addEvent(event, filePoster);
    if (result.value != null) {
      if (event.user.roles == 'admin') {
        await NotifikasiServices.sendAndRetrieveMessage(
            'Terdapat Event baru', '${event.name} mari ikuti eventnya ! ',
            topic: 'mahasiswa');
      } else {
        await NotifikasiServices.sendAndRetrieveMessage(
            'Terdapat Kontibusi Event', '${event.name} ',
            topic: 'admin');
      }
      emit((state as EventLoaded).copyWith(
          listEvent: (state as EventLoaded).listEvent + [result.value]));
      getListMyContributionEvent(event.idUser);
    } else {
      emit(EventFailed(result.message));
    }
  }

  Future<void> updateEvent(EventInfo event, File filePoster) async {
    ApiReturnValue<EventInfo> result =
        await EventServicesApi.updateEvent(event, filePoster: filePoster);
    if (result.value != null) {
      List<EventInfo> listEvent = (state as EventLoaded).listEvent.map((value) {
        if (event.id == value.id) {
          return result.value;
        } else {
          return value;
        }
      }).toList();
      emit((state as EventLoaded).copyWith(listEvent: listEvent));
      getListMyContributionEvent(event.idUser);
    } else {
      emit(EventFailed(result.message));
    }
  }

  Future<void> deleteEvent(EventInfo event) async {
    ApiReturnValue<bool> result = await EventServicesApi.deleteEvent(event.id);
    if (result.value == true) {
      final listEvent = (state as EventLoaded)
          .listEvent
          .where((element) => element.id != event.id)
          .toList();
      emit(
        (state as EventLoaded).copyWith(listEvent: listEvent),
      );
      getListMyContributionEvent(event.idUser);
    } else {
      emit(EventFailed(result.message));
    }
  }
}
