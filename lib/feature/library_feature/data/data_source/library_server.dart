import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:eco_kg/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';

import '../../domain/entities/param_entity.dart';

abstract interface class ILibraryDataSourse {
  Future<LibraryEntity> postLibrary();
  Future<ParamEntity> getParam(String lanCode);
}

@injectable
class LibraryDataSourse implements ILibraryDataSourse {
  @override
  Future<LibraryEntity> postLibrary() async {
    var uri = Uri(
      scheme: schemeLibrary,
      host: ipLibrary,
      path: 'api/library/list',
    );

    var response = await http.post(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return LibraryEntity.fromJson(jsonDecode(response.body));
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw Exception(response.reasonPhrase);
    }
  }

  @override
  Future<ParamEntity> getParam(String lanCode) async {
    var uri = Uri(
      scheme: schemeLibrary,
      host: ipLibrary,
      path: 'api/library/param-list',
        queryParameters: {'language' : lanCode}
    );

    var response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return ParamEntity.fromJson(jsonDecode(response.body));
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw Exception(response.reasonPhrase);
    }
  }
}

