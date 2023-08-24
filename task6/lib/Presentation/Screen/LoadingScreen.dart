import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/Presentation/Screen/home_page_screen.dart';
import 'package:task6/Service/FirebaseHelper.dart';
import 'package:task6/Provider/UserProvider.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      }
    });
    initializeFirebase();
    Provider.of<UserProvider>(context,listen: false).fetchCurrentUser();

  }
@override
  void dispose() {
    super.dispose();
  }

  Future<void> initializeFirebase() async {
    try {
      FirebaseHelper firebaseService = FirebaseHelper();
      
      await firebaseService.initializeFirestoreCollection();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
    } catch (e) {
      print('Error initializing Firebase and Firestore collection: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
