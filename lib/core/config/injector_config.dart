import 'package:get_it/get_it.dart';
import 'package:sti3_app/core/http/dio_implementation.dart';
import 'package:sti3_app/core/http/http_client_interface.dart';

final getIt = GetIt.instance;

void setupInjectors() {
  // data sources
  getIt.registerFactory<IHttpClient>(() => DioImplematation());
}