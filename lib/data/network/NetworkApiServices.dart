

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_excaption.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetAPiResponse(String url)async {
    dynamic responseJson ;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostAPiResponse(String url, dynamic data) async{
    dynamic responseJson ;
    try{
      Response response = await post(
        Uri.parse(url),
        body:  data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
        default:
          throw FetchDataException('Error occurred While communication with server'+'with status code'
              +response.statusCode.toString());
    }
  }
}