part of 'event_cubit.dart';

abstract class EventState extends Equatable {
  const EventState();
}

class EventInitial extends EventState {
  @override
  List<Object> get props => [];
}

class EventLoaded extends EventState {
  final List<EventInfo> listEvent;
  EventLoaded({this.listEvent = const []});
  @override
  List<Object> get props => [listEvent];
}

class EventFailed extends EventState {
  final String message;
  EventFailed(this.message);
  @override
  List<Object> get props => [message];
}
