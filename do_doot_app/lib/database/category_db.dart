//import 'package:do_doot_app/models/category_model.dart';

import 'package:do_doot_app/models/category_model.dart';

class CategoryDb {
  List<Map<String, dynamic>> _categories = [];

  static final CategoryDb _db = CategoryDb._privateConstructor();

  CategoryDb._privateConstructor();

  factory CategoryDb() {
    return _db;
  }

  Future<int> addCategory(Map<String, dynamic> category) async {
    category['id'] = _categories.length + 1;
    _categories.add(category);

    return category['id'];
  }

  Future<int> updateCategory(Map<String, dynamic> updatedCategory) async {
    int i = _categories
        .indexWhere((category) => category['id'] == updatedCategory['id']);
    _categories[i] = updatedCategory;

    return updatedCategory['id'];
  }

  Future<void> removeCategory(int id) async {
    _categories.removeWhere((category) => category['id'] == id);
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    return _categories;
  }

  Future<Map<String, dynamic>?> getCategory(int id) async {
    return _categories.firstWhere((category) => category['id'] == id);
  }

  void generateSampleData() {
    List<Map<String, dynamic>> sampleData = [
      CategoryModel(id: 0, categoryName: 'All').toMap(),
      CategoryModel(id: 1, categoryName: 'Work').toMap(),
      CategoryModel(id: 2, categoryName: 'Hobbies').toMap(),
      CategoryModel(id: 3, categoryName: 'Housework').toMap(),
    ];

    _categories = [..._categories, ...sampleData];
  }
}
