import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../services/favorites_service.dart';

class FavoritesPage extends StatefulWidget {
  final List<CoffeeModel> allCoffees;

  const FavoritesPage({Key? key, required this.allCoffees}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<CoffeeModel> favoriteCoffees = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    final favNames = await FavoritesService.getFavorites();
    final filtered = widget.allCoffees
        .where((coffee) => favNames.contains(coffee.name))
        .toList();
    setState(() {
      favoriteCoffees = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      body: favoriteCoffees.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteCoffees.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final coffee = favoriteCoffees[index];
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          coffee.imageAsset,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          coffee.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
