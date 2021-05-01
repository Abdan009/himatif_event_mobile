import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event/models/models.dart';
import 'package:himatif_event/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  SharedPreferences localStorage;

  Future<void> getUser() async {
    ApiReturnValue<Users> result = await UsersServicesApi.getUser();
    if (result.value != null) {
      emit(UsersLoaded(result.value));
    } else {
      emit(UsersFailed(result.message));
    }
  }

  Future<void> toUserLoaded() async {
    emit(UsersLoaded(null));
  }

  Future<void> login(String email, String password) async {
    ApiReturnValue<Users> result =
        await UsersServicesApi.login(email, password);

    if (result.value != null) {
      localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', Users.token);

      emit(UsersLoaded(result.value));
    } else {
      emit(UsersFailed(result.message));
    }
  }

  Future<void> register(Users user, String password,
      {File photoProfile}) async {
    ApiReturnValue result = await UsersServicesApi.signUp(user, password,
        pictureFile: photoProfile);

    if (result.value != null) {
      // localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', Users.token);
      emit(UsersLoaded(result.value));
    } else {
      emit(UsersFailed(result.message));
    }
  }

  Future<void> logout() async {
    localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    emit(UsersLoaded(null));
  }
}
