abstract class AuthenticationEvent {}

class SignInRequested extends AuthenticationEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

class SignUpRequested extends AuthenticationEvent {
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;

  SignUpRequested(this.email, this.password, this.fullName, this.phoneNumber);
}

class SignOutRequested extends AuthenticationEvent {}