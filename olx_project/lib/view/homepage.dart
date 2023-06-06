import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:olx_project/view/addpage.dart';
import 'package:olx_project/view/widget/customwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 36, 64),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 7),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,
                color: Colors.white,
                size: 30,
                ),
                Text("Kerala, India",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                  size: 30,
                  ),
                )
              ],
            ),
            
          ),
          Stack(
            children: 
              [Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 55, 97)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:6,left: 10),
                child: Container(
                  height: 40,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 36, 64),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white)
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Find Cars, Mobile Phones......",hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        suffixIcon: Icon(Icons.notifications_none,
                        color: Colors.white,
                        )
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 15),
                child: Row(
                  children: [
                    Text("Browse Categories",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),),
                    SizedBox(width: 130,),
                    Text("See all",style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10),
                child: Row(
                  children: [
                    Icon(Icons.maps_home_work_sharp,
                    color: Colors.amber,size: 60,
                    ),
                    SizedBox(width: 30,),
                    Icon(Icons.pedal_bike_outlined,
                    size: 60,color: Color.fromARGB(255, 7, 166, 201),
                    
                    ),
                    SizedBox(width: 30,),
                    Icon(Icons.tv_rounded,
                    size: 60,color: Colors.red,
                    ),
                    SizedBox(width: 30,),
                    Icon(Icons.pets_rounded,
                    size: 60,color: Colors.pinkAccent,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10),
                child: Row(
                  children: [
                    Text("Properties",style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(width: 40,),
                    Text("Bikes",style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(width: 43,),
                    Text("Electronics",style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(width: 43,),
                    Text("Pets",style: TextStyle(
                      color: Colors.white
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("col").snapshots(),
                builder: (context, snapshot) {
              
                  if(snapshot.hasData){
                    var data=snapshot.data!.docs;
              
                     return Container(
                      height: 430,
                      width: 400,
                       child: ListView.separated(itemBuilder: (context, index) {
                                         
                       
                                         return customwidget(photo:data[index]["images"]
                                         , detail: data[index]["details"].toString(), price: data[index]["price"].toString());
                                       }, 
                                       separatorBuilder: (context, index) => Divider(), 
                                       itemCount: data.length),
                     );
                }
                else{
                  return Text(snapshot.hasError.toString());
                }
              
                  }
              
              )
          
              
            ],
          ),
          
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color:  Color.fromARGB(255, 1, 36, 64),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 5, 86, 127),
          child: InkWell(
            onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => addpage(),)),
            child: Icon(Icons.add,
            size: 35,color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}