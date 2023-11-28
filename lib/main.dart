import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/data/repository/repository.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_bloc.dart';
import 'package:flutter_firebase/presentation/pages/login_page.dart';
import 'package:flutter_firebase/presentation/pages/regis_page.dart';
import 'package:flutter_firebase/presentation/pages/splashscreen_page.dart';
import 'package:flutter_firebase/presentation/pages/user_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(AuthenticationRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/loginPage': (context) => LoginPage(),
          '/registrationPage': (context) => RegistrationPage(),
          '/userPage': (context) => UserPage(),
        },
      ),
    );
  }
}
