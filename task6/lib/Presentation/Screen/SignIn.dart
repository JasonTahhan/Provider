
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/Presentation/Screen/SignUP.dart';
import 'package:task6/Provider/UserProvider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _showPassword = false;
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 90, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Group 10961.png',
                height: 120,
              ),
              SizedBox(height: 10),
              Text(
                'You need to login to complete the booking process',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'MontserratRegular',
                  color: Color(0xFF323E48),
                ),
              ),
              SizedBox(height: 50),
              _buildTextFieldContainer(_emailController),
              SizedBox(height: 20),
              _buildPasswordTextFieldContainer(
                _passwordController,
                _showPassword,
                onPressedShowPassword: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    print('Forgot Password tapped');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 250),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF297BE6),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
              onPressed: () {
                try {
                  Provider.of<UserProvider>(context, listen: false).signIn(_emailController.text.trim(), _passwordController.text.trim(),context);
                } catch (error) {
                  print('FAWZI');
                  
                }
              },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'MontserratMedium',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(342, 48),
                  primary: Color(0xFF297BE6),
                ),
              ),
              Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(85, 50, 65, 52),
        child: RichText(
          text: TextSpan(
            text: 'Don’t have an account? ',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'MontserratSemiBold',
              color: Color(0xFF323E48),
              
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'SIGN UP',
                style: TextStyle(
                  color: Color(0xFF297BE6),
                  fontFamily: 'MontserratSemiBold'
                ),
                 recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => SignUp()),            
            );
          },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer(TextEditingController controller) {
    return Container(
      width: 342,
      height: 62,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(
            'Email',
            style: TextStyle(
              color: Color(0xFF323E48),
              fontFamily: 'MontserratRegular',
              fontSize: 10,
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your email',
              hintStyle: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextFieldContainer(
    TextEditingController controller,
    bool showPassword, {
    VoidCallback? onPressedShowPassword,
  }) {
    return Container(
      width: 342,
      height: 62,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyle(
              color: Color(0xFF323E48),
              fontFamily: 'MontserratRegular',
              fontSize: 10,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                onPressed: onPressedShowPassword,
              ),
            ],
          ),
        ],
      ),
    );
  }
}