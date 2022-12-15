import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationusingbloc/signin_screen/bloc/signin_bloc.dart';
import 'package:formvalidationusingbloc/signin_screen/bloc/signin_event.dart';
import 'package:formvalidationusingbloc/signin_screen/bloc/signin_state.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signin Screen")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SigninBloc, SigninState>(builder: ((context, state) {
              if (state is SigninErrorState) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
              }
              return Container();
            })),
            TextFormField(
              controller: emailController,
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context).add(SigninTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              decoration: const InputDecoration(hintText: "Email Address"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context).add(SigninTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              decoration: const InputDecoration(hintText: "Email Address"),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SigninBloc, SigninState>(builder: ((context, state) {
              if (state is SigninLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      primary: (state is SigninValidState)
                          ? Colors.blue
                          : Colors.grey),
                  onPressed: () {
                    if (state is SigninValidState) {
                      BlocProvider.of<SigninBloc>(context).add(
                          SigninSubmittedEvent(
                              emailController.text, passwordController.text));
                    }
                  },
                  child: const Text("Signin"));
            }))
          ],
        ),
      ),
    );
  }
}
