import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements ISearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchBytextImpl(repository);

  test('Ele deve retorna uma lista de result search', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase("Search by text");
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar uma FailureSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    expect(result.isLeft(), true);
    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
