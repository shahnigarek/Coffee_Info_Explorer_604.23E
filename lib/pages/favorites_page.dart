import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/coffee_card.dart';
import 'coffee_detail_page.dart';

class FavoritesPage extends StatefulWidget {
  final List<CoffeeModel> coffees;

  const FavoritesPage({
    Key? key,
    required this.coffees,
  }) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favorites = widget.coffees.where((c) => c.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final coffee = favorites[index];
                  return CoffeeCard(
                    coffee: coffee,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CoffeeDetailPage(coffee: coffee),
                        ),
                      );
                      setState(() {});
                    },
                    onFavoriteToggle: () {
                      setState(() {
                        coffee.isFavorite = !coffee.isFavorite;
                      });
                    },
                  );
                },
              ),
            ),
    );
  }
}
