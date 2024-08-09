import 'package:bloc_app/cubit/themes_cubit.dart';
import 'package:bloc_app/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
// by osama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          BlocBuilder<ThemesCubit, bool>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<ThemesCubit>().changeTheme();
                },
                icon: Icon(state ? Icons.dark_mode : Icons.light_mode),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UsersSuccess) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = state.users[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo.shade900,
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(
                        color: Colors.indigo.shade900,
                      ),
                    ),
                    trailing: Text(
                      user.userName,
                      style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if (state is UsersFialure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UsersCubit>().getUsers();
                    },
                    child: const Text('Retry',
                        style: TextStyle(
                          color: Colors.indigo,
                        )),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
