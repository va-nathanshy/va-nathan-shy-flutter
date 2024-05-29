import 'package:do_doot_app/models/category_model.dart';

abstract class CategoryRepositoryInterface {
  Future<List<CategoryModel>> getAllCategories();
  Future<CategoryModel?> getCategory(int id);
  Future<int> addCategory(CategoryModel category); //returns id
  Future<int> updateCategory(CategoryModel category); //returns id
  Future<void> deleteCategory(int id);
}
