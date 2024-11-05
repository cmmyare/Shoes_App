
import 'package:flutter/material.dart';
import 'package:shoes_app/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
   ShoeTile({super.key,required this.shoe,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath),
            ),
          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(shoe.description,
            style: TextStyle(color: Colors.grey[600]),),
          ),
          // Name and price
         Padding(
           padding: const EdgeInsets.only(left: 25.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //name
                  Text(shoe.name,
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                    ),
              const  SizedBox(height: 5,),
                  //price
                  Text(
                    '\$${shoe.price}'),
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding:const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )
                  ),
                  child:const Icon(Icons.add,color: Colors.white,)),
              ),
            ],
           ),
         )
        

          // botton to card

        ],
      ),
    );
  }
}