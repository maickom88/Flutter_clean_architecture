import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/search/infra/datasources/search_datasources.dart';

class SearchReposioryImpl implements ISearchRepository {
  final ISearchDatasource datasource;

  SearchReposioryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
