import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/food.dart';
import 'package:fooddeliveryapp/modules/food_item_detail_page.dart';

class HomePage extends StatefulWidget{
  String text; 
  HomePage({this.text});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> food = [
    Food(foodName: "Chicken Tandoori", image: "images/chicken.jpeg"),
    Food(foodName: "Chicken Biryani", image: "images/biryani.png"),
    Food(foodName: "Chicken Roll", image: "images/chicken1.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,size: 28,),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("images/image.jpg",height: 45,width: 45,fit: BoxFit.cover,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20,bottom: 30),
                child: Text(widget.text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.shade400,
                  labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                  unselectedLabelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  tabs: <Widget>[
                    Tab(
                      text: "New",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Tab(
                        text: "Popular",
                      ),
                    ),
                    Tab(
                      text: "Tasty",
                    ),
                  ],
                  isScrollable: true,
                  indicator: CircleIndicator(color: Colors.orange, radius: 3),
                ),
              ),
              SizedBox(height: 30,),
              ListView.builder(
                itemCount: food.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 20,right: 20),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return FoodItemDetailPage(image: food[index].image,text: food[index].foodName,);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(food[index].image,height: 250,width: double.infinity,fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(food[index].foodName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 12,),
                                  Text("\$120",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleIndicator extends Decoration{
  BoxPainter painter;
  CircleIndicator({@required Color color,@required double radius}):painter = CirclePainter(color,radius);
  @override
  BoxPainter createBoxPainter([onChanged]) => painter;
}

class CirclePainter extends BoxPainter{
  Paint _paint;
  double radius;
  CirclePainter(Color color,this.radius):_paint = Paint()
  ..color = color
  ..isAntiAlias = true;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = offset + Offset(configuration.size.width/2, configuration.size.height-radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}