class ResponseProductData {
  final int? productId;
  final String? productName;
  final String? productBrand;
  final String? productCategory;
  final double? productPrice;
  final String? productDescription;
  final String? productImage;
  final int? productStock;
  final double? productRating;
  final bool? featured;

  ResponseProductData({
    required this.productId,
    required this.productName,
    required this.productBrand,
    required this.productCategory,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.productStock,
    required this.productRating,
    required this.featured,
  });

  factory ResponseProductData.fromJson(Map<String, dynamic> json) {
    return ResponseProductData(
      productId: json['id'],
      productName: json['name'],
      productBrand: json['brand'],
      productCategory: json['category'],
      productPrice: json['price'],
      productDescription: json['description'],
      productImage: json['image'],
      productStock: json['stock'],
      productRating: json['rating'],
      featured: json['isFeatured'],
    );
  }
}