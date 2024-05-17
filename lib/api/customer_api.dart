import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class CustomerApi {
  final _baseUrl = 'https://chefease.azurewebsites.net/customer';

  Future<Map<String, dynamic>> getCustomer(String uid) async {
    final response = await http.get(Uri.parse('$_baseUrl/firebase/$uid'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch user data. Status code: ${response.statusCode}');
    }
  }

  Future<http.Response> createCustomer(
      Map<String, String> body, File? image) async {
    var request = http.MultipartRequest('POST', Uri.parse(_baseUrl));
    request.fields.addAll(body);
    if (image != null) {
      var multipartFile = await http.MultipartFile.fromPath(
        'ProfileImageURL',
        image.path,
      );
      request.files.add(multipartFile);
    }
    var response = await request.send();
    return http.Response.fromStream(response);
  }

  Future<http.Response> updateCustomer(Map<String, String> body) async {
    var headers = {"Content-Type": "application/json"};
    var response = await http.patch(
      Uri.parse('$_baseUrl/firebase/${body["CustomerFirebaseID"]}'),
      headers: headers,
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> deleteCustomer(String uid) async {
    var response = await http.delete(
      Uri.parse('$_baseUrl/firebase/$uid'),
    );
    return response;
  }
}
