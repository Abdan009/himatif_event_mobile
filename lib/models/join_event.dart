part of 'models.dart';

class JoinEvent extends Equatable {
  final int id, idUser, idEvent;
  final Users user;
  final EventInfo event;
  final String nameReader, nameMember, contactLeader, schema, note;
  final DateTime timeCreate, timeUpdate;
  JoinEvent({
    this.id,
    @required this.idUser,
    @required this.idEvent,
    @required this.nameReader,
    @required this.nameMember,
    @required this.contactLeader,
    @required this.schema,
    @required this.note,
    this.user,
    this.event,
    this.timeCreate,
    this.timeUpdate,
  });
  @override
  List<Object> get props => [
        id,
        idUser,
        idEvent,
        user,
        event,
        nameReader,
        nameMember,
        contactLeader,
        schema,
        note,
        timeCreate,
        timeUpdate
      ];
}

List<JoinEvent> mockJointEvent = [
  JoinEvent(
    id: 1,
    idUser: 2,
    idEvent: mockEvent[0].id,
    user: mockUser[1],
    event: mockEvent[0],
    nameReader: 'Muhamad Abdan',
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
    nameReader: 'Yoga',
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
    nameReader: 'Wahyu',
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
    nameReader: 'Abu',
    nameMember: 'Yoga, Wahyu, Abdan, Ibrahim ',
    contactLeader: '08971613199',
    schema: 'Bisnis',
    note: 'Bismillah',
  ),
];
