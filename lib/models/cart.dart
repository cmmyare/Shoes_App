import 'package:flutter/material.dart';
import 'package:shoes_app/models/shoe.dart';

class cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: "Zoom Freak",
      price: "180",
      description: "Shinnig Shoes",
      imagePath: 'lib/images/zoomfreak2.png',
    ),
     Shoe(
      name: "Ktdrey",
      price: "290",
      description: "Shinnig Shoes",
      imagePath: 'lib/images/ktdrey.png',
    ),
     Shoe(
      name: "Kyrie",
      price: "399",
      description: "Shinnig Shoes",
      imagePath: 'lib/images/kyrie1.png',
    ),
     Shoe(
      name: "Air Jordan",
      price: "299",
      description: "Shinnig Shoes",
      imagePath: 'lib/images/jordan2.png',
    ),
    
  ];
  // list of items in user cart
 List<Shoe> userCart =[];
  // get list of shoes for sale
List<Shoe> getShoeList(){
  return shoeShop;
}
  // get cart
List<Shoe> getUserCart(){
  return userCart;
}
  // add items to cart
void addItemToCart(Shoe shoe){
  userCart.add(shoe);
  notifyListeners();
}
  // remove items from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}
