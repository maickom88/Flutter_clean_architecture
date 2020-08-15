import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/search/infra/datasources/search_datasources.dart';
import 'package:flutter_clean_architecture/search/infra/models/result_search_model.dart';
import 'package:flutter_clean_architecture/search/infra/repository/search_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasouceMock extends Mock implements ISearchDatasource {}

main() {
  final datasource = SearchDatasouceMock();
  final repository = SearchReposioryImpl(datasource);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search('kjkljlk');

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar um error se datasource falhar', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search('kjkljlk');

    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
