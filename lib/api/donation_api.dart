import 'dart:convert';
import 'package:http/http.dart' as http;

class DonationApi {
  final _baseUrl = 'https://chefease.azurewebsites.net/donationRequests';

  Future<Map<String, dynamic>> createDonationRequest(
      Map<String, dynamic> donationData) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(donationData),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to create donation request. Status code: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> fetchAllDonationRequests() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch donation requests. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> fetchDonationRequestById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch donation request by ID. Status code: ${response.statusCode}');
    }
  }
}
