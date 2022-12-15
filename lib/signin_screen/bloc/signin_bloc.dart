import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationusingbloc/signin_screen/bloc/signin_event.dart';
import 'package:formvalidationusingbloc/signin_screen/bloc/signin_state.dart';

class SigninBloc extends Bloc<SigninEvent,SigninState>{
  SigninBloc():super(SigninInitialState()){
    on<SigninTextChangedEvent>((event, emit) => {
      if(EmailValidator.validate(event.emailValue)==false){
        emit(SigninErrorState("please enter a valid email address"))
      }else if(event.passwordValue.length < 8){
        emit(SigninErrorState("Please enter a valid Password"))
      }else{
        emit(SigninValidState())
      }
   });
    on<SigninSubmittedEvent>((event, emit) => {
      emit(SigninLoadingState())
    });
  }
}