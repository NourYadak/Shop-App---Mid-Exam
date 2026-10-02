import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/regex/app_regex.dart';
import 'package:shop_app/core/routes/app_pages.dart';
import 'package:shop_app/core/utils/theme/app_colors.dart';
import 'package:shop_app/core/utils/widgets/appbar/main_app_bar.dart';
import 'package:shop_app/core/utils/widgets/textfield/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/login/view_model/cubit.dart';
import 'package:shop_app/features/login/view_model/state.dart';
part 'widget/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: MainAppBar(title: 'Login'),
        body: const _LoginView(),
      ),
    );
  }
}
