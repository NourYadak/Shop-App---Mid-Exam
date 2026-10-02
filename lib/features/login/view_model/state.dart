import 'package:shop_app/features/login/view_model/cubit.dart';
import 'package:shop_app/features/login/view_model/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(LoginLoadingState());
      await Future.delayed(Duration(seconds: 2));

      if (emailController.text == 'test@gmail.com') {
        emit(
          LoginSuccessState(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      } else {
        emit(LoginErrorState(error: 'User Not Found'));
      }
    }
  }

  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
