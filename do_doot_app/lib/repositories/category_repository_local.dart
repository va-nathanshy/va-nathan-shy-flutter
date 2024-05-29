import 'package:do_doot_app/models/category_model.dart';
import 'package:do_doot_app/database/category_db.dart';
import 'package:do_doot_app/repositories/category_repository.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final CategoryDb _db;

  CategoryRepository(this._db);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    List<Map<String, dynamic>> categoryItems = await _db.getAllCategories();
    return categoryItems.map((item) => CategoryModel.fromMap(item)).toList();
  }

  @override
  Future<CategoryModel?> getCategory(int id) async {
    Map<String, dynamic>? category = await _db.getCategory(id);
    return category != null ? CategoryModel.fromMap(category) : null;
  }

  @override
  Future<int> addCategory(CategoryModel category) async{
    return _db.addCategory(category.toMap());
  }

  @override
  Future<int> updateCategory(CategoryModel updatedCategory) async{
    return _db.updateCategory(updatedCategory.toMap());
  }

  @override
  Future<void> deleteCategory(int id) async{
    _db.removeCategory(id);
  }
}
