import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx_project/view/homepage.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}
var priceCTR=TextEditingController();
var detailCTR=TextEditingController();

class _addpageState extends State<addpage> {
  File? images;
  ImagePicker pictures=ImagePicker();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 47, 83),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 80),
              child: Container(
                height: size.height*0.3,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: images==null?Center(
                  child: InkWell(
                    onTap: () => showDialog(context: context, builder: (context) {
                return AlertDialog(title: Text("choose 1"),actions: [
                  Row(
                    children: [
                      ElevatedButton(onPressed: () async{
                        XFile? file=await pictures.pickImage(source: ImageSource.gallery);
                        Navigator.pop(context);
                        setState(() {
                          if(file!=null){
                            images=File(file.path);
                          }
                        });
                      }, child: Text("Gallery")),
                      SizedBox(width: 15,),
                      ElevatedButton(onPressed: () async{
                        XFile? file1=await pictures.pickImage(source: ImageSource.camera);
                        Navigator.pop(context);
                        setState(() {
                          if(file1!=null){
                            images =File(file1.path);
                          }
                        });
                      }, child: Text("Cemara"))
                    ],
                  )
                ],);
              },),
                    child: Text("Add Photos",style: TextStyle(color: Colors.red),
                    ),
                  ),
                ):Image.file(images!,fit: BoxFit.fill,),
              ),
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Add Details",style: TextStyle(color: Colors.white,
              fontSize:20 
              ),),
            ),
            SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
             child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
               child: TextFormField(
                controller: priceCTR,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.currency_rupee_sharp,color: Colors.white,),
                  hintText: "Enter Price",hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                ),
               ),
             ),
           ),
            
            SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
             child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
               child: TextFormField( 
                controller: detailCTR, 
                decoration: InputDecoration(
                  hintText: "Enter Details",hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                ),
               ),
             ),
           ),
           SizedBox(height: 50,),
            Center(
              child: ElevatedButton(onPressed: ()async {
                // Reference storageRef = FirebaseStorage.instance.ref('images');
      // file = await _compressImage(file: images,);
      // await storageRef.putFile(images!);
      // final String downloadUrl = await storageRef.child("").getDownloadURL();
      // print("$downloadUrl asfdbsdjhfbdhsfsdhfthis >>>>>>>>>>>>>>>>>");
      // return downloadUrl;
                var imagestore=FirebaseStorage.instance.ref().child("images$detailCTR.text");
                await imagestore.putFile(images!);

                String imageurl=await imagestore.getDownloadURL();
                print("sdfkjsdfjsdfjksdfbsdjkf this is<<<<<<<<<<<<<<$imageurl");
                FirebaseFirestore.instance.collection("col").add(
                  {
                    "images":imageurl,                   
                    "price":priceCTR.text,
                    "details":detailCTR.text
                  }
                );
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => homepage(),));
              },
               child: Text("Done"),
               ),
            )
          ],
        ),
      ),
    );
  }
}