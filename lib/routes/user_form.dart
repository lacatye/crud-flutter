import 'package:flutter/material.dart';
import 'package:crud_flutter/providers/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:crud_flutter/models/user.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulário de Usuário',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              final isValid = _form.currentState?.validate();
              if (isValid == true) {
                _form.currentState?.save();

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'], // Verifique se você está passando um ID válido aqui
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. Mínimo 3 letras';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Avatar (URL)',
                ),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
