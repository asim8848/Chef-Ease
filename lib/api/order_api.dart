import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderApi {
  final _baseUrl = 'https://chefease.azurewebsites.net/order';

  Future<Map<String, dynamic>> createOrder(
      Map<String, dynamic> orderData) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(orderData),
    );

    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return {'status': 'success', 'data': responseBody};
    } else {
      return {'status': 'error', 'message': responseBody};
    }
  }

  Future<List<dynamic>> fetchOrdersByCustomer(String customerFirebaseId) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/customer/$customerFirebaseId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch orders. Status code: ${response.statusCode}');
    }
  }
}
