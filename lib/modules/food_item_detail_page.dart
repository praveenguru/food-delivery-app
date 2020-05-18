import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodItemDetailPage extends StatefulWidget{
  String image;
  String text;
  FoodItemDetailPage({this.image,this.text});
  @override
  _FoodItemDetailPageState createState() => _FoodItemDetailPageState();
}

class _FoodItemDetailPageState extends State<FoodItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(widget.image,height: 400,width: double.infinity,fit: BoxFit.cover,),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 14,),
                          Text("\$120",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                        height: 40,
                        child: FlatButton(
                          onPressed: (){},
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text("Add to cart",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star,size: 16,color: Colors.amber,),
                      Icon(Icons.star,size: 16,color: Colors.amber,),
                      Icon(Icons.star,size: 16,color: Colors.amber,),
                      Icon(Icons.star,size: 16,color: Colors.amber,),
                      Icon(Icons.star,size: 16,color: Colors.grey.shade500,),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                Divider(color: Colors.grey.shade500,height: 1,),
                SizedBox(height: 24,),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text("DESCRIPTION",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text("       "+"Chicken Biryani is a delicious rich dish loaded with spicy marinated chicken, caramelized onions, and flavoral saffron rice. For my biryani, i simplify the order of operations, while retaining the traditional approach to assemble it",style: TextStyle(fontSize: 14,height: 1.7),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                  child: Text("INGREDIENTS",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey.shade700),),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Text("       "+"Chicken Biryani is a delicious rich dish loaded with spicy marinated chicken, caramelized onions, and flavoral saffron rice. For my biryani, i simplify the order of operations, while retaining the traditional approach to assemble it",style: TextStyle(fontSize: 14,height: 1.7),),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16,top: 40),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black87.withOpacity(0.7),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}