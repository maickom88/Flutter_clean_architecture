import 'package:flutter_clean_architecture/search/domain/usecases/search_by_text.dart';

abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DataSourceError implements FailureSearch {
  final String messege;

  DataSourceError({this.messege});
}
