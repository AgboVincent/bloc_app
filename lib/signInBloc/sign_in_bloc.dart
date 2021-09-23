import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_app/login.dart';
import 'package:bloc_app/user_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_app/user_data.dart';
import 'package:flutter/material.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  var responseData;
  @override
  Stream<SignInState> mapEventToState(SignInEvent event,) async* {
    // TODO: implement mapEventToState

    if (event is Login){
      yield Loading();
      final login = await loginUser(event.userName, event.passWord);
      yield Loaded(login);
      print(login);
    }
  }
  Future loginUser(String username, String password) async {
    BuildContext? context;
    Future.delayed(Duration(seconds: 20),(){
      if(responseData == null){
      print("delay");
     // Navigator.of(context!, rootNavigator: true).pop();
      }
    });
    var url = Uri.parse("https://demoapi.onetopbanc.com/oauth/token");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({
          "username": username,
          "password": password,
          "grant_type": "password",
          "client_id": "92f521f9-5142-4751-b04f-4b2a46919e0e",
          "client_secret": "P5QXaVzDWPda4zecPzEgWYLX1Uq26zmo4CBLQsEu"
        })
    );
     responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
     print("matched");
    }
    else
      print("not matched");

    return responseData;
  }
}