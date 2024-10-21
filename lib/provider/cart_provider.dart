import 'package:flutter/material.dart';
import 'package:order2/models/cart_model.dart';
import 'package:collection/collection.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> cartItems = [];
  void add(CartModel item){
    cartItems.add(item);
    notifyListeners();
  }
  void removeAll(){
    cartItems.clear();
    notifyListeners();
  }
  void remove(CartModel item){
    final removedItem = cartItems.firstWhereOrNull((cartItem)=> cartItem.product.productId == item.product.productId);
    if(removedItem != null){
      cartItems.remove(removedItem);
    }
    notifyListeners();
  }


  void addQuantity(int index){
    final cart = cartItems[index];
    cart.quantity = cart.quantity + 1;
    cartItems[index] = cart;
    notifyListeners();
  }

 void minusQuantity(int index) {
  final cart = cartItems[index];

  if (cart.quantity > 1) {
    cart.quantity -= 1;
    cartItems[index] = cart;
  } else {
    remove(cart);
  }

  notifyListeners();
}
}