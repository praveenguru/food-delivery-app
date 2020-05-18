import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/food.dart';

import 'home_page.dart';

class MainPage extends StatelessWidget{
  List<Food> food = [
    Food(foodName: "Appetizers", image: "images/food1.jpg"),
    Food(foodName: "The Main Food", image: "images/food2.jpg"),
    Food(foodName: "Dessert", image: "images/food3.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Hello, Praveen",style: TextStyle(fontSize: 14,color: Colors.grey.shade700),),
                        SizedBox(height: 8,),
                        Text("Choose your food today",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("images/image.jpg",height: 50,width: 50,fit: BoxFit.cover,),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.orange,),
                        hintText: "Search...",
                        suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey.shade500,),
                        filled: true,
                        fillColor: Color(0xfff4f5f9),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xfff4f5f9),
                            )
                        )
                    )
                ),
                SizedBox(height: 40,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("images/banner.jpg",height: 200,width: double.infinity,fit: BoxFit.cover,),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Food categories",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("View all",style: TextStyle(fontSize: 14,color: Colors.orange),),
                  ],
                ),
                SizedBox(height: 20,),
                ListView.builder(
                  itemCount: food.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomePage(text: food[index].foodName,);
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            color: Color(0xfff4f5f9),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(food[index].image,height: 44,width: 44,fit: BoxFit.cover,),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(food[index].foodName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  SizedBox(height: 10,),
                                  Text("24 Menus found",style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
    );
  }
}