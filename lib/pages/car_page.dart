import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/componants/cart_item.dart';
import 'package:shoes_app/models/cart.dart';
import 'package:shoes_app/models/shoe.dart';
import 'package:shoes_app/pages/payment.dart';

class carPage extends StatelessWidget {
  //void Function()? onTap;
  const carPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // heading
                  const Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.getUserCart().length,
                        itemBuilder: (context, index) {
                          // get individual shoes
                          Shoe individualShoe = value.getUserCart()[index];
                          // return the cart item
                          return CarItem(
                            shoe: individualShoe,
                          );
                        }),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PymentPage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pay Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
