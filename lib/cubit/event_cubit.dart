import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event/models/models.dart';
import 'package:himatif_event/services/services.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  Future<void> getListEvent() async {
    ApiReturnValue result = await EventServicesApi.getEvent();
    if (result.value != null) {
      emit(EventLoaded(listEvent: result.value));
    } else {
      emit(EventFailed(result.message));
    }
  }

  Future<void> addEvent(EventInfo event, File filePoster) async {
    ApiReturnValue result = await EventServicesApi.addEvent(event, filePoster);
    if (result.value != null) {
      await NotifikasiServices.sendAndRetrieveMessage(
          'Event Baru Berhasil Ditambahkan',
          'Selamat event baru anda berhasil ditambahkan',
          topic: 'mahasiswa');
      emit(EventLoaded(
          listEvent: (state as EventLoaded).listEvent + [result.value]));
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
      await NotifikasiServices.sendAndRetrieveMessage(
          'Berhasil DiUpdate', 'Event anda berhasil di Update',
          topic: 'mahasiswa');

      emit(EventLoaded(listEvent: listEvent));
    } else {
      emit(EventFailed(result.message));
    }
  }

  Future<void> deleteEvent(int id) async {
    ApiReturnValue<bool> result = await EventServicesApi.deleteEvent(id);
    if (result.value == true) {
      final listEvent = (state as EventLoaded)
          .listEvent
          .where((element) => element.id != id)
          .toList();
      await NotifikasiServices.sendAndRetrieveMessage(
          'Berhasil Dihapus', 'Event anda berhasil di Hapus',
          topic: 'mahasiswa');

      emit(
        EventLoaded(listEvent: listEvent),
      );
    } else {
      emit(EventFailed(result.message));
    }
  }
}
