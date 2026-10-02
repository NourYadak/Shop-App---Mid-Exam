import 'package:shop_app/features/product/model/response_product_data.dart';

class ResponseProduct {
  final String? status;
  final String? message;
  final List<ResponseProductData> responseProductData;

  ResponseProduct({
    required this.status,
    required this.message,
    required this.responseProductData,
  });

  factory ResponseProduct.fromJson(Map<String, dynamic> json) {
    final List<ResponseProductData> productdata = [];
    for (var data in json['products']) {
      productdata.add(ResponseProductData.fromJson(data));
    }
    return ResponseProduct(
      message: json['message'],
      status: json['status'],
      responseProductData: productdata,
    );
  }
}
