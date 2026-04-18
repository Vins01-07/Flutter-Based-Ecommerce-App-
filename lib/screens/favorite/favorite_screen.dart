import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/providers/product_provider.dart';

import '../details/details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/favorite";

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "Favorites",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  final favorites = provider.favoriteProducts;
                  if (favorites.isEmpty) {
                    return const Center(
                      child: Text(
                        "No favorites yet!",
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }
                  return GridView.builder(
                    itemCount: favorites.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: favorites[index],
                      onPress: () => Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: ProductDetailsArguments(product: favorites[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
