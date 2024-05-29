class CategoryModel {
  int id;
  String categoryName;

  CategoryModel({
    required this.id,
    required this.categoryName,
  });

  CategoryModel.fromMap(Map<String, dynamic> data)
      : id = data['id'] ?? 0,
        categoryName = data['categoryName'] ?? '';

  Map<String, dynamic> toMap() => {
        'id': id,
        'categoryName': categoryName,
      };

  static List<CategoryModel> setCategories() {
    List<CategoryModel> categoryList = [];

    categoryList.add(CategoryModel(
      id: 1,
      categoryName: 'Category 01',
    ));

    categoryList.add(CategoryModel(
      id: 2,
      categoryName: 'Category 02',
    ));

    categoryList.add(CategoryModel(
      id: 3,
      categoryName: 'Category 03',
    ));

    return categoryList;
  }
}
