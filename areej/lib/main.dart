import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:areej/view/on_boarding/startup_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  try {
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    print("Error initializing Firebase: $e"); 
    runApp(const MyApp()); 
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Metropolis",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StartupView(),
      ),
    );
  }
}
