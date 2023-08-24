import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/Navigation/Navigation.dart';
import 'package:task6/Presentation/Shared_widgets/Error.dart';
import 'package:task6/Service/FirebaseHelper.dart';
import '../Models/UserModel.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  bool _isValidPassword(String password) {
    return password.length >= 8 && password.contains(RegExp(r'[A-Z]'));
  }
  void _toggleLogIn(){
    _isLoggedIn=!_isLoggedIn;
    notifyListeners();
  }
  void setUser(UserModel? user){
    _user=user;
    notifyListeners();
  }
  
   Future<void> fetchCurrentUser() async {
  try {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    if (firebaseUser != null) {
      DocumentSnapshot userSnapshot = await usersCollection.doc(firebaseUser.uid).get();
      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
        _user = UserModel.fromMap(userData);
        _isLoggedIn = true;
        notifyListeners();
      }
    }
  } catch (error) {
    print('Error fetching current user: $error');
  }
}

Future <void> signIn(String emailcontroller,String passwordController,context) async{

                  print('Email: $emailcontroller, Password: $passwordController');
                 try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailcontroller,
                      password: passwordController,
                    );
                
                  await fetchCurrentUser();
                  notifyListeners();
                    NavigationService.pushReplacement('/home');
                   // NavigationService.popUntilFirst();
                  } catch (e) {
                     print('erroorrrrrr');
                     if(e is FirebaseAuthException)
                      {ErrorSnackbar.showErrorSnackbar(context, e.message!);}
                  }
                  }

                    Future <void>  signUp(context,String emailcontroller,String passwordController, String firstNameController, String lastNameController, String confirmPassword)async {
  
                    FirebaseHelper().AddToFirestore(email: emailcontroller ,password: passwordController,firstName:  firstNameController, lastName: lastNameController);
                    Provider.of<UserProvider>(context,listen: false).fetchCurrentUser();
                    if (_isValidPassword(passwordController)) {
                      if (passwordController == confirmPassword) {
                        
                        print('Email: $emailcontroller');
                        print('Password: $passwordController');
                        print('Confirm Password: $confirmPassword');
                        print('First Name: $firstNameController');
                        print('Last Name: $lastNameController');
                        notifyListeners();
                        NavigationService.pushReplacement('home');
                      } else {
                      ErrorSnackbar.showErrorSnackbar(context, 'Passwords do NOT match.');
                      }
                    } else {
                     ErrorSnackbar.showErrorSnackbar(context, 'Password should contain at least 1 uppercase letter and be a minimum of 8 characters.');
                    }
                    }                 

                    void signout()async{
                      try{
                      await FirebaseAuth.instance.signOut(); 
                      _toggleLogIn();
                      setUser(null);
                      NavigationService.pushReplacement('/home');
                      notifyListeners();
                      }catch(e) {
                      print('Error logging out: $e');
                    }
                    }
                    }
