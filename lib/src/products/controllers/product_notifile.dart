import 'package:doula/src/products/models/products_model.dart';
import 'package:flutter/widgets.dart';

class ProductNotifier with ChangeNotifier {
  Products? _product;
  final List<Products> _products = []; // Initialize the list
  
  // Getter for single product
  Products? get product => _product;
  
  // Getter for products list
  List<Products> get products => _products;

  void setProducts(List<Products> products) {
    _product = products.isNotEmpty ? products[0] : null;
    notifyListeners();
  }

  void addProduct(Products product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Products product) {
    _products.remove(product);
    notifyListeners();
  }

  void clearProducts() {
    _products.clear();
    notifyListeners();
  }
  
  // Optionally add a method to set the single product directly
  void setProduct(Products product) {
    _product = product;
    notifyListeners();
  }


  // bool _descriptionExpanded = false;
  // bool get descriptionExpanded => _descriptionExpanded;

  // void toggleDescription() {
  //   _descriptionExpanded = !_descriptionExpanded;
  //   notifyListeners();
  // }

  // void setDescriptionExpanded() {
  //   _descriptionExpanded = true;
  //   notifyListeners();
  // }

  
}