import 'package:dio/dio.dart';
import 'package:sti3_app/core/http/http_client_interface.dart';

class DioImplematation implements IHttpClient{

  final dio = Dio();
  
  @override
  Future<HttpResponse> get(String url) async{
    final response = await dio.get(url);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }
}