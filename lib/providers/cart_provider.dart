import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<Cart> _cartItems = List.from(demoCarts); // Start with demo data locally!

  List<Cart> get items => _cartItems;

  int get itemCount => _cartItems.length;

  double get totalAmount {
    var total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.numOfItem;
    }
    return total;
  }

  void addToCart(Product product, int quantity) {
    // Local Instant Update (Optimistic UI)
    final index = _cartItems.indexWhere((c) => c.product.id == product.id);
    if (index >= 0) {
      _cartItems[index] = Cart(
        product: product, 
        numOfItem: _cartItems[index].numOfItem + quantity
      );
    } else {
      _cartItems.add(Cart(product: product, numOfItem: quantity));
    }
    notifyListeners();

    // Secure Cloud Real-Time Sync
    if (_auth.currentUser != null) {
      try {
        _db.collection('users').doc(_auth.currentUser!.uid)
            .collection('cart').doc(product.id.toString())
            .set({
          'productId': product.id,
          'quantity': _cartItems.firstWhere((c) => c.product.id == product.id).numOfItem,
        });
      } catch (e) {
        debugPrint("Cart Firebase Sync Failed: $e");
      }
    }
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((c) => c.product.id == product.id);
    notifyListeners();

    if (_auth.currentUser != null) {
      try {
        _db.collection('users').doc(_auth.currentUser!.uid)
            .collection('cart').doc(product.id.toString())
            .delete();
      } catch (e) {
         debugPrint("Cart Firebase Sync Failed: $e");
      }
    }
  }
  void clearCart() {
    _cartItems.clear();
    notifyListeners();

    if (_auth.currentUser != null) {
      try {
        _db.collection('users').doc(_auth.currentUser!.uid).collection('cart').get().then((snapshot) {
          for (DocumentSnapshot doc in snapshot.docs) {
            doc.reference.delete();
          }
        });
      } catch (e) {
         debugPrint("Cart Firebase Sync Failed: $e");
      }
    }
  }
}
