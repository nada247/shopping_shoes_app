import 'package:flutter/material.dart';
import 'package:shopping_shoes/animation.dart';
import 'package:shopping_shoes/shoes_page.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Shoes" ,style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.notifications_none , color: Colors.black,), ) ,
          IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart , color: Colors.black,), ) ,
        ],
      ),
      //-------------------------------------------------------------------------
      backgroundColor: Colors.white,
      body: ListView(
        children: [Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    makeItem(title: "All"),
                    AspectRatio(
                      aspectRatio: 3/1 ,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),child: Center(child: Text("Sneakers" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20) ,)),
                      ),
                    ),
                    makeItem(title: "Football"),
                    makeItem(title: "Soccer"),
                    makeItem(title: "Golf"),
                  ],
                ),
              ) ,
              //---------------------------------------------------------------------------------
              SizedBox(height: 20,),
              item(image: 'assets/images/shop2.jpg',name: 'Nike' ,price: "100\$", tag: "blue" , context: context),
              item(image: 'assets/images/shop.jpg' ,name: 'Adidas' ,price: "250\$", tag: "white" , context: context),
              item(image: 'assets/images/shop1.jpg' ,name: 'Nike' , price: "300\$",tag: "red" , context: context),
            ],
          ),
        ),],
      ),

    );
  }


  Widget item ({image,name,price , tag  , context}){
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ShoesPage(image: image, tag: tag,)));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    offset: Offset(0, 10)
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1 ,Text("Sneakers", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),
                        FadeAnimation(1 ,Text(name, style: TextStyle(color: Colors.white, fontSize: 20),)),

                      ],
                    ),
                  ),
                  FadeAnimation(1 ,Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, size: 20,),
                    ),
                  ))
                ],
              ),
              FadeAnimation(1 ,Text(price, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
  Widget makeItem({title}){
    return AspectRatio(
      aspectRatio: 2.2/1 ,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),child: Center(child: Text(title , style: TextStyle(color: Colors.black , fontSize: 18),)),
      ),
    );
  }

}
