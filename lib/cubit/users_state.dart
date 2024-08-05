part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersSuccess extends UsersState {
  final List<UsersModels> users;
  UsersSuccess({required this.users});
}

final class UsersFialure extends UsersState {
  final String error;
  UsersFialure({required this.error});
}
