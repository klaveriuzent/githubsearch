import 'package:flutter/material.dart';
import 'package:githubsearch/common/services/github_service.dart';
import 'package:githubsearch/widgets/custom_input.dart';
import 'package:githubsearch/widgets/custom_button.dart';
import 'package:githubsearch/widgets/custom_card.dart'; // Import CustomCard

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _searchResults = [];

  Future<void> _searchUsers(String query) async {
    try {
      final searchResults = await GitHubService.searchUsers(query);
      setState(() {
        _searchResults = searchResults;
      });
    } catch (e) {
      print('Error searching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 50.0,
                    child: CustomInput(
                      controller: _controller,
                      labelText: 'Search User',
                      icon: Icons.search,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50.0,
                    child: CustomButton(
                      onPressed: () async {
                        final query = _controller.text;
                        if (query.isNotEmpty) {
                          await _searchUsers(query);
                        }
                      },
                      text: 'Search',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final user = _searchResults[index];
                  return CustomCard(
                    imageUrl: user['avatar_url'],
                    name: user['login'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}