import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ReelApi {
  final _baseUrl = 'https://chefease.azurewebsites.net/reel';

  Future<int> createReel(Map<String, String> body, File? video) async {
    var request = http.MultipartRequest('POST', Uri.parse(_baseUrl));
    request.fields.addAll(body);
    if (video != null) {
      var multipartFile = await http.MultipartFile.fromPath(
        'ReelURL',
        video.path,
      );
      request.files.add(multipartFile);
    }
    var response = await request.send();
    return response.statusCode;
  }

  Future<List<dynamic>> getAllReels() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch reels. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getReelByFirebaseId(String firebaseId) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/firebase/$firebaseId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch reel. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> updateReel(
      String firebaseId, Map<String, String> body, File? video) async {
    var request = http.MultipartRequest(
        'PATCH', Uri.parse('$_baseUrl/firebase/$firebaseId'));
    request.fields.addAll(body);
    if (video != null) {
      var multipartFile = await http.MultipartFile.fromPath(
        'video',
        video.path,
      );
      request.files.add(multipartFile);
    }
    var response = await request.send();
    return jsonDecode(await response.stream.bytesToString());
  }

  Future<void> deleteReel(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to delete reel. Status code: ${response.statusCode}');
    }
  }
}
