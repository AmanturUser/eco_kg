import 'dart:convert';
import 'package:eco_kg/core/utils/user.dart';
import 'package:eco_kg/feature/home_feature/domain/entities/userEnum.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/constants/api_constants.dart';

abstract interface class IAuthSourse {
  Future<bool> signIn(String email);
  Future<bool> readAuthKey();
}

@injectable
class AuthSourse implements IAuthSourse {
  final storage = const FlutterSecureStorage();

  Future<bool> signIn(String email) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: '$mainPath/register',
    );
    var request = http.MultipartRequest('POST', uri);
    request.fields['email'] = email;
    var sendRequest = await request.send();
    var response = await http.Response.fromStream(sendRequest);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body)['success'];
    } else {
      print('error');
      print(response.statusCode);
      print(response.request);
      return false;
    }
  }

  @override
  Future<bool> readAuthKey() async {
    final String? password = await storage.read(key: 'authKey');
    return password != null;
  }

  Future<bool> checkConfirmationCode(String code) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      path: '$mainPath/check-confirmation-code',
    );
    var request = http.MultipartRequest('POST', uri);
    request.fields['code'] = code;
    var sendRequest = await request.send();
    var response = await http.Response.fromStream(sendRequest);
    if (response.statusCode == 200) {
      print(response.body);
      final decodeData = jsonDecode(response.body);
      final success = decodeData['success'];
      if (success) {
        print(decodeData['user']['auth_key']);
        await storage.write(
            key: 'authKey', value: decodeData['user']['auth_key']);
        userRole = decodeData['user']['roles']['user'] == 'Пользователь'
            ? UserEnum.applicant : UserEnum.auditor;
        await storage.write(
            key: 'roles', value: decodeData['user']['roles']['user']);
        await storage.write(
            key: 'email', value: decodeData['user']['email']);

      }
      return success;
    } else {
      print('error');
      print(response.statusCode);
      print(response.request);
      return false;
    }
  }
}
