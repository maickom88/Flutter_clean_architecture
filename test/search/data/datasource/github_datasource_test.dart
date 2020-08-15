import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/search/data/datasource/github_datasource.dart';
import 'package:flutter_clean_architecture/search/domain/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_url.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);

  test('Ele deve retorna uma lista de ResultSearchModel', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: json.decode(githubResult), statusCode: 200));
    final future = datasource.getSearch('Michael Frank');
    expect(future, completes);
  });

  test('Deve retornar um erro se o codigo não for 200', () {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DataSourceError>()));
  });
}
