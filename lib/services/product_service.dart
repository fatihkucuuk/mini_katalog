import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String apiUrl = "https://wantapi.com/products.php"; 

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      try {
        final jsonBody = json.decode(response.body);
        final List<dynamic> data = jsonBody['data']; 
        return data.map((item) => Product.fromJson(item)).toList();
      } catch (e) {
        print("JSON parsing error: $e");
        return [];
      }
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}