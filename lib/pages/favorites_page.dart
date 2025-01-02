import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/favorites_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet!"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(product['imageurl']),
                  ),
                  title: Text(product['title']),
                  subtitle: Text("\$${product['price']}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () {
                      Provider.of<FavoritesProvider>(context, listen: false)
                          .removeFavorite(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}