import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_bloc.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_event.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_state.dart';


class RegistrationPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            Navigator.of(context).pushReplacementNamed('/userPage');
          }
         
        },
        child: Column(
          children: <Widget>[
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'ФИО'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Номер телефона'),
            ),
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
                  SignUpRequested(
                    _emailController.text, 
                    _passwordController.text, 
                    _fullNameController.text, 
                    _phoneNumberController.text
                  ),
                );
              },
              child: Text('Регистрация'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/loginPage');
              },
              child: Text('Перейти к входу'),
            ),
          ],
        ),
      ),
    );
  }
}