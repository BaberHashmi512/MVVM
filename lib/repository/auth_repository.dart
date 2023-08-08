
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginAPi(dynamic data) async{

    try{
       dynamic response = await _apiServices.getPostAPiResponse(AppUrl.loginEndPoint, data);
       return response;
    }catch(e){
      throw e;
    }

  }
}