import 'package:dio/dio.dart';

class NetConfig{
  static String baseUrl='http://1.1.1.1/';//服务器地址

  static Future post(String email,String password)async{
    Response response;
    var dio=Dio();
    dio.options.baseUrl=baseUrl;
    String path='user/register';
    response=await dio.post(path,queryParameters: {'email':email,'password':password});
    print(response.data.toString());
    if(response.statusCode==200){///约定值
      return response;
    }else{
      return null;
    }
  }
}
class XinxiConfig{
  static String baseUrl='http://1.1.1.1/';

  static Future post(String email,String password,String name,String grade)async{
    Response response;
    var dio=Dio();
    dio.options.baseUrl=baseUrl;
    String path='user/register';
    response=await dio.post(path,queryParameters: {'email':email,'password':password});
    print(response.data.toString());
    if(response.statusCode==200){
      return response;
    }else{
      return null;
    }
  }
}