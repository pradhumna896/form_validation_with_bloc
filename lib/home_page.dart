import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationusingbloc/signin_screen/bloc/signin_bloc.dart';
import 'package:formvalidationusingbloc/signin_screen/signin_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Home Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
               style:ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(double.infinity, 50),
                      primary:  Theme.of(context).primaryColor),
                          
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => BlocProvider(
                        create: (context)=>SigninBloc(),
                        child: SignInScreen(),
                      ))));
                },
                child: const Text("Sign-In",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    );
  }
}
