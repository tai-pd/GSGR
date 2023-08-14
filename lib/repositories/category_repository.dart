import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/responses/category_response.dart';
import 'package:gsgr/value/constants.dart';

class CategoryReposity {
  ApiManager api = ApiManager();

  Future<CategoryResponse> getListCateGory() async {
    final repon = await api.get(Constants.apiUrlListCategory);
    return CategoryResponse.fromJson(repon);
  }
}
