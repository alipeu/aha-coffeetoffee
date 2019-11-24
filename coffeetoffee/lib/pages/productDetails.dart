import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPicture;
  final productDetailOldPrice;
  final productDetailPrice;
  
  ProductDetails({
    this.productDetailName,
    this.productDetailPicture,
    this.productDetailOldPrice,
    this.productDetailPrice
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown,
        title: Text('Coffee Toffee'),
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
            onPressed: (){}
          ),
        ],
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.productDetailName, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,  
                    ),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "Rp${widget.productDetailOldPrice}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "Rp${widget.productDetailPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Buttons
          Row(
            children: <Widget>[
              // Size Button
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Size"),
                      ),
                      
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              // Quantity Button
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Quantity"),
                      ),
                      
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              // Buy Now Button
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.green,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Buy Now"),
                      ),
                      
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              // ATC Button
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Add to Cart"),
                      ),
                      
                      Expanded(
                        child: new Icon(Icons.add_shopping_cart),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}