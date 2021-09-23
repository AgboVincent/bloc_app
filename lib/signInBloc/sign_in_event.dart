part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable{
  const SignInEvent ([List props = const []]) : super();
}


class Login extends SignInEvent{
  @override
  List<Object?> get props => throw UnimplementedError();

  final String userName;
  final String passWord;

  Login(this.userName,this.passWord): super([userName,passWord]);
}