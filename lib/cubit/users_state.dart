part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoaded extends UsersState {
  final Users user;
  UsersLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class UsersFailed extends UsersState {
  final String message;
  UsersFailed(this.message);
  @override
  List<Object> get props => [message];
}
