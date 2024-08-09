import 'package:flutter_bloc/flutter_bloc.dart';

class ThemesCubit extends Cubit<bool> {
  ThemesCubit() : super(false);
  void changeTheme() {
    emit(!state);
  }
}
