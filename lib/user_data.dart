


import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserData extends Equatable{
  final userName;
  final password;

  UserData({
    @required this.userName,
    @required this.password
});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}