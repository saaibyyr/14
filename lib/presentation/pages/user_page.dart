import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/domain/user_shared.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_bloc.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_event.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class UserProfile {
  String fullName;
  String phoneNumber;

  UserProfile({required this.fullName, required this.phoneNumber});

  void updateFullName(String newName) {
    fullName = newName;
  }

  void updatePhoneNumber(String newNumber) {
    phoneNumber = newNumber;
  }
}

class _UserPageState extends State<UserPage> {
  String _fullName = '';
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await UserPreferences.getUserDetails();
    setState(() {
      _fullName = data['fullName'] ?? '';
      _phoneNumber = data['phoneNumber'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль пользователя')),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('ФИО'),
            subtitle: Text(_fullName),
          ),
          ListTile(
            title: Text('Номер телефона'),
            subtitle: Text(_phoneNumber),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationBloc>().add(SignOutRequested());
              Navigator.of(context).pushReplacementNamed('/loginPage');
            },
            child: Text('Выйти'),
          ),
        ],
      ),
    );
  }
}
