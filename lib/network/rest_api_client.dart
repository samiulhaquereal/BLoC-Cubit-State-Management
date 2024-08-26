import 'dart:convert';

import 'package:blocstatemanagement/model/user_model.dart';
import 'package:http/http.dart' as http;

class RestApiClient{

  Future<List<UserModel>> getData()async{
    List<UserModel> userData = [];
    try{
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      List<dynamic> data = jsonDecode(response.body);
      data.forEach((element) {
        UserModel model = UserModel.fromJson(element);
        userData.add(model);
      });
    }catch(e){

    }
    return userData;
  }


}