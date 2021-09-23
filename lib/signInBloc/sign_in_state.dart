part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable{
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class Loading extends SignInState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}

class Loaded extends SignInState{
  final Map userData;
  Loaded(this.userData): super();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}