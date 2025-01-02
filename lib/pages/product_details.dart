import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/favorites_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedsize = 0;
  void ontap() {
    if (selectedsize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          "id": widget.product['id'],
          "title": widget.product['title'],
          "price": widget.product['price'],
          "size": selectedsize,
          "company": widget.product['company'],
          "imageurl": widget.product['imageurl']
        },
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("prdoduct add suucefly")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("plese select size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFavorite = favoritesProvider.isFavorite(widget.product);
    return Scaffold(
      appBar:  AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              if (isFavorite) {
                favoritesProvider.removeFavorite(widget.product);
              } else {
                favoritesProvider.addFavorite(widget.product);
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageurl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Text(
                  "\$ ${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedsize = size;
                              });
                            },
                            child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: size == selectedsize
                                    ? Theme.of(context).colorScheme.primary
                                    : null),
                          ),
                        );
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: ontap,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          minimumSize: const Size(double.infinity, 50)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,
                              color: Colors.black), // Ajout de l'icône
                          SizedBox(
                              width: 10), // Espace entre l'icône et le texte
                          Text(
                            "ADD to Cart",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
