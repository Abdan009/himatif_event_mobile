part of 'current_cubit.dart';

class CurrentState extends Equatable {
  final int current;
  CurrentState({this.current = 0});
  @override
  List<Object> get props => [current];
}
