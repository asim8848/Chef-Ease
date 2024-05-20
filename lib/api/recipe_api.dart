// path to this file: lib/api/recipe_api.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class RecipeApi {
  final _baseUrl = 'https://chefease.azurewebsites.net';

  Future<Map<String, dynamic>> createRecipe(
      Map<String, String> body, File? image) async {
    var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/recipe'));
    request.fields.addAll(body);
    if (image != null) {
      var multipartFile = await http.MultipartFile.fromPath(
        'RecipeImageURL', // This is the key for the image
        image.path,
      );
      request.files.add(multipartFile);
    }
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {'status': 'success', 'data': jsonDecode(responseBody)};
    } else {
      return {
        'status': 'error',
        'message':
            'Failed to create recipe. Status code: ${response.statusCode}. Response body: $responseBody'
      };
    }
  }

  Future<List<dynamic>> getAllRecipes() async {
    final response = await http.get(Uri.parse('$_baseUrl/recipe'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch recipes. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getRecipeByRecipeId(String recipeId) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/recipe/firebase/$recipeId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch recipe. Status code: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> getChefRecipes(String chefId) async {
    final response = await http.get(Uri.parse('$_baseUrl/recipe/chef/$chefId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch chef recipes. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> updateRecipe(
      String recipeId, Map<String, String> body) async {
    var response = await http.patch(
      Uri.parse('$_baseUrl/recipe/firebase/$recipeId'),
      body: json.encode(body),
      headers: {"Content-Type": "application/json"},
    );
    return jsonDecode(response.body);
  }

  Future<void> deleteRecipe(String recipeId) async {
    final response =
        await http.delete(Uri.parse('$_baseUrl/recipe/firebase/$recipeId'));

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to delete recipe. Status code: ${response.statusCode}');
    }
  }
}
