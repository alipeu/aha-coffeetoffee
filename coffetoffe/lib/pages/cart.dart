import 'package:flutter/material.dart';
import 'package:coffetoffe/components/cartProduct.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown,
        title: Text('Your Shopping Cart'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search, 
              color: Colors.white,
            ), 
            onPressed: (){}
          ),
        ],
      ),

      body: new CartProducts(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text("Total:"),
                subtitle: new Text("Rp500"),
              ),
            ),
            Expanded(
              child: new MaterialButton(
                onPressed: (){},
                child: new Text(
                  "Checkout", 
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}