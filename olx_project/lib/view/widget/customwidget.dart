import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class customwidget extends StatelessWidget {
   customwidget({super.key,required this.photo,required this.detail,required this.price});
   var photo;
  String price;
  String detail;

  // String get photo => null;
  @override
  Widget build(BuildContext context) {
    print(detail);
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        height: 140,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white),
          // color: Colors.amber
          
        ),
        child: Row(
          children: [
            Column(
              children: [
            Container(
              height: 135,
              width: 150,
              child: Image(image: NetworkImage("${photo}"),fit: BoxFit.fill,),
                      )
            ],),
            SizedBox(width: 10,height: 10,),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price: ${price.toString()}",style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(height: 8,),
                  Text("Details: ${detail.toString()}",style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}