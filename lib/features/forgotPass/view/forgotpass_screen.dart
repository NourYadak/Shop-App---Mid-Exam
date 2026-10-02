import 'dart:developer';
import 'package:shop_app/core/regex/app_regex.dart';
import 'package:shop_app/core/routes/app_pages.dart';
import 'package:shop_app/core/utils/theme/app_colors.dart';
import 'package:shop_app/core/utils/widgets/appbar/main_app_bar.dart';
import 'package:shop_app/core/utils/widgets/textfield/main_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen > {
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
  void didUpdateWidget(covariant ForgotPassScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(title: 'Forgot Password'),
      body: Align(
        alignment: Alignment.topCenter,
        
        child: Padding(
    padding: const EdgeInsets.fromLTRB(30, 55, 30, 0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: const Color.fromARGB(255, 212, 230, 250),
                    child: Image.asset('assets/images/lock_icon.png', width: 80, height: 80),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Reset Your Password',
                    style: TextStyle(
                      fontFamily: 'quiksand',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Enter your email and we\'ll send you a link to reset your password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'quiksand',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
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
                      'Send Reset Link',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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
    // formKey.currentState?.save();

    //  if (formKey.currentState?.validate() ?? false) {
    // log(passwordController.text);
    //   log(email);
    //   Navigator.of(context).pushNamed(
    //     AppPages.productScreen,
    //    arguments: {
    //      'email': emailController.text,
    //    'password': passwordController.text,
    //    },
    //   );
    // }
  }
}
