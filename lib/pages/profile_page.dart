import 'package:flutter/material.dart';
import 'package:shoes_app/componants/profile_tile.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[200],
     body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "lib/images/pro2.jpeg",
                    )),
              ),
             const SizedBox(height: 25,),
             const Text("Eng Abdullahi Dere",
             style: TextStyle(fontWeight: FontWeight.bold,
             fontSize: 20),
             ),
             const Text("cmmyare24@gmail.com",
             style: TextStyle(
             fontSize: 17),
             ),
              const SizedBox(height: 15,),
             SizedBox(
              width: 200,
               child: ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  side: BorderSide.none,
                  shape:const StadiumBorder(),
                  ),
                child: const Text("Edit Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17
                ),
                )),
             ),
          const SizedBox(height: 30,),
          const Divider(),
          const SizedBox(height: 10,),
          
          // profile Tile from Components page
           profileTile(
            text: "Settings",
            icon: Icons.settings,
           ),
          profileTile(
            text: "Billing Data",
            icon: Icons.report,
           ),
           profileTile(
            text: "User Management",
            icon: Icons.person,
           ),
         const  Divider(),
           profileTile(
            text: "Information",
            icon: Icons.book,
           ),
            profileTile(
            text: "Logout",
            icon: Icons.logout,
           ),
            ],
          ),
        ),
      ),
     ),
    );
  }
}
