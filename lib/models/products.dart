class ProductModel {
  final int productId;
  final String productName;
  final String shortDescription;
  final String image;
  final String rate;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.shortDescription,
    required this.image,
    required this.rate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['id'],
      productName: json['name'],
      shortDescription: json['short_description'],
      image: json['images'][0]['src'],
      rate: json['sale_price'],
    );
  }
}
