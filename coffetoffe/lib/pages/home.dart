import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:coffetoffe/components/horizontalListview.dart';
import 'package:coffetoffe/components/products.dart';
import 'package:coffetoffe/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Widget imageCarousel = new Container(
    //   height: 200.0,
    //   child: new Carousel(
    //     boxFit: BoxFit.cover,
    //     images: [
    //       AssetImage('images/car_espresso.jpg'),
    //       AssetImage('images/car_blended.jpg'),
    //       AssetImage('images/car_brewed.jpg'),
    //       AssetImage('images/car_bakery.jpg'),
    //       AssetImage('images/car_sandwich.jpg'),
    //     ],
    //     autoplay: false,
    //     // animationCurve: Curves.fastOutSlowIn,
    //     // animationDuration: Duration(milliseconds: 1000),
    //     dotSize: 4.0,
    //     dotBgColor: Colors.transparent,
    //     indicatorBgPadding: 4.0,
    //   ),
    // );
    
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown,
        title: Text('Coffe Toffe'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search, 
              color: Colors.white,
            ), 
            onPressed: (){}
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart, 
              color: Colors.white,
            ), 
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new ShoppingCart()));
            }
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Alif'), 
              accountEmail: Text('alif_hilmi@apps.ipb.ac.id'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.brown
              ),
            ),
          // body
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(
                Icons.home,
                color: Colors.brown,
              ),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(
                Icons.person,
                color: Colors.brown,
              ),
            ),
          ),
          
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.brown,
              ),
            ),
          ),
          
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new ShoppingCart()));
            },
            child: ListTile(
              title: Text('Shopping Cart'),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.brown,
              ),
            ),
          ),
          
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(
                Icons.favorite, 
                color: Colors.brown,
              ),
            ),
          ),
          
          Divider(),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(
                Icons.settings,
              ),
            ),
          ),
          
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(
                Icons.help,
              ),
            ),
          ),

          ],
        ),
      ),

      body: new Column(
        children: <Widget>[
          // imageCarousel,

          // padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Categories'),
            ), 
          ),

          // horizontal list view
          HorizontalList(),

          // padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0), 
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Recently viewed'),
            ),
          ),

          // grid view
          Flexible(
            child: Products()
          ),
          
        ],
      ),
    );
  }
}