import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var cartProducts = [
    {
      "name": "Coffee", 
      "picture": "images/prod_cup.png",
      "price": 85,
      "size": "L",
      "qty": 1,
    },
    {
      "name": "Sandwich", 
      "picture": "images/prod_sandwich.png",
      "price": 85,
      "size": "L",
      "qty": 2,
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cartProductName: cartProducts[index]["name"],
          cartProductPicture: cartProducts[index]["picture"],
          cartProductPrice: cartProducts[index]["price"],
          cartProductSize: cartProducts[index]["size"],
          cartProductQty: cartProducts[index]["qty"],
        );
      }
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName;
  final cartProductPicture;
  final cartProductPrice;
  final cartProductSize;
  final cartProductQty;
  
  SingleCartProduct({
    this.cartProductName,
    this.cartProductPicture,
    this.cartProductPrice,
    this.cartProductSize,
    this.cartProductQty,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          cartProductPicture,
          width: 80.0,
          height: 100.0,
        ),
        title: new Text(cartProductName),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Text(
                    cartProductSize, 
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Qty:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Text(
                    "$cartProductQty",
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ],
            ),

            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "Rp$cartProductPrice",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}