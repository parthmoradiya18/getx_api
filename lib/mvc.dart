import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class class_ extends GetxController{
  RxList list_ =[].obs;
  get()
  async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map map_=jsonDecode(response.body);
    list_.value=map_['products'];

  }
}