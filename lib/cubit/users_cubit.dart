import 'package:bloc_app/Services/services.dart';
import 'package:bloc_app/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  void getUsers() async {
    try {
      emit(UsersLoading());
      final users = await ApiServices().getUsers();
      emit(UsersSuccess(users: users));
    } catch (e) {
      emit(UsersFialure(error: e.toString()));
    }
  }
}
