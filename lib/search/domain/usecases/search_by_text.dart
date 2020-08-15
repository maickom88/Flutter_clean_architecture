import 'package:flutter_clean_architecture/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/search/domain/errors/errors.dart';

abstract class ISearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchBytextImpl implements ISearchByText {
  final ISearchRepository respository;

  SearchBytextImpl(this.respository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }

    return respository.search(searchText);
  }
}
