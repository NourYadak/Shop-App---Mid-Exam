import 'dart:developer';
import 'package:shop_app/regex/app_regex.dart';
import 'package:shop_app/routes/app_pages.dart';
import 'package:shop_app/utils/theme/app_colors.dart';
import 'package:shop_app/utils/widgets/appbar/main_app_bar.dart';
import 'package:shop_app/utils/widgets/textfield/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/product/view/product_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHide = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void changeIsHide() {
    setState(() {
      isHide = !isHide;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/app_icon.png'),
                  ),
                  Text(
                    'ShopApp',
                    style: TextStyle(
                      fontFamily: 'quiksand',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                   Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontFamily: 'quiksand',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                   Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontFamily: 'quiksand',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 99, 99, 99),
                    ),
                  ),
                 SizedBox(height: 30),
                  MainTextField(
                    prefixIcon: Icon(Icons.email_outlined, size: 30, color: Colors.grey),
                    controller: emailController,
                    validator: (email) {
                      if (email?.isEmpty ?? true) {
                        return 'Email is required.';
                      }
                      if (!AppRegex.emailRegex.hasMatch(email!)) {
                        return 'Invalid email. Hint: email@example.com';
                      }
                      return null;
                    },
                    labelText: 'Email',
                  ),
                  SizedBox(height: 25),
                  MainTextField(
                    prefixIcon: Icon(Icons.lock_outline, size: 30, color: Colors.grey),
                    obscureText: true,
                    controller: passwordController,
                    validator: (password) {
                      if (password?.isEmpty ?? true) {
                        return 'Password is required.';
                      }
                      // else if (!password!.contains(AppRegex.passwordRegex)) {
                      // return 
                      // 'Password must be at least 8 characters, with uppercase, lowercase, number, and symbol.';
                      // }
                      return null;
                    },
                    labelText: 'Password',
                  ),
                  Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppPages.forgotPassScreen);
                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'quiksand',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
      
                  ),
                  
                  SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(340, 55),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
               
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'quiksand',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 99, 99, 99),
                    ),
                  ),
                  TextButton(
                  onPressed: () {
                    // Navigate to Sign Up screen
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'quiksand', 
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                ],
                ),  
                ),
               
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String email = '';
  void onPressed() {
    formKey.currentState?.save();

     if (formKey.currentState?.validate() ?? false) {
    log(passwordController.text);
      log(email);
      Navigator.of(context).pushReplacementNamed(
        AppPages.productScreen,
       arguments: {
         'email': emailController.text,
       'password': passwordController.text,
       },
      );
    }
  }
}
