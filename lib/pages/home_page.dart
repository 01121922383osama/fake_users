import 'package:bloc_app/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
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
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Text(user.userName),
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
