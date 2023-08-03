import 'package:untitled6/data/network.dart';
import 'package:untitled6/domain/repository/repository.dart';

late final ValyutaRepository repository;

void serviceLocator() {
  repository = ValyutaRepositoryImpl(HttpNetwork());
}