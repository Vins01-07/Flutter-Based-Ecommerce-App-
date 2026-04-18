import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

import 'package:provider/provider.dart';
import '../../products/products_screen.dart';
import '../../../providers/product_provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal", "cat": "Flash"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Gaming", "cat": "Gaming"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Tech", "cat": "Smartphone"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Fashion", "cat": "Fashion"},
      {"icon": "assets/icons/Discover.svg", "text": "All", "cat": ""},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              Provider.of<ProductProvider>(context, listen: false)
                  .filterByCategory(categories[index]["cat"]);
              Navigator.pushNamed(context, ProductsScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: kPrimaryColor.withValues(alpha: 0.15),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withValues(alpha: 0.08),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                kPrimaryColor.withValues(alpha: 0.9),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

