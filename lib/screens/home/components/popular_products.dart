import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/product_provider.dart';
import '../../products/products_screen.dart';
import '../../details/details_screen.dart';
import '../../../components/product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
            press: () {
              // Showing all products if they just click "See more"
              Provider.of<ProductProvider>(context, listen: false).filterByCategory("");
              Navigator.pushNamed(context, ProductsScreen.routeName);
            },
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<ProductProvider>(
            builder: (context, provider, child) {
              return Row(
                children: [
                  ...provider.popularProducts.map((product) => Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ProductCard(
                          product: product,
                          onPress: () => Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(product: product),
                          ),
                        ),
                      )),
                  const SizedBox(width: 20),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
