// path to this file: lib/api/order_api.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'chef_api.dart';

class OrderApi {
  final _baseUrl = 'https://chefease.azurewebsites.net/recipe';

  Future<List<Map<String, dynamic>>> fetchPizzas() async {
    final response = await http.get(Uri.parse('$_baseUrl'));

    if (response.statusCode == 200) {
      List<dynamic> pizzaList = jsonDecode(response.body);
      List<Map<String, dynamic>> pizzas = [];

      for (var pizza in pizzaList) {
        var pizzaMap = pizza as Map<String, dynamic>;
        var chefFirebaseID = pizzaMap['ChefFirebaseID'];

        // Fetch chef details
        var chefDetails = await ChefApi().getChef(chefFirebaseID);
        pizzaMap['ChefName'] = chefDetails['Name'];
        pizzaMap['ChefProfileImageURL'] = chefDetails['ProfileImageURL'];

        pizzas.add(pizzaMap);
      }
      return pizzas;
    } else {
      throw Exception(
          'Failed to fetch pizzas. Status code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> fetchRecipeDetails(String recipeId) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/$recipeId')); // Updated endpoint

    if (response.statusCode == 200) {
      var recipeDetails = jsonDecode(response.body);
      var chefFirebaseID = recipeDetails['ChefFirebaseID'];

      // Fetch chef details
      var chefDetails = await ChefApi().getChef(chefFirebaseID);
      recipeDetails['ChefName'] = chefDetails['Name'];
      recipeDetails['ChefProfileImageURL'] = chefDetails['ProfileImageURL'];

      return recipeDetails;
    } else {
      throw Exception(
          'Failed to fetch recipe details. Status code: ${response.statusCode}');
    }
  }
}
