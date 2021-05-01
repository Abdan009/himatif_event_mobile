part of 'services.dart';

class EventServices {
  static CollectionReference _eventServices =
      FirebaseFirestore.instance.collection('event');

  Future<void> updateEvent(EventInfo event) async {
    try {
      // return await _eventServices.doc(event.id).set(
      //       event.toJson(),
      //     );
    } on FirebaseException catch (e) {
      print('Terjadi error : ' + e.message);
    }
  }

  List<EventInfo> _getEventColl(QuerySnapshot snapshot) {
    // return snapshot.docs
    //     .map((document) => EventInfo.fromSnapshot(document))
    //     .toList();
    //
    return null;
  }

  Stream<List<EventInfo>> getEventColl() {
    return _eventServices.snapshots().map(_getEventColl);
  }

  Stream<List<EventInfo>> getEventCollStatusDisetujui() {
    return _eventServices
        .where('status', isEqualTo: 'Disetujui')
        .snapshots()
        .map(_getEventColl);
  }

  Future<void> deleteEvent(String id) {
    return _eventServices.doc(id).delete();
  }
}
