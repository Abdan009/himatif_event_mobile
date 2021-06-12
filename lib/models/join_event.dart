part of 'models.dart';

class JoinEvent extends Equatable {
  final int id, idUser, idEvent;
  final Users user;
  final EventInfo event;
  final String nameLeader, nameMember, contactLeader, schema, note;
  final DateTime timeCreate, timeUpdate;
  JoinEvent({
    this.id,
    @required this.idUser,
    @required this.idEvent,
    @required this.nameLeader,
    @required this.nameMember,
    @required this.contactLeader,
    @required this.schema,
    @required this.note,
    this.user,
    this.event,
    this.timeCreate,
    this.timeUpdate,
  });

  JoinEvent copyWith({
    Users user,
    EventInfo event,
    String nameLeader,
    String nameMember,
  }) {
    return JoinEvent(
      id: this.id,
      idUser: this.idUser,
      idEvent: this.idEvent,
      user: user ?? this.user,
      event: event ?? this.event,
      nameLeader: nameLeader ?? this.nameLeader,
      nameMember: nameMember ?? this.nameMember,
      contactLeader: contactLeader ?? this.contactLeader,
      schema: schema ?? this.schema,
      note: note ?? this.note,
      timeCreate: this.timeCreate,
      timeUpdate: this.timeUpdate,
    );
  }

  @override
  List<Object> get props => [
        id,
        idUser,
        idEvent,
        user,
        event,
        nameLeader,
        nameMember,
        contactLeader,
        schema,
        note,
        timeCreate,
        timeUpdate
      ];

  factory JoinEvent.fromJson(Map<String, dynamic> data) {
    return JoinEvent(
      id: data['id'],
      idUser: int.parse(data['id_user']),
      idEvent: int.parse(data['id_event']),
      nameLeader: data['name_leader'],
      nameMember: data['name_member'],
      contactLeader: data['contact_leader'],
      schema: data['schema'],
      note: data['note'],
      timeCreate: DateTime.parse(data['created_at']),
      timeUpdate: DateTime.parse(data['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'id_event': idEvent,
      'name_leader': nameLeader,
      'name_member': nameMember,
      'contact_leader': contactLeader,
      'schema': schema,
      'note': note
    };
  }
}

List<JoinEvent> mockJointEvent = [
  JoinEvent(
    id: 1,
    idUser: 2,
    idEvent: mockEvent[0].id,
    user: mockUser[1],
    event: mockEvent[0],
    nameLeader: 'Muhamad Abdan',
    nameMember: 'Yoga, Wahyu, Abu, Ibrahim ',
    contactLeader: '08971613199',
    schema: 'Bisnis',
    note: 'Bismillah',
  ),
  JoinEvent(
    id: 2,
    idUser: 3,
    idEvent: mockEvent[0].id,
    user: mockUser[2],
    event: mockEvent[0],
    nameLeader: 'Yoga',
    nameMember: 'Abdan, Wahyu, Abu, Ibrahim ',
    contactLeader: '08971613199',
    schema: 'Bisnis',
    note: 'Bismillah',
  ),
  JoinEvent(
    id: 3,
    idUser: 1,
    idEvent: mockEvent[1].id,
    user: mockUser[0],
    event: mockEvent[1],
    nameLeader: 'Wahyu',
    nameMember: 'Yoga, Abdan, Abu, Ibrahim ',
    contactLeader: '08971613199',
    schema: 'Bisnis',
    note: 'Bismillah',
  ),
  JoinEvent(
    id: 4,
    idUser: 1,
    idEvent: mockEvent[1].id,
    user: mockUser[0],
    event: mockEvent[1],
    nameLeader: 'Abu',
    nameMember: 'Yoga, Wahyu, Abdan, Ibrahim ',
    contactLeader: '08971613199',
    schema: 'Bisnis',
    note: 'Bismillah',
  ),
];
