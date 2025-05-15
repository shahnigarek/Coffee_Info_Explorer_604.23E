import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String key = 'favoriteCoffees';

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> toggleFavorite(String coffeeName) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(key) ?? [];

    if (favorites.contains(coffeeName)) {
      favorites.remove(coffeeName);
    } else {
      favorites.add(coffeeName);
    }

    await prefs.setStringList(key, favorites);
  }

  static Future<bool> isFavorite(String coffeeName) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(key) ?? [];
    return favorites.contains(coffeeName);
  }
}
