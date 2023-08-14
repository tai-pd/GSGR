import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/responses/new_response.dart';

class NewsRepository {
  ApiManager api = ApiManager();

  Future<NewsResponse> getNewsData() async {
    final repon = await api.get('https://beta.giatsaygiare.vn/api/news');
    return NewsResponse.fromJson(repon);
  }
}
