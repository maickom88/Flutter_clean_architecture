import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/search/infra/datasources/search_datasources.dart';
import 'package:flutter_clean_architecture/search/infra/models/result_search_model.dart';

extension on String {
  nomalize() {
    return this.replaceAll(' ', '+');
  }
}

class GithubDatasource implements ISearchDatasource {
  final Dio dio;

  GithubDatasource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await this
        .dio
        .get('https://api.github.com/search/users?q=${searchText.nomalize()}');
    if (response.statusCode == 200) {
      var jsonList = response.data["items"] as List;
      var list = jsonList.map((e) => ResultSearchModel.fromJson(e)).toList();
      return list;
    } else {
      throw DataSourceError();
    }
  }
}
