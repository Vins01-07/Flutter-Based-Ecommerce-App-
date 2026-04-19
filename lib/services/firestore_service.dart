import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/special_offer.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Stream of Products from Cloud
  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        var data = doc.data();
        return Product(
          id: data['id'] ?? 0,
          title: data['title'] ?? '',
          price: (data['price'] ?? 0).toDouble(),
          description: data['description'] ?? '',
          images: List<String>.from(data['images'] ?? []),
          colors: (data['colors'] as List<dynamic>? ?? []).map((c) => Color(int.parse(c.toString(), radix: 16))).toList(),
          rating: (data['rating'] ?? 0).toDouble(),
          isFavourite: data['isFavourite'] ?? false,
          isPopular: data['isPopular'] ?? false,
          // Extract pseudo-category mapping used for the Alternating UI Feed
          // Since product model lacked "category", we fetch it dynamically from Firestore!
        );
      }).toList();
    });
  }

  // Stream of Offers from Cloud
  Stream<List<SpecialOffer>> getSpecialOffers() {
    return _db.collection('offers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        var data = doc.data();
        return SpecialOffer(
          category: data['category'] ?? '',
          image: data['image'] ?? '',
          numOfBrands: data['numOfBrands'] ?? 0,
        );
      }).toList();
    });
  }

  // One-Time Seeder from Dummy Data to actual Firestore Cloud!
  Future<void> seedDatabase() async {
    final productsRef = _db.collection('products');
    final offersRef = _db.collection('offers');

    try {
      // Seed products
      for (var product in demoProducts) {
        // Use combination of title and id to ensure uniqueness since mock data repeats IDs
        final docId = 'product_${product.id}_${product.title.replaceAll(' ', '_')}';
        
        // Identify category based on the title for the new alternating UI loop!
        String assumedCategory = (product.title.contains("PS4") || product.title.contains("Logitech")) ? "Smartphone" : "Fashion";
        
        await productsRef.doc(docId).set({
          'id': product.id,
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'rating': product.rating,
          'images': product.images,
          'colors': product.colors.map((c) => c.value.toRadixString(16)).toList(),
          'isFavourite': product.isFavourite,
          'isPopular': product.isPopular,
          'category': assumedCategory, 
        });
      }

      // Seed offers
      for (var offer in demoSpecialOffers) {
        final docId = offer.category;
        final doc = await offersRef.doc(docId).get();
        if (!doc.exists) {
          await offersRef.doc(docId).set({
            'category': offer.category,
            'image': offer.image,
            'numOfBrands': offer.numOfBrands,
          });
        }
      }
      debugPrint("Firebase Database Successfully Seeded with E-commerce Data!");
    } catch (e) {
      debugPrint("FIREBASE SEEDING ERROR permission denied: $e");
    }
  }
}
