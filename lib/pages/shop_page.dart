import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/componants/shoe_tile.dart';
import 'package:shoes_app/models/cart.dart';
import 'package:shoes_app/models/shoe.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<cart>(context, listen: false).addItemToCart(shoe);
    // alert user changes
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 38, 226, 5),
              title: const Text(
                "Successfully added",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                // done icon
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.done,
                      color: Color.fromARGB(255, 99, 4, 241),
                      size: 40,
                    )),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<cart>(
        builder: (context, value, child) => Column(
              children: [
                // sear bar
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                // mesage
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    'Everyone flies... Some fly longer than others',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                // shoes
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hot Picks 🔥",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //create a shoe

                      Shoe shoe = value.getShoeList()[index];

                      //return shoes
                      return ShoeTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 30.0, left: 25, right: 25),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}
