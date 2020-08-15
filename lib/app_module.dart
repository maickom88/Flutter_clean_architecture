import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/search/data/datasource/github_datasource.dart';
import 'package:flutter_clean_architecture/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture/search/infra/repository/search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => SearchReposioryImpl(i())),
        Bind((i) => SearchBytextImpl(i())),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => throw UnimplementedError();
}
