import 'package:cherry/bloc/authentication/authentication_bloc.dart';
import 'package:cherry/repositories/userRepository.dart';
import 'package:cherry/ui/pages/signUp.dart';
import 'package:cherry/ui/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cherry/ui/widgets/tabs.dart';
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _authenticationBloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:BlocBuilder(
            bloc: _authenticationBloc,
            builder: (BuildContext context, AuthenticationState state){
              if(state is Uninitialized){
                return Splash();
              }
              else return SignUp(userRepository: _userRepository,);
            }
          )
        ),
    ) ;
  }
}
