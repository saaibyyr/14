import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/data/repository/repository.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_event.dart';
import 'package:flutter_firebase/presentation/bloc/firebase_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final userCredential = await _authenticationRepository
            .signInWithEmailAndPassword(event.email, event.password);
        emit(AuthenticationSuccess(userCredential.user!));
      } catch (e) {
        emit(AuthenticationFailure(e.toString()));
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final userCredential =
            await _authenticationRepository.signUpWithEmailAndPassword(
                event.email, event.password, event.fullName, event.phoneNumber);
        emit(AuthenticationSuccess(userCredential.user!));
      } catch (e) {
        emit(AuthenticationFailure(e.toString()));
      }
    });

    on<SignOutRequested>((event, emit) async {
      await _authenticationRepository.signOut();
      emit(AuthenticationInitial());
    });
  }
}
