import 'package:bloc_app/NewPage.dart';
import 'package:bloc_app/api_test.dart';
import 'package:bloc_app/signInBloc/sign_in_bloc.dart';
import 'package:bloc_app/user_data.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

TextEditingController userName = TextEditingController();
TextEditingController password = TextEditingController();

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{

  UserData? data;
  final loginBloc = SignInBloc();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive || state == AppLifecycleState.detached){
      //loginBloc.close();
    }


    if (state ==AppLifecycleState.paused){
    //  loginBloc.close();
    }
    if(state == AppLifecycleState.resumed){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) => loginBloc,
        child: SingleChildScrollView(
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              // TODO: implement listener}
              if(state is Loading){
                showAlertDialog(context);
              }
              if (state is Loaded) {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => NewPage()));
                //loginBloc.close();
              }

            },
            child: BlocBuilder(
              bloc: loginBloc,
              builder: (context, SignInState state) {
                if(state is Loading){
                  // return Center(
                  //     child: CircularProgressIndicator()
                  // );
                }
                else if(state is Loaded){
                //  return textWidget(state.userData);
                 // print(state.userData );
                }
                return Column(
                  children: [
                    SizedBox( height: 50,),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 80,
                          child: TextFormField(
                            controller: userName,
                            style: TextStyle(
                                color: Colors.grey[300],
                                decoration: TextDecoration.none),
                            cursorColor: Colors.black,
                            decoration: textInputDecoration.copyWith(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              hintText: "user name",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal),
                            ),
                            validator: (val) {

                            },
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 80,
                          child: TextFormField(
                              controller: password,
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  decoration: TextDecoration.none),
                              cursorColor: Colors.black,
                              decoration: textInputDecoration.copyWith(
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                hintText: "password",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal),
                              ),
                              validator: (val) {

                              }
                          ),
                        )),
                    SizedBox(height: 20,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 15),
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: RaisedButton(
                              elevation: 2.0,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>APITest()));
                                // final weatherBloc = BlocProvider.of<SignInBloc>(context);
                                // //Initial getting the weather
                                // weatherBloc.add(Login(userName.text, password.text));
                                },
                              color: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    // Text(
                    //  data?.userName ?? "",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 35
                    //   ),
                    // )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginBloc.close();
  }

  void showAlertDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            child: Container(
              height: 800,
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.height * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please wait...",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 200,
                      ),
                     CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Loading",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            letterSpacing: 0.3),
                      ),
                    ],
                  )
              ),
            ),
          );
        }
    );
  }

  Widget textWidget(Map userData){
    return Text(
      userData.toString(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 34
      ),
    );
  }
}
