//chef_api.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ChefApi {
  final _baseUrl = 'https://chefease.azurewebsites.net/chef';

  Future<Map<String, dynamic>> getChef(String firebaseId) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/firebase/$firebaseId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch chef data. Status code: ${response.statusCode}');
    }
  }

  Future<http.Response> createChef(
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
    // Set the Content-Type header
    request.headers['Content-Type'] = 'multipart/form-data';
    // Print the request data to the console
    print('Request URL: ${request.url}');
    print('Request Method: ${request.method}');
    print('Request Headers: ${request.headers}');
    print('Request Fields: ${request.fields}');

    if (request.files.isNotEmpty) {
      print('Request File: ${request.files.first.field}');
    }
    var response = await request.send();
    print(response.statusCode); // Print the status code
    print(response.reasonPhrase); // Print the reason phrase
    return http.Response.fromStream(response);
  }

  Future<http.Response> updateChef(Map<String, String> body) async {
    var headers = {"Content-Type": "application/json"};
    var response = await http.patch(
      Uri.parse('$_baseUrl/firebase/${body["ChefFirebaseID"]}'),
      headers: headers,
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> deleteChef(String firebaseId) async {
    var response = await http.delete(
      Uri.parse('$_baseUrl/firebase/$firebaseId'),
    );
    return response;
  }
}
