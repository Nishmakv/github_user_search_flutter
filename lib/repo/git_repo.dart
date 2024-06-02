import 'package:git_project/model/git_model.dart';
import 'package:git_project/network/api_manager.dart';
import 'package:git_project/network/app_uris.dart';
import 'package:git_project/network/base_result.dart';

class GitRepo {
  ApiManager apiManager = ApiManager();

  Future<Result<GitModel>> gitRepo(String searchQuery) async {
    try {
      final response = await apiManager.get('${AppUris.gitUrl}$searchQuery');
      if (response.statusCode == 200) {
        final git = response.data;
        final result = GitModel.fromJson(git);
        return Result.success(result);
      } else {
        print('else');
        return Result.failure('Api fetching failed');
      }
    } catch (e) {
      return Result.failure('An error occurred');
    }
  }
}
