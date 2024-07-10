import 'package:crud_flutter/components/user_tile.dart';
import 'package:crud_flutter/providers/users_provider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de usuários',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color:Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
