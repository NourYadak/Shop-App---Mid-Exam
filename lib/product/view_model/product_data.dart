import 'package:shop_app/api/api_service.dart';
import 'package:shop_app/product/model/response_product.dart';

class ProductData {
  final apiService = ApiService();

  ResponseProduct getProduct() {
    final snapshot = apiService.getProduct();
    final responseProduct = ResponseProduct.fromJson(snapshot);
    return responseProduct;
  }
}
