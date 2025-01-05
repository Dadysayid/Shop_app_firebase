import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/favorites_provider.dart';
import 'package:shop_app/providers/authviewmodel.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context).favorites;
    final authViewModel = Provider.of<Authviewmodel>(context, listen: false); // Pour la gestion d'authentification

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: Column(
        children: [
          // Liste des favoris
          Expanded(
            child: favorites.isEmpty
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
                          icon:
                              const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            Provider.of<FavoritesProvider>(context,
                                    listen: false)
                                .removeFavorite(product);
                          },
                        ),
                      );
                    },
                  ),
          ),
          // Bouton de déconnexion en bas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                await authViewModel.logout(context);
                Navigator.pop(context); // Retourner à l'écran précédent après la déconnexion
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
