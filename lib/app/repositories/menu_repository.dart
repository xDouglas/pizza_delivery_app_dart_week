
import 'package:dio/dio.dart';
import 'package:pizza_delivery_app/app/exceptions/rest_exception.dart';
import 'package:pizza_delivery_app/app/models/menu_model.dart';

class MenuRepository {
  
  Future<List<MenuModel>> findAll() async {
    try {
      final response = await Dio().get('http://localhost:8888/menu');
      return response.data.map<MenuModel>((m) => MenuModel.fromMap(m)).toList();
    } on DioError catch (e) {
      print(e);
      throw RestException('Erro ao buscar cardápio');
    }
  }

}