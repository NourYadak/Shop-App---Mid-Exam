import 'package:shop_app/features/product/view_model/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitState());

  final Set<int> favoriteProducts = {};

  void changeFavouirte(int productId) {
    if (favoriteProducts.contains(productId)) {
      favoriteProducts.remove(productId);
    } else {
      favoriteProducts.add(productId);
    }

    emit(ProductChangeFavouirteState());
  }

  bool isFavorite(int productId) {
    return favoriteProducts.contains(productId);
  }
}
