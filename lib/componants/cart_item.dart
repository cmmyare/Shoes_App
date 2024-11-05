
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/cart.dart';
import 'package:shoes_app/models/shoe.dart';

class CarItem extends StatefulWidget {
  Shoe shoe;
   CarItem({super.key,required this.shoe});

  @override
  State<CarItem> createState() => _CarItemState();
}

class _CarItemState extends State<CarItem> {
  // rmeove item from cart
  void removeItemFromCart(){
    Provider.of<cart>(context,listen: false).removeItemFromCart(widget.shoe);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          icon:const Icon(Icons.delete),
          onPressed:removeItemFromCart, 
        ),
      ),
    );
  }
}