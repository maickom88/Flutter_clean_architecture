import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/app_module.dart';
import 'package:flutter_clean_architecture/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/search/domain/usecases/search_by_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

main() {
  initModule(AppModule());
  test('Deve recuperar o usercase sem erro', () {
    final usecase = Modular.get<ISearchByText>();
    expect(usecase, isA<SearchBytextImpl>());
  });
  test('Deve recuperar uma lista de resultSearch', () async {
    final usecase = Modular.get<ISearchByText>();
    final result = await usecase("Michael");
    expect(result | null, isA<List<ResultSearch>>());
  });
}
