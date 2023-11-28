import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_bloc.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_event.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_state.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Вход')),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            Navigator.of(context).pushReplacementNamed('/userPage');
          }
         
        },
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                  SignInRequested(_emailController.text, _passwordController.text),
                );
              },
              child: Text('Войти'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/registrationPage');
              },
              child: Text('Перейти к регистрации'),
            ),
          ],
        ),
      ),
    );
  }
}