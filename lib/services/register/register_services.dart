import 'package:dio/dio.dart';
import 'package:first_app/interfaces/login/login_interface.dart';
import 'package:first_app/interfaces/register/register_interface.dart';
import 'package:first_app/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class RegisterService extends IRegister{
  @override
    Future<RegisterModel?> login(String name,String email, String password) async {
    const api = 'https://reqres.in/api/register';
    final data = {'email': email, 'password': password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return RegisterModel(name: name,email: email, token: body['token']);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(email: email, token: token);
    } else {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final email = storage.getString('EMAIL');
    final token = storage.getString('TOKEN');
    if (email != null && token != null) {
      await storage.remove('TOKEN');
      await storage.remove('EMAIL');
      return true;
    } else {
      return false;
    }
  }
}