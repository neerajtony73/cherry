import 'package:cherry/bloc/blocDelegate.dart';
import 'package:cherry/ui/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(Home());
}