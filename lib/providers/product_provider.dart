import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/special_offer.dart';
import '../services/firestore_service.dart';

class ProductProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  List<Product> _products = [];
  List<SpecialOffer> _specialOffers = [];

  String _searchQuery = '';
  String _activeCategoryFilter = '';

  ProductProvider() {
    _initStreams();
  }

  void _initStreams() {
    // Listen to Firebase Cloud seamlessly
    _firestoreService.getProducts().listen((productsList) {
      if (productsList.isNotEmpty) _products = productsList;
      notifyListeners();
    }, onError: (e) {
      debugPrint("Firestore Permission Denied. Falling back to Mock Data. ($e)");
    });

    _firestoreService.getSpecialOffers().listen((offersList) {
      if (offersList.isNotEmpty) _specialOffers = offersList;
      notifyListeners();
    }, onError: (e) {
      debugPrint("Firestore Permission Denied. Falling back to Mock Data. ($e)");
    });
  }

  // Safe getters ensuring we never crash if Firestore is empty or denies access!
  List<Product> get allProducts => _products.isEmpty ? demoProducts : _products;
  List<SpecialOffer> get specialOffers => _specialOffers.isEmpty ? demoSpecialOffers : _specialOffers;

  String get currentSearchQuery => _searchQuery;

  List<Product> get popularProducts {
    return allProducts.where((p) => p.isPopular).toList();
  }

  List<Product> get favoriteProducts {
    return allProducts.where((p) => p.isFavourite).toList();
  }

  void toggleFavoriteStatus(int productId) {
    final index = allProducts.indexWhere((p) => p.id == productId);
    if (index >= 0) {
      allProducts[index].isFavourite = !allProducts[index].isFavourite;
      notifyListeners();
    }
  }

  // Used for alternating Layout Logic where 1 Offer -> N Matching Products
  List<Product> getProductsByCategory(String category) {
    if (category.isEmpty) return allProducts; // "All" category
    final lowerCat = category.toLowerCase();
    
    // Simulate smart category filtering since models don't have a strict category string
    if (lowerCat == "gaming" || lowerCat == "smartphone") {
      return allProducts.where((p) => p.title.contains("PS4") || p.title.toLowerCase().contains("logitech")).toList();
    }
    if (lowerCat == "fashion") {
      return allProducts.where((p) => p.title.contains("Nike") || p.title.contains("Gloves")).toList();
    }
    if (lowerCat == "flash") {
      // Return highly discounted or random products for flash deals
      return allProducts.where((p) => p.isPopular).toList();
    }
    return allProducts;
  }

  List<Product> get displayProducts {
    List<Product> filtered = allProducts;

    if (_activeCategoryFilter.isNotEmpty) {
       filtered = getProductsByCategory(_activeCategoryFilter);
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((p) => p.title.toLowerCase().contains(_searchQuery.toLowerCase()) || 
                        p.description.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return filtered;
  }

  void searchByKeyword(String query) {
    _searchQuery = query;
    _activeCategoryFilter = ''; 
    notifyListeners();
  }

  void filterByCategory(String category) {
    _activeCategoryFilter = category;
    _searchQuery = ''; 
    notifyListeners();
  }

  void resetFilters() {
    _searchQuery = '';
    _activeCategoryFilter = '';
    notifyListeners();
  }
}
