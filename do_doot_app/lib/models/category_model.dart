class CategoryModel {
  String id;
  String categoryName;

  CategoryModel({
    required this.id,
    required this.categoryName,
  });

  static List<CategoryModel> setCategories() {
    List<CategoryModel> categoryList = [];

    categoryList.add(CategoryModel(
      id: '01',
      categoryName: 'Category 01',
    ));

    categoryList.add(CategoryModel(
      id: '02',
      categoryName: 'Category 02',
    ));

    categoryList.add(CategoryModel(
      id: '03',
      categoryName: 'Category 03',
    ));

    return categoryList;
  }
}
