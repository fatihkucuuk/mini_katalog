import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  // Sepetteki ürünler: key = product id
  final Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;

  // Sepete ürün ekle
  void addProduct(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += 1;
    } else {
      _items[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  // Sepetten ürün çıkar / adet azalt
  void decrease(Product product) {
    if (_items.containsKey(product.id)) {
      if (_items[product.id]!.quantity > 1) {
        _items[product.id]!.quantity -= 1;
      } else {
        _items.remove(product.id);
      }
      notifyListeners();
    }
  }

  // Sepetteki ürün adedini artır
  void increase(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += 1;
      notifyListeners();
    } else {
      addProduct(product);
    }
  }

  // Sepeti temizle
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Sepette toplam ürün sayısı
  int totalItems() {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }
}