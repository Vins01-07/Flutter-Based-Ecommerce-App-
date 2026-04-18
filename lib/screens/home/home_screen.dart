import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/popular_products.dart';
import 'components/home_header.dart';
import 'components/section_title.dart';
import 'components/special_offers.dart';
import '../../components/product_card.dart';
import '../details/details_screen.dart';
import '../products/products_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const HomeHeader(),
              const DiscountBanner(),
              const Categories(),
              const SizedBox(height: 10),
              
              // New Global Popular Products Section
              const PopularProducts(),
              const SizedBox(height: 30),
              
              // Alternating Layout Core Logic
              Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: provider.specialOffers.map((offer) {
                      return Column(
                        children: [
                          // 1. The Promotional Offer Section
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SectionTitle(
                              title: "Special for you: ${offer.category}",
                              press: () {
                                provider.filterByCategory(offer.category);
                                Navigator.pushNamed(context, ProductsScreen.routeName);
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SpecialOfferCard(
                                  image: offer.image,
                                  category: offer.category,
                                  numOfBrands: offer.numOfBrands,
                                  press: () {
                                    provider.filterByCategory(offer.category);
                                    Navigator.pushNamed(context, ProductsScreen.routeName);
                                  },
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // 2. The Popular Products associated directly with that offer!
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SectionTitle(
                              title: "Top in ${offer.category}",
                              press: () {
                                provider.filterByCategory(offer.category);
                                Navigator.pushNamed(context, ProductsScreen.routeName);
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...provider.getProductsByCategory(offer.category).map((prod) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: ProductCard(
                                      product: prod,
                                      onPress: () => Navigator.pushNamed(
                                        context,
                                        DetailsScreen.routeName,
                                        arguments: ProductDetailsArguments(product: prod),
                                      ),
                                    ),
                                  );
                                }),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
