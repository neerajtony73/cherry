import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cherry/repositories/userRepository.dart';
import 'package:cherry/ui/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  UserRepository _userRepository;


  SignUpBloc({ @required UserRepository userRepository})
      :assert (userRepository != null),
        _userRepository = userRepository;

  @override
  SignUpState get initialState => SignUpState.empty();

  @override
  Stream<SignUpState> transformEvents (
      Stream<SignUpEvent> events,
      Stream<SignUpState> Function(SignUpEvent event) next
      ){
    final nonDebounceStream = events.where((event){
      return (event is! EmailChanged || event is! PasswordChanged);
    });

    final debounceStream = events.where((event){
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(nonDebounceStream.mergeWith([debounceStream]),
      next,);
  }

  @override
  Stream<SignUpState> mapEventToState(
      SignUpEvent event,
      ) async* {
    if(event is EmailChanged){
      yield* _mapEmailChangedToState(event.email);
    }
    else if(event is PasswordChanged){
      yield* _mapPassWordChangedToState(event.password);
    }
    else if(event is SignUpWithCredentialsIsPressed){
      yield* _mapSignUpWithCredentialsIsPressedToState(
          email: event.email,
          password: event.password
      );
    }
  }

  Stream<SignUpState> _mapEmailChangedToState(String email) async*{
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignUpState> _mapPassWordChangedToState(String password) async*{
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<SignUpState> _mapSignUpWithCredentialsIsPressedToState( {String email,
    String password}) async*{
    yield SignUpState.loading();
    try{
      await _userRepository.signUpWithEmail(email, password);
      yield SignUpState.success();
    }
    catch(e){
      print (e);
      SignUpState.failure();
    }
  }
}
