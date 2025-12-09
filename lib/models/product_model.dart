class ProductModel {
  final String image;
  final String name;
  final int price;
  final String description;

  ProductModel({
    required this.price,
    required this.name,
    required this.image,
    required this.description,
  });

  static List<ProductModel> products = [
    ProductModel(
      price: 100,
      name: "October",
      image: "assets/product/product1.png",
      description: "reversable angora cardigan",
    ),
    ProductModel(
      price: 250,
      name: "October",
      image: "assets/product/product2.png",
      description: "reversable angora cardigan",
    ),
    ProductModel(
      price: 400,
      name: "October",
      image: "assets/product/product3.png",
      description: "reversable angora cardigan",
    ),
    ProductModel(
      price: 200,
      name: "October",
      image: "assets/product/product4.png",
      description: "reversable angora cardigan",
    ),
    ProductModel(
      price: 800,
      name: "October",
      image: "assets/product/product5.png",
      description: "reversable angora cardigan",
    ),
    ProductModel(
      price: 550,
      name: "October",
      image: "assets/product/product6.png",
      description: "reversable angora cardigan",
    ),
  ];
}
