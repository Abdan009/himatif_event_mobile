part of 'joinevent_cubit.dart';

abstract class JoineventState extends Equatable {
  const JoineventState();

  @override
  List<Object> get props => [];
}

class JoineventInitial extends JoineventState {}

class JoineventLoaded extends JoineventState {
  final List<JoinEvent> allJointEvent;
  final List<JoinEvent> myJoinEvent;
  JoineventLoaded({this.allJointEvent, this.myJoinEvent});
  @override
  List<Object> get props => [allJointEvent, myJoinEvent];

  JoineventLoaded copyWith({
    List<JoinEvent> allJointEvent,
    List<JoinEvent> myJoinEvent,
  }) {
    return JoineventLoaded(
      allJointEvent: allJointEvent ?? this.allJointEvent,
      myJoinEvent: myJoinEvent ?? this.myJoinEvent,
    );
  }
}

class JoineventFailed extends JoineventState {
  final String message;
  JoineventFailed(this.message);
}
