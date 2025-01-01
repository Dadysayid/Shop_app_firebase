import 'package:flutter/material.dart';
import 'package:shop_app/globale_variable.dart';
import 'package:shop_app/widgets/product_cart.dart';
import 'package:shop_app/pages/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filtres = const ["All", "Nike", "Adidas", "Puma"];
  late String selectedfiltre;
  TextEditingController searchController =
      TextEditingController(); // Contrôleur pour la recherche
  String searchQuery = ""; // Variable pour stocker la recherche
  @override
  void initState() {
    selectedfiltre = filtres[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products
        .where((product) =>
            (selectedfiltre == 'All' || product['company'] == selectedfiltre) &&
            (searchQuery.isEmpty ||
                product['title']
                    .toString()
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase())))
        .toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text("Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: searchController, // Utilisation du contrôleur
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value; // Mettre à jour la recherche
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(225, 225, 225, 1)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(225, 225, 225, 1)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filtres.length,
              itemBuilder: (context, index) {
                final filtre = filtres[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedfiltre = filtre;
                      });
                    },
                    child: Chip(
                      label: Text(filtre),
                      backgroundColor: selectedfiltre == filtre
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: selectedfiltre == filtre
                            ? Colors.white
                            : Colors.black,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(product: product),
                        ),
                      );
                    },
                    child: ProductCart(
                      title: product['title'] as String,
                      price: product['price'] as int,
                      image: product['imageurl'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
