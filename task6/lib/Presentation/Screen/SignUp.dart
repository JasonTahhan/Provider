import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/UserProvider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  bool _isPasswordVisible = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(66, 80, 66, 35),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'MontserratMedium',
                    color: Color(0xFF323E48),
                  ),
                ),
              ),
              SizedBox(height: 65),
              _buildTextFieldContainer(_firstNameController, 'First Name'),
              SizedBox(height: 20),
              _buildTextFieldContainer(_lastNameController, 'Last Name'),
              SizedBox(height: 20),
              _buildTextFieldContainer(_emailController, 'Email'),
              SizedBox(height: 20),
              _buildPasswordTextField('Password', _passwordController),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Password should contain at least 1 letter uppercase and a total of 8 characters.',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'MontserratRegular',
                    color: Color(0xFF323E48),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildPasswordTextField('Confirm Password', _confirmPasswordController),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Password should contain at least 1 letter uppercase and a total of 8 characters.',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'MontserratRegular',
                    color: Color(0xFF323E48),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(66, 0, 66, 0),
                child: ElevatedButton(
                  onPressed: () {
                Provider.of<UserProvider>(context, listen: false).signUp(context, _emailController.text.trim(), _passwordController.text.trim(),_firstNameController.text.trim(),_lastNameController.text.trim(), _confirmPasswordController.text.trim());

                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MontserratMedium',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                  
                    minimumSize: Size(342, 62),
                    primary: Color(0xFF297BE6),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                     
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer(TextEditingController controller, String title) {
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
            title,
            style: TextStyle(
              color: Color(0xFF323E48),
              fontFamily: 'MontserratRegular',
              fontSize: 10,
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: title.contains('Password') ? !_isPasswordVisible : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              suffixIcon: title.contains('Password')
                  ? IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField(String title, TextEditingController controller) {
    return _buildTextFieldContainer(controller, title);
  }
}
