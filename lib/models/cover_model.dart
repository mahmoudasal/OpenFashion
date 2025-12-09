class CoverModel {
  final String image;
  final String name;

  CoverModel({required this.image, required this.name});

  static List<CoverModel> covers = [
    CoverModel(image: "assets/cover/cover3.png", name: "Black Collection"),
    CoverModel(image: "assets/cover/cover2.png", name: "Hekey Meky Collection"),
    CoverModel(image: "assets/cover/cover1.png", name: "White Collection"),
  ];
}
