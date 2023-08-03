import 'dart:convert';

import 'package:untitled6/core/apis.dart';
import 'package:untitled6/data/network.dart';
import 'package:untitled6/domain/model/valyuta.dart';

abstract class ValyutaRepository {
  Future<List<Valyuta>> fetchAll();
  Future<List<Valyuta>> fetchAllFlag();
}

class ValyutaRepositoryImpl implements ValyutaRepository {
  final Network network;
  ValyutaRepositoryImpl(this.network);

  @override
  Future<List<Valyuta>> fetchAll() async {
    final data = await network.methodGet(api: Api.apiValyuta);
    final  List item = jsonDecode(data!);
    final result = item.map((e) => Valyuta.fromJson(e)).toList();
    return result;
  }

  @override
  Future<List<Valyuta>> fetchAllFlag() async {
    final data = await network.methodGet(api: Api.apiFlag);
    final  List item = jsonDecode(data!);
    final result = item.map((e) => Valyuta.fromJson(e)).toList();
    return result;
  }
}