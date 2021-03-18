import 'package:boilerplate/api/RestApi.dart';
import 'package:boilerplate/local/DataCache.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dependencies {
  static init() async {
    final injector = Injector.appInstance;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    injector.registerSingleton<DataCache>(() => DataCache(_preferences));
    injector.registerDependency<RestApi>(() => RestApi());
  }
}