import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationusingbloc/signin_screen/bloc/signin_bloc.dart';
import 'package:formvalidationusingbloc/signin_screen/signin_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => BlocProvider(
                        create: (context)=>SigninBloc(),
                        child: SignInScreen(),
                      ))));
                },
                child: const Text("Signin")),
          )
        ],
      ),
    );
  }
}
