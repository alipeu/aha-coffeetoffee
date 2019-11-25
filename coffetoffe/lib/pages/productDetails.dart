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
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("Size"),
                          content: new Text("Choose cup size"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                            )
                          ],
                        );
                      }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Size"),
                      ),
                      
                      Expanded(
                        child: new Icon(
                          Icons.arrow_drop_down,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Quantity Button
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Choose amount"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                            )
                          ],
                        );
                      }
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Quantity"),
                      ),
                      
                      Expanded(
                        child: new Icon(
                          Icons.arrow_drop_down,
                          color: Colors.brown,  
                        ),
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
                  child: new Text("Buy Now")
                ),
              ),

              new IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.brown,
                onPressed: (){},
              ),

              new IconButton(
                icon: Icon(Icons.favorite_border), 
                color: Colors.brown,
                onPressed: (){},
              ),
            ],
          ),

          Divider(),

          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),

          Divider(),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Product Name", 
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.productDetailName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}