// category_controller.dart
import 'package:damasauction/models/category/category_model.dart';
import 'package:damasauction/services/api_response.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var categoryModel =
      CategoryModel(attributes: [], categoryId: 0, name: '', description: '')
          .obs;
  var errorMessage = ''.obs;

  final ApiService apiService = ApiService();

  Future<void> fetchCategoryDetails(int categoryId) async {
    try {
      isLoading(true);
      var attributes = await apiService.fetchCategoryDetails(categoryId);
      categoryModel.value = CategoryModel(
          attributes: attributes,
          categoryId: categoryId,
          name: '',
          description: '');
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);
    }
  }
}
