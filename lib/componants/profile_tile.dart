import 'package:flutter/material.dart';

class profileTile extends StatelessWidget {
  String text;
  final IconData icon;
   profileTile({super.key, required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.lightBlue.withOpacity(0.1)
              ),
              child: Icon(icon,color: Colors.blue,),
            ),
            title:  Text(text,style: const TextStyle(
              fontSize: 17,
              color: Colors.black
            ),),
            trailing:Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1)
              ),
              child:Icon(Icons.chevron_right,
              size: 18,
              color: Colors.grey[700],),
            ),
          );
  }
}