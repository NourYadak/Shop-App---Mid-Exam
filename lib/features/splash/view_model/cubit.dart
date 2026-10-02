import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/splash/view_model/state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitState());

  void goNextPage() async {
    await Future.delayed(Duration(seconds: 9));
    emit(SplashOnBoardPageState());
  }
}
