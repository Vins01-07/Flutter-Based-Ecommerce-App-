import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../providers/product_provider.dart';
import '../../products/products_screen.dart';

import '../../../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {
          Provider.of<ProductProvider>(context, listen: false).searchByKeyword(value);
        },
        onFieldSubmitted: (value) {
          Navigator.pushNamed(context, ProductsScreen.routeName);
        },
        style: GoogleFonts.outfit(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF1E293B),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: kPrimaryColor.withValues(alpha: 0.5), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
          ),
          hintText: "Search products...",
          hintStyle: GoogleFonts.outfit(
            color: Colors.white38,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: kPrimaryColor.withValues(alpha: 0.7),
            size: 22,
          ),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(14)),
  borderSide: BorderSide.none,
);

