import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/Navigation/AppRoutes.dart';
import 'package:task6/Navigation/Navigation.dart';
import 'package:task6/Provider/Provider.dart'; 
import 'package:task6/Provider/PropertyProvider.dart'; 
import 'package:task6/Presentation/Screen/home_page_screen.dart';
import 'package:task6/Provider/UserProvider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataSelectionProvider>(
          create: (context) => DataSelectionProvider(),
        ),
        ChangeNotifierProvider<PropertyProvider>(
          create: (context) => PropertyProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return HomePage();
          },
         ),
      ),
    );
  }
}
