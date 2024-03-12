import 'dart:convert';
import 'package:http/http.dart' as http;

class GitHubService {
  static Future<List<dynamic>> searchUsers(String query) async {
    final response = await http.get(Uri.parse('https://api.github.com/search/users?q=$query+in:name'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to search users');
    }
  }
}