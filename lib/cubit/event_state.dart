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
  final List<EventInfo> myContributionEvent;
  EventLoaded({this.listEvent = const [], this.myContributionEvent = const []});
  @override
  List<Object> get props => [listEvent, myContributionEvent];

  EventLoaded copyWith({
    List<EventInfo> listEvent,
    List<EventInfo> myContributionEvent,
  }) {
    return EventLoaded(
      listEvent: listEvent ?? this.listEvent,
      myContributionEvent: myContributionEvent ?? this.myContributionEvent,
    );
  }
}

class EventFailed extends EventState {
  final String message;
  EventFailed(this.message);
  @override
  List<Object> get props => [message];
}
