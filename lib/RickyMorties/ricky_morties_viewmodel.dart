import 'package:base_response_flutter/RickyMorties/model/character_model.dart';
import 'package:base_response_flutter/core/network/project_manager_network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'ricky_morties.dart';

abstract class RickMortiesViewModel extends State<RickyMorties> {
  final Dio dio = ProjectNetwork.instance.dio;
  List<CharacterModel> models = [];
  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.EPISODE.rawValue);

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final baseCharacterModel = BaseResponseCharacter.fromJson(data);
        models = baseCharacterModel.results ?? [];
      } else if (data is List) {
        models = data.map((e) => CharacterModel.fromJson(e)).toList();
      }
    }
    setState(() {});
  }
}

enum ServicePath { EPISODE }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.EPISODE:
        return '/episode';
    }
  }
}
