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
  final List<Users> listUser;
  UsersLoaded({
    this.user,
    this.listUser = const [],
  });
  @override
  List<Object> get props => [user, listUser];

  UsersLoaded copyWith({
    Users user,
    List<Users> listUser,
  }) {
    return UsersLoaded(
      user: user ?? this.user,
      listUser: listUser ?? this.listUser,
    );
  }
}

class UsersFailed extends UsersState {
  final String message;
  UsersFailed(this.message);
  @override
  List<Object> get props => [message];
}
