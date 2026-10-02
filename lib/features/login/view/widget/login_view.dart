part of '../login_screen.dart';

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppPages.productScreen,
            arguments: {'email': state.email, 'password': state.password},
            (route) => false,
          );
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Form(
                key: context.read<LoginCubit>().formKey,
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
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      controller: context.read<LoginCubit>().emailController,
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
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 30,
                        color: Colors.grey,
                      ),
                      obscureText: true,
                      controller: context.read<LoginCubit>().passwordController,
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
                          Navigator.of(context)
                              .pushNamed(AppPages.forgotPassScreen);
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
                      onPressed: context.read<LoginCubit>().login,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(340, 55),
                        backgroundColor: AppColors.primary,
                      ),
                      child: state is LoginLoadingState
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            )
                          : Text(
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
                      child: Row(
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
        );
      },
    );
  }
}
