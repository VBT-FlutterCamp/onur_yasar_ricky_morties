import 'package:dio/dio.dart';

class ProjectNetwork {
  static ProjectNetwork? _instance;
  static ProjectNetwork get instance {
    if (_instance != null) return _instance!;
    _instance = ProjectNetwork._init();
    return _instance!;
  }

  final String _baseUrl = "https://rickandmortyapi.com/api";
  late final Dio dio;
  ProjectNetwork._init() {
    dio = Dio(
      BaseOptions(baseUrl: _baseUrl),
    );

    dio.interceptors.add(InterceptorsWrapper(onResponse: (e, handler) {
      final data = e.data;
      if (data is Map) {
        e.data = data['results'];
      }
      handler.next(e);
    }));
  }
}
